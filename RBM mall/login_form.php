<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mall" ;

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

if($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
else
{
    echo "Connection Success<br>";
    if(isset($_POST["employee_id"], $_POST["password"])) 
    {
        $name = $_POST["employee_id"]; 
        $password = $_POST["password"];

        $result1 = mysqli_query($conn,"SELECT password FROM login_details WHERE employee_id = '$name'");
        $result = mysqli_fetch_row($result1);
        if($password == $result[0]) 
        {
            echo "<h1>logged in</h1>";
//            sleep(5);
            session_start();
            $_SESSION["eid"] = $name;
            header("refresh: 1; URL=admin_login.php");
        }
        else
            echo'The username or password are incorrect!';
    } 
}
$conn->close();
?>
