<?php


class Menu {
    public static $menu = array();

    public static function setMenu() {
        self::$menu = array();
        $connection = Database::getConnection();
        $stmt = $connection->query("select url, nev, szulo, jogosultsag from menu where jogosultsag like '".$_SESSION['userlevel']."' order by sorrend");
        while ($menuitem = $stmt->fetch(PDO::FETCH_ASSOC)) {
            self::$menu[$menuitem['url']] = array($menuitem['nev'], $menuitem['szulo'], $menuitem['jogosultsag']);
        }
    }

        public static function getMenu() {
            $submenu = "";
            $menu = "<ul class='navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4'>";
            foreach (self::$menu as $menuindex => $menuitem) {
                if ($menuitem[1] == "") {
                    $menu .= "<li class='nav-item'><a href='".SITE_ROOT.$menuindex."' class='nav-link active'>".$menuitem[0]."</a></li>";
                }
            }
            $menu .= "</ul>";

            if ($submenu != "") {
                $submenu = "<ul>".$submenu."</ul>";
            }

            return $menu.$submenu;
    }
}


class WasteSite {
    public static $sites = array();
    public static $wasteTypes = array();

    public static function setSites() {
        self::$sites = array();
        $connection = Database::getConnection();
        $stmt = $connection->query("SELECT * FROM hely");
        while ($siteItem = $stmt->fetch(PDO::FETCH_ASSOC)) {
            self::$sites[$siteItem['id']] = array($siteItem['kerulet'], $siteItem['cim']);
        }
    }

    public static function setWasteTypes() {
        self::$wasteTypes = array();
        $connection = Database::getConnection();
        $stmt = $connection->query("SELECT * FROM fajta");
        while ($wasteTypeItem = $stmt->fetch(PDO::FETCH_ASSOC)) {
            self::$wasteTypes[$wasteTypeItem['id']] = $wasteTypeItem['nev'];
        }
    }

    public static function getWasteSites() {
        $output = "";

      foreach (self::$sites as $siteId => $siteDetails) {
          $output .= "<div class='card mb-3 mx-4 border border-success mb-4'>";
          $output .= "<div class='card-body'>";

$output .= "<span class='badge bg-success' style='font-size: 20px;'>Id: $siteId</span>";
$output .= "<h6 class='card-title border-top mt-2 pt-2'>Kerület: {$siteDetails[0]}</h6>";
$output .= "<h6 class='card-title border-top border-bottom mt-2 pt-2'>Cím: {$siteDetails[1]}</h6>";


          $output .= "<div class='dropdown'>";
          $output .= "<button class='btn btn-success dropdown-toggle' type='button' id='dropdownMenuButton_$siteId' data-bs-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>";
          $output .= "Leadható hulladékok";
          $output .= "</button>";
          $output .= "<div class='dropdown-menu'  aria-labelledby='dropdownMenuButton_$siteId'>";

          $connection = Database::getConnection();
          $stmt = $connection->prepare("SELECT f.nev FROM gyujt g JOIN fajta f ON g.fajtaid = f.id WHERE g.helyid = :siteId");
          $stmt->bindParam(":siteId", $siteId, PDO::PARAM_INT);
          $stmt->execute();

          while ($wasteType = $stmt->fetch(PDO::FETCH_ASSOC)) {
              $output .= "<a class='dropdown-item' href='#'>{$wasteType['nev']}</a>";
          }

          $output .= "</div>";
          $output .= "</div>";

          $output .= "</div>";
          $output .= "</div>";
      }

        return $output;
    }
}
echo Menu::getMenu();
echo WasteSite::getWasteSites();

WasteSite::setSites();
WasteSite::setWasteTypes();
Menu::setMenu();

?>
