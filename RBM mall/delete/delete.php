
<?php      
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mall";

$conn = new mysqli($servername, $username, $password, $dbname); 

if(! $conn ) {
    die("Connection failed: " . $conn->connect_error);
    echo "Connection denied" ;
}

$emp_id = $_GET['id'];

$sql = "UPDATE employee_details SET status='Inactive' WHERE id='".$emp_id."';" ;
echo $sql;
$result = ($conn->query($sql)) ;

if(! $result ) {
    die('Could not delete data: ' . $conn->connect_error);
}
echo "Data deleted successfully\n";

$conn->close();
?>
