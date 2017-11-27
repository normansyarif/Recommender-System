<?php
/**
 * Created with PhpStorm.
 * Author: Norman Syarif
 * Date: 11/15/17
 * Time: 7:43 PM
 */

class Recommendation {

    function __construct($k = 2, $n = 6) {
        $this->k = $k;
        $this->n = $n;
        $this->userIdToName = array();
        $this->movieIdToTitle = array();
        $this->neighbors = array();
        $this->data = array();
        $this->loadDataset();
    }

    function loadDataset(){
        $db = new DB();

        $results = $db->query('select * from rating');
        foreach($results as $result) {
            $userId = $result["userId"];
            $movieId = $result["movieId"];
            $rating = $result["rating"];

            if(in_array($userId, $this->data)) $this->data[$userId];
            else $currentRatings = array();

            $currentRatings[$movieId] = $rating;
            $this->data[$userId][] = $currentRatings;
        }

        $results = $db->query('select * from movie');
        foreach ($results as $result) {
            $movieId = $result["movieId"];
            $title = $result["title"];
            $this->movieIdToTitle[$movieId] = $title;
        }

        $results = $db->query('select * from user');
        foreach ($results as $result) {
            $userId = $result["userId"];
            $name = $result["name"];
            $this->userIdToName[$userId] = $name;
        }
    }

    function pearson($rating1, $rating2)
    {
        $sum_xy = 0;
        $sum_x = 0;
        $sum_y = 0;
        $sum_x2 = 0;
        $sum_y2 = 0;
        $n = 0;

        $i = 0;
        while (current($rating1)) {
            $movie1 = key($rating1[$i]);

            $j = 0;
            while (current($rating2)) {
                $movie2 = key($rating2[$j]);
                if ($movie1 == $movie2) {
                    $n += 1;
                    $x = $rating1[$i][$movie1];
                    $y = $rating2[$j][$movie2];
                    $sum_xy += $x * $y;
                    $sum_x += $x;
                    $sum_y += $y;
                    $sum_x2 += pow($x, 2);
                    $sum_y2 += pow($y, 2);
                    break;
                }
                $j++;
                next($rating2);
            }

            reset($rating2);

            $i++;
            next($rating1);

        }

        if ($n == 0) return 0;

        $denominator = (sqrt($sum_x2 - pow($sum_x, 2) / $n) * sqrt($sum_y2 - pow($sum_y, 2) / $n));
        if ($denominator == 0) return 0;
        else return ($sum_xy - ($sum_x * $sum_y) / $n) / $denominator;

    }

    function nearestNeighbor($username) {
        $distances = array();
        while(current($this->data)) {
            if(key($this->data) != $username){
                $distance = $this->pearson($this->data[$username], $this->data[key($this->data)]);
                $distances[key($this->data)] = $distance;
            }
            next($this->data);
        }
        arsort($distances);
        return $distances;
    }

//    function inputData($userId, $movieId, $rating) {
//        if(in_array($userId, $this->data)) $currentRatings = $this->data[$userId];
//        else $currentRatings = array();
//
//        $currentRatings[$movieId] = $rating;
//        $this->data[$userId][] = $currentRatings;
//    }


    function inputData($userId, $movieId, $rating) {
        $db = new DB();
        $query = "insert into rating (userId, movieId, rating) values($userId, $movieId, $rating)";
        if(!$db->writeQuery($query)) {
            $this->updateData($userId, $movieId, $rating);
        }
    }

    function updateData($userId, $movieId, $rating) {
        $db = new DB();
        $db->writeQuery("update rating set rating=$rating where userId=$userId and movieId=$movieId");
    }

    function convertIdToTitle($id) {
        return $this->movieIdToTitle[$id];
    }

    function convertIdToName($id) {
        return $this->userIdToName[$id];
    }

    function getNeighbors() {
        $arr = array();
        foreach ($this->neighbors as $neighbor => $val) {
            $arr[] = array('name' => $this->convertIdToName($neighbor), 'pearson' => $val * 100);
        }
        return $arr;
    }

    function getNumRating($userId) {
        $db = new DB();
        return $db->getNumRows("select * from rating where userId='" . $userId . "'");
    }

    function getRecommendation($userId) {
        $recommendations = array(); //key=movie, value=score

        $nearest = $this->nearestNeighbor($userId);
        $userRatings = $this->data[$userId];

        $userMovieList = array();
        $a = 0;
        foreach ($userRatings as $userRating => $val) {
            $userMovieList[] = array('movieId' => key($userRatings[$a]), 'rating' => $val[key($userRatings[$a])]);
            $a++;
        }

        $totalDistance = 0;

        $neighbors = array();
        foreach($nearest as $key => $val) {
            $neighbors[] = array($key => $val);
        }

        // Cari total jarak masing-masing neighbor terus urutkan
        $i = 0;
        while(current($neighbors)) {
            if($i < $this->k) $totalDistance += $nearest[key($neighbors[$i])];
            else break;
            $i++;
            next($neighbors);
        }
        reset($neighbors);

        // Cari beban masing-masing tetangga
        // cari juga neighborId untuk mencari rating tetangga
        // array neighbors berisi key=neighborId, value=weight
        $i = 0;
        while(current($neighbors)) {
            if($i < $this->k) {
                $weight = $nearest[key($neighbors[$i])] / $totalDistance;
                $neighborId = key($neighbors[$i]);
                $this->neighbors[$neighborId] = $weight;
                $neighborRatings = $this->data[$neighborId];

                $neighborMovieList = array();
                $a = 0;
                foreach ($neighborRatings as $neighborRating => $val) {
                    $neighborMovieList[] = array('movieId' => key($neighborRatings[$a]), 'rating' => $val[key($neighborRatings[$a])]);
                    $a++;
                }

                // Cek apakah movie2 ada di movie1
                foreach ($neighborMovieList as $neighborMovie) {
                    $movieId = $neighborMovie['movieId'];
                    $movieRating = $neighborMovie['rating'];
                    if((in_array($movieId, array_column($userMovieList, 'movieId'))) == false) {

                        // Cek apakah movie2 ada di recommendation list
                        $recommendationList = array();

                        foreach ($recommendations as $recommendation => $val) {
                            $recommendationList[] = array('movieId' => $recommendation, 'score' => $val);
                        }

                        if((in_array($movieId, array_column($recommendationList, 'movieId'))) == false) {
                            // tambah ke array
                            $recommendations[$movieId] = $movieRating * $weight;
                        }else{
                            // update array
                            $recommendations[$movieId] = $recommendations[$movieId] + $movieRating * $weight;
                        }
                    }
                }
            }
            $i++;
            next($neighbors);

        }

        arsort($recommendations);

        $finalRecommendations = array();
        $n = 0;
        foreach ($recommendations as $recommendation => $val) {
            if($n < $this->n) {
                $finalRecommendations[] = array('title' => $recommendation, 'score' => $val);
                $n++;
            }else break;
        }

        return $finalRecommendations;

    }


}