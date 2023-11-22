<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hulladekudvar Zrt!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <?php if($viewData['style']) echo '<link rel="stylesheet" type="text/css" href="'.$viewData['style'].'">'; ?>
</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg bg-success">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!">Hulladekudvar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <?php echo Menu::getMenu($viewData['selectedItems']); ?>

              <?php if($_SESSION['userid']) {?>Bejelentkezett: &nbsp</br>
                            <strong><?= $_SESSION['userlastname']." ".$_SESSION['userfirstname']."
                            (".$_SESSION['userloginname']."" ?>)</strong><?php } ?>

        </div>
    </div>
</nav>


    <?php if($viewData['render']) include($viewData['render']); ?>
<footer class="py-5 bg-success">
    <div class="container"><p class="m-0 text-center text-black">Copyright &copy; Hulladekudvar Zrt. 2023</p></div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
