<?php
/**
 * Created with PhpStorm.
 * Author: Norman Syarif
 * Date: 11/15/17
 * Time: 4:23 PM
 */

require_once('includes/init.php');

$userId = '16';
$r = new Recommendation();

?>

<html>
    <head>
        <?php require_once('includes/header.php') ?>
    </head>

    <body>

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Sistem Rekomendasi Film</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.php">Rate film</a></li>
                <li><a href="rekomendasi.php">Rekomendasi</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Selamat datang, <b>Pengguna</b></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Keluar</a></li>
            </ul>
        </div>
    </nav>

    <div class="container card msg col-md-10 col-md-offset-1 alert alert-warning">
        <p>Berikan nilai minimal 10 film untuk mulai mendapatkan rekomendasi. Anda telah menilai <?php echo $r->getNumRating($userId) ?> film.</p>
    </div>

    <div class="clear"></div>

    <div class="container card main col-md-10 col-md-offset-1">
        <div class="row">

            <?php
                $results = $db->query("select * from movie");
                foreach ($results as $result) {
                    echo '<div class="movie col-md-2"><img class="movie-img" src=images/' . $result["movieId"] . '.jpg /><p class="main-title"><a href="movie.php?id=' . $result["movieId"] . '">' . $result["title"] . '</a></p> </div>';
                }
            ?>

        </div>
    </div>

    <div class="clear"></div>

    <footer>
        <?php require_once('includes/footer.php') ?>
    </footer>

    <div class="clear"></div>

    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    </body>
</html>
