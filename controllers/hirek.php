<?php

class Hirek_Controller
{
    public $baseName = 'hirek';  // Meghatározni, hogy melyik oldalon vagyunk

    public function main(array $vars) // A router által továbbított paramétereket kapja
    {
        $hirek_model = new Hirek_Model();
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['cim']) && isset($_POST['bevezeto']) && isset($_POST['torzs'])) {
            $cim = $_POST['cim'];
            $bevezeto = $_POST['bevezeto'];
            $torzs = $_POST['torzs'];
            $felhasznaloId = $_SESSION['userid']; // Az aktuális felhasználó azonosítója

            try {
                $sikeresMentes = $hirek_model->hirMentes($cim, $bevezeto, $torzs, $felhasznaloId);
                if ($sikeresMentes) {
                    // Ha sikeres volt a mentés, lehetőség van átirányítani vagy visszajelzést adni
                    echo "Sikeres mentés! Frissítse az oldalt.";
                    exit();
                } else {
                    // Hiba a mentés során
                    echo "Hiba történt a mentés során!";
                }
            } catch (PDOException $e) {
                // Hiba a mentés során
                echo "Hiba történt a mentés során: " . $e->getMessage();
            }
        }

        $aloldal = isset($vars[0]) ? $vars[0] : "index";
        $hirek_model = new Hirek_Model();
        if ($aloldal == 'index') {
            $retData = $hirek_model->index();
            $view = new View_Loader($this->baseName . "_index_main");
            // Átadjuk a lekérdezett adatokat a nézetnek
            $view->assign('hirek', $retData['hirek']);
        } elseif (is_numeric($aloldal)) {
            $retData = $hirek_model->mutat($aloldal, $_SESSION['userid']);
            $view = new View_Loader($this->baseName . "_mutat_main");
            // Átadjuk a lekérdezett adatokat a nézetnek
            $view->assign('hir', $retData['hir']);
            $view->assign('velemenyek', $retData['velemenyek']);

            if (isset($retData['hir']['id'])) {
                // Ha 'hir' kulcs létezik, akkor folytasd
                $hirId = $retData['hir']['id'];

                if ($_SERVER["REQUEST_METHOD"] == "POST") {
                    if (isset($_POST['comment']) && !empty($_POST['comment'])) {
                        $felhasznaloId = $_SESSION['userid']; // Példa: A felhasználó azonosítója
                        $szoveg = $_POST['comment']; // Megkapjuk az űrlapról a hozzászólás szövegét

                        try {
                            $hirek_model->hozzaszolasMentes($hirId, $felhasznaloId, $szoveg);
                            // Sikeres mentés
                        } catch (PDOException $e) {
                            // Hiba a mentés során
                            echo "Hiba történt a mentés során: " . $e->getMessage();
                        }
                    } else {
                        // Hiba: Hozzászólás üres
                        echo "Hiba: Hozzászólás üres!";
                    }
                }
            } else {
                // Ha nincs 'hir' kulcs a visszatérített adatok között, kezeld le ezt a helyzetet
                echo "Hiba: 'hir' kulcs hiányzik a visszatérített adatokból!";
            }
        } else { // Hibakezelés
            // TODO
        }
    }
}

?>
