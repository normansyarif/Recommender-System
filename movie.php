<?php
/**
 * Created with PhpStorm.
 * Author: Norman Syarif
 * Date: 11/15/17
 * Time: 4:23 PM
 */

require_once('includes/init.php');

$userId = '16';
$id = $_GET['id'];
$results = $db->query("select * from movie where movieId=$id");

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
    <p>Rate film <?php echo $results[0]["title"] ?></p>
</div>

<div class="clear"></div>

<div class="container card main col-md-10 col-md-offset-1">
    <div class="row detail-container">

        <?php

        foreach ($results as $result) {
            echo '<div class="col-md-2 col-md-offset-2 movie-poster"><img src="images/' . $result["movieId"] . '.jpg" /><a target="_blank" href="https://www.youtube.com/results?search_query='.$result["title"].'+trailer"><button class="btn btn-warning btn-block btn-trailer">Tonton cuplikan</button></a></div>';
            echo '<div class="col-md-6 movie-details"><p class="movie-title">'.$result["title"].' ('.$result["year"].')</p><div class="stars"><input type="radio" name="star" class="star-1" id="star-1" value="1" /><label class="star-1" for="star-1">1</label><input type="radio" name="star" class="star-2" id="star-2" value="2" /><label class="star-2" for="star-2">2</label><input type="radio" name="star" class="star-3" id="star-3" value="3" /><label class="star-3" for="star-3">3</label><input type="radio" name="star" class="star-4" id="star-4" value="4" /><label class="star-4" for="star-4">4</label><input type="radio" name="star" class="star-5" id="star-5" value="5" /><label class="star-5" for="star-5">5</label><span></span></div><p class="text-rating">-/5</p><div class="clear"></div> <p class="description">'.$result["description"].'</p><a href="index.php"><button class="btn btn-default btn-sm">Kembali ke daftar film</button></a> </div>';
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
    $('input[name=star]').click(function() {
        var value = $('input[name=star]:checked').val();
        $.ajax({
            type: 'post',
            url: 'kirim_query.php',
            data: {
                movieId: '<?php echo $id ?>',
                rating: value
            },
            success: function (response) {
                $('.text-rating').html(response);
            }
        });
    });
</script>
</body>
</html>
