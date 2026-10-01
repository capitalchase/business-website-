<?php

/*
|--------------------------------------------------------------------------
| DATABASE CONFIGURATION
|--------------------------------------------------------------------------
|
| Replace these values with the database credentials provided by
| your hosting provider.
|
*/

$db_host = "localhost";

$db_name = "business_website";

$db_user = "YOUR_DATABASE_USERNAME";

$db_pass = "YOUR_DATABASE_PASSWORD";


/*
|--------------------------------------------------------------------------
| DATABASE CONNECTION
|--------------------------------------------------------------------------
*/

$conn = new mysqli(
    $db_host,
    $db_user,
    $db_pass,
    $db_name
);


/*
|--------------------------------------------------------------------------
| CONNECTION ERROR
|--------------------------------------------------------------------------
*/

if ($conn->connect_error) {

    die(
        "Database connection failed."
    );

}


/*
|--------------------------------------------------------------------------
| CHARACTER SET
|--------------------------------------------------------------------------
*/

$conn->set_charset("utf8mb4");

?>
