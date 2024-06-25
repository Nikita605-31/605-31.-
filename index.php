<?php
require "dbconnect.php";
$result = $conn->query("SELECT *  FROM Издание") ;
echo "<h2>Наименование изданий</h2>";
while ($row = $result->fetch()) {
    echo $row['Наименование']."<br>";

}