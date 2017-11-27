<?php
/**
 * Created with PhpStorm.
 * Author: Norman Syarif
 * Date: 11/17/17
 * Time: 9:07 PM
 */

require_once('includes/init.php');

$userId = '16';

if(isset($_POST['rating'])) {

    $db = new DB();
    $r = new Recommendation();

    $movieId = $_POST['movieId'];
    $rating = $_POST['rating'];
    echo $rating . "/5";

    // Kirim ke database
    $r->inputData($userId, $movieId, $rating);
}