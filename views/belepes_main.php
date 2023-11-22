 <h2 class="text-center mt-5">Regisztráció</h2>
    <form action="regisztral" method="post">
        <div class="row">
            <div class="col text-end">
                <label class="form-label mt-3">Vezetéknév:</label>
            </div>
            <div class="col">
                <div class="mb-3">
                    <input type="text" name="csaladi_nev" id="csaladi_nev" required class="form-control"/>
                </div>
            </div>
            <div class="col">
            </div>
        </div>
        <div class="row">
            <div class="col text-end">
                <label class="form-label mt-3">Utónév:</label>
            </div>
            <div class="col">
                <div class="mb-3">
                    <input type="text" name="utonev" id="utonev" required class="form-control"/>
                </div>
            </div>
            <div class="col">
            </div>
        </div>
        <div class="row">
            <div class="col text-end">
                <label class="form-label mt-3">Felhasználónév:</label>
            </div>
            <div class="col">
                <div class="mb-3">
                    <input type="text" name="bejelentkezes" id="bejelentkezes" required class="form-control" />
                </div>
            </div>
            <div class="col">
            </div>
        </div>
        <div class="row">
            <div class="col text-end">
                <label class="form-label mt-3">Jelszó:</label>
            </div>
            <div class="col">
                <input type="password" name="jelszo" id="jelszo" required class="form-control">
            </div>
            <div class="col">
            </div>
        </div>
        <div class="row">
            <div class="col">
            </div>
            <div class="col-4 text-center">
                <button type="submit" name="submit" class="btn btn-outline-success text-center">Regisztrálás</button>
            </div>
            <div class="col">
            </div>
        </div>
    </form>
</div>


<div class="container">
    <h2 class="text-center mt-5">Belépés</h2>
    <form action="<?= SITE_ROOT ?>beleptet" method="post">
        <div class="row">
            <div class="col text-end">
                <label class="form-label mt-3">Felhasználó:</label>
            </div>
            <div class="col">
                <div class="mb-3">
                    <input type="text" name="login" id="login" required pattern="[a-zA-Z][\-\.a-zA-Z0-9_]{3}[\-\.a-zA-Z0-9_]+" class="form-control"/>
                </div>
            </div>
            <div class="col">
            </div>
        </div>
        <div class="row">
            <div class="col text-end">
                <label class="form-label mt-3">Jelszó:</label>
            </div>
            <div class="col">
                <input type="password" name="password" id="password" required pattern="[\-\.a-zA-Z0-9_]{4}[\-\.a-zA-Z0-9_]+" class="form-control">
            </div>
            <div class="col">
            </div>
        </div>
        <div class="row">
            <div class="col">
            </div>
            <div class="col-4 text-center">
                <button type="submit" class="btn btn-outline-success text-center">Belépés</button>
            </div>
            <div class="col">
            </div>
        </div>
    </form>
    <hr class="new1">


<h2><br><?= (isset($viewData['uzenet']) ? $viewData['uzenet'] : "") ?><br></h2>