<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mall";

$conn = mysqli_connect($servername, $username, $password, $dbname);
if (mysqli_connect_errno())
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
//echo "Connected successfully<br>";

//$sql="SELECT count_employees('clothing', @cnt);";
//$proc = mysqli_query($conn,$sql);
//$result=mysqli_fetch_row($proc);
////echo $result[0];
//$result[0]++;
//if($result[0]==0)
//    $result[0]=1;
//
//if($result[0] >= 100)
//    $result[0]=$_POST['department'][0].$result[0];
//else if($result[0] >= 10)
//    $result[0]=$_POST['department'][0]."0".$result[0];
//else
//    $result[0]=$_POST['department'][0]."00".$result[0];

//echo $eid;
$sql = "INSERT INTO employee_details( fname, mname, lname, address, city, state, pincode, country, phone, email, birth_date, title, department, supervisor, id, start_date, salary, ecd_fname, ecd_mname, ecd_lname, ecd_address, ecd_city, ecd_state, ecd_pincode, ecd_country, ecd_phone, ecd_relationship) VALUES ('".$_POST['firstname']."', '" .$_POST['middlename']."', '" .$_POST['lastname']."', '" .$_POST['address']."', '" .$_POST['city']."', '" .$_POST['state']."', '" .$_POST['pincode']."', '" .$_POST['country']."', '" .$_POST['phone']."', '" .$_POST['email']."', '" .$_POST['DOB']."', '" .$_POST['title']."', '" .$_POST['department']."', '" .$_POST['supervisor']."', '" .$_POST['employee_id']."', '" .$_POST['start_date']."', '" .$_POST['salary']."', '" .$_POST['ecdfirstname']."', '" .$_POST['ecdmiddlename']."', '" .$_POST['ecdlastname']."', '" .$_POST['ecdaddress']."', '" .$_POST['ecdcity']."', '" .$_POST['ecdstate']."', '" .$_POST['ecdpincode']."', '" .$_POST['ecdcountry']."', '" .$_POST['ecdphone']."', '" .$_POST['relationship']."');";

echo $sql;
echo "<br>";
echo "<br>";
if ($conn->query($sql) === TRUE) {
    echo "New record created successfully<br>***Do not refresh as you are being redirected to a different page***";
} else {
    echo "Error: " . $conn->error;
}
$conn->close();

//header("refresh: 2; URL=employee_details_form.php");
//exit;

?>