<div class="container bg-success p-4">

    <?php if ($_SESSION['userid']) { ?>

        <div class="row">
            <?php foreach ($viewData['hirek'] as $hir) { ?>
                <div class="col-md-5">
                    <div class="card mb-4">
                        <div class="card-body">
                          <h1 class="card-title"><a href="<?php echo SITE_ROOT ?>hirek/<?php echo $hir['id']; ?>" class="text-success"><?php echo $hir['cim']; ?></a></h1>

                            <p class="card-text"><?php echo $hir['bejelentkezes']; ?> - <?php echo $hir['ido']; ?></p>
                            <p class="card-text"><?php echo $hir['bevezeto']; ?></p>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>

        <form method="post" action="/web2/hirek">
            <div class="container">
                <label for="cim" class="form-label text-light">Hír címe</label>
                <input type="text" class="form-control mb-3" name="cim" id="cim" />

                <label for="bevezeto" class="form-label text-light">Bevezető</label>
                <textarea class="form-control mb-3" name="bevezeto" id="bevezeto" rows="3"></textarea>

                <label for="torzs" class="form-label text-light">Hír szövege</label>
                <textarea class="form-control mb-3" name="torzs" id="torzs" rows="6"></textarea>

                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-outline-light text-center">Küldés</button>
                </div>
            </div>
        </form>

    <?php } else { ?>

        <p class="text-light">A híreink megtekintéséhez kérem <a href="/web2/belepes" class="text-light">jelentkezzen be</a>.</p>

    <?php } ?>

</div>
