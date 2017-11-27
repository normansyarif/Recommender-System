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

$numRating = $r->getNumRating($userId);

if($numRating < 10) {
    echo "<script>alert('Mohon rating minimal 10 film dahulu sebelum dapat melihat rekomendasi.')</script>";
    echo "<a href=index.php>Kembali</a>";
    die();
}

$recommendations = $r->getRecommendation($userId);
$neighbors = $r->getNeighbors();
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
            <li><a href="index.php">Rate film</a></li>
            <li class="active"><a href="rekomendasi.php">Rekomendasi</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Selamat datang, <b>Pengguna</b></a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Keluar</a></li>
        </ul>
    </div>
</nav>

<div class="container card msg col-md-10 col-md-offset-1 alert alert-warning">
    <p>Rekomendasi film dari <b><?php echo $neighbors[0]["name"] . " (" . round($neighbors[0]["pearson"], 0) . "%)" ?></b> dan <b><?php echo $neighbors[1]["name"] . " (" . round($neighbors[1]["pearson"], 0) . "%)"?></b>.</p>
</div>

<div class="clear"></div>

<div class="container card main col-md-10 col-md-offset-1">
    <div class="row ">
        <?php
        foreach ($recommendations as $recommendation) {
            $movieId = $recommendation["title"];
            $score = $recommendation["score"];
            $movieTitle = $db->query("select title from movie where movieId='" . $movieId . "'")[0]["title"];
            echo '<div class="movie col-md-2"><img class="movie-img" src=images/' . $movieId . '.jpg /><p class="main-title"><a href="movie.php?id=' . $movieId . '">' . $movieTitle . '</a></p><p class="nilai-knn">Nilai ' . round($score, 2) . '</p> </div>';
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
<script>
</script>
</body>
</html>
