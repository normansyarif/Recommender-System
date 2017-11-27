<?php
/**
 * Created with PhpStorm.
 * Author: Norman Syarif
 * Date: 11/15/17
 * Time: 4:36 PM
 */

spl_autoload_register(function($class){
   include 'Classes/' . $class . '.php';
});

$db = new DB();