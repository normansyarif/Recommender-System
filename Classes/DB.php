<?php
/**
 * Created with PhpStorm.
 * Author: Norman Syarif
 * Date: 11/15/17
 * Time: 4:14 PM
 */

class DB {

    public function __construct($user = 'root', $password = '', $database = 'recommender', $host = '127.0.0.1') {
        $this->user = $user;
        $this->password = $password;
        $this->database = $database;
        $this->host = $host;
    }

    protected function connect() {
        return new mysqli($this->host, $this->user, $this->password, $this->database);
    }

    public function query($query) {
        $db = $this->connect();
        $result = $db->query($query);

        if($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
        }else{
            $data = "Nothing found!";
        }

        return $data;

    }

    public function writeQuery($query) {
        $db = $this->connect();
        if($db->query($query)) return true;
        else return false;
    }

    public function getNumRows($query) {
        $db = $this->connect();
        $result = $db->query($query);
        return $result->num_rows;
    }

}