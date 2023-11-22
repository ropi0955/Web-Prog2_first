<div class="container bg-success p-4 mb-4">

  <article class="hir text-light p-3 mb-4 border-bottom">
      <h1>
          <a href="<?php echo SITE_ROOT ?>hirek/<?php echo $viewData['hir']['id']; ?>" class="text-warning">
              <?php echo $viewData['hir']['cim']; ?>
          </a>
      </h1>
      <p><?php echo $viewData['hir']['bejelentkezes']; ?> - <?php echo $viewData['hir']['ido']; ?></p>
      <p><?php echo $viewData['hir']['torzs']; ?></p>
  </article>


    <section>
        <?php foreach ($viewData['velemenyek'] as $key => $velemeny) { ?>
            <div class="card mb-3">
                <div class="card-body">
                    <p><?php echo $velemeny['bejelentkezes']; ?> - <?php echo $velemeny['ido']; ?></p>
                    <p><?php echo $velemeny['torzs']; ?></p>
                </div>
            </div>
        <?php } ?>
    </section>

    <form method="post" action="/web2/hirek/<?php echo $viewData['hir']['id']; ?>">
        <div class="container">
            <label for="comment" class="form-label text-light">Szóljon hozzá!</label>
            <textarea class="form-control mb-3" name="comment" id="comment" rows="3"></textarea>
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-outline-light text-center">Küldés</button>
            </div>
        </div>
    </form>

</div>
