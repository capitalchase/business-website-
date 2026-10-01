<?php

require_once "includes/config.php";

echo "<!DOCTYPE html>";
echo "<html lang='en'>";
echo "<head>";
echo "<meta charset='UTF-8'>";
echo "<meta name='viewport' content='width=device-width, initial-scale=1.0'>";
echo "<title>Database Test</title>";

echo "<style>

body {
    font-family: Arial, sans-serif;
    background: #f5f7fa;
    padding: 40px 20px;
    color: #101722;
}

.test-box {
    max-width: 700px;
    margin: 0 auto;
    background: #ffffff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.08);
}

.success {
    background: #eaf8ef;
    color: #18733c;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 20px;
}

.error {
    background: #fbecec;
    color: #a52b2b;
    padding: 15px;
    border-radius: 8px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th,
td {
    padding: 12px;
    border-bottom: 1px solid #e5e9ef;
    text-align: left;
}

th {
    background: #f5f7fa;
}

</style>";

echo "</head>";
echo "<body>";

echo "<div class='test-box'>";

echo "<h1>Database Connection Test</h1>";

if ($conn->connect_error) {

    echo "<div class='error'>";
    echo "Database connection failed.";
    echo "</div>";

} else {

    echo "<div class='success'>";
    echo "<strong>Database connection successful.</strong><br>";
    echo "The website can connect to your MySQL database.";
    echo "</div>";

    /*
    |--------------------------------------------------------------------------
    | CHECK TABLES
    |--------------------------------------------------------------------------
    */

    $result = $conn->query("SHOW TABLES");

    if ($result) {

        echo "<h2>Database Tables</h2>";

        echo "<table>";

        echo "<tr>";
        echo "<th>#</th>";
        echo "<th>Table Name</th>";
        echo "</tr>";

        $number = 1;

        while ($row = $result->fetch_array()) {

            echo "<tr>";

            echo "<td>";
            echo $number;
            echo "</td>";

            echo "<td>";
            echo htmlspecialchars($row[0]);
            echo "</td>";

            echo "</tr>";

            $number++;
        }

        echo "</table>";

    } else {

        echo "<div class='error'>";
        echo "Connected to the database, but the tables could not be read.";
        echo "</div>";

    }

}

echo "</div>";

echo "</body>";
echo "</html>";

?>
