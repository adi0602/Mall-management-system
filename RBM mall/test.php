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


//$sql="SET @p0='clothing'; CALL `generate_id`(@p0, @p1); SELECT @p1 AS `genid`;";
//$sql="CALL generate_id('food',@genid);";

//$sql=$conn->prepare("CALL generate_id('clothing',@genid);") or die ('Unable to prepare'. $conn->error);
//$sql->execute();
//
//$sql = $conn->prepare('SELECT @genid');
//$sql->execute();
//
//$sql->bind_result($out);
//$sql->fetch();
//echo $out;
//$sql->close();
//
//$sql = $conn->prepare("CALL generate_id('food',@genid);") or die ('Unable to prepare'. $conn->error);
//$sql->execute();
//
//$sql = $conn->prepare('SELECT @genid');
//$sql->execute();
//
//$sql->bind_result($f);
//$sql->fetch();
//echo $f;

//$sql->close();
//$sql="SELECT id FROM stores WHERE name='".$_POST['store']."';";
//
//$result=mysqli_query($conn,$sql);
//
//$row=mysqli_fetch_array($result);
//
//echo'chal raha hai';
//echo "<br>";
//echo $row['id'];

$sql="SELECT id FROM stores WHERE name='".$_POST['store']."';";

//echo $sql;
//echo "<br>";

$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_array($result);

$storeid=$row['id'];

$sql="SELECT id FROM (SELECT id,CONCAT(fname,' ', mname, ' ', lname) AS name FROM employee_details)et WHERE name='".$_POST['supervisor']."';";

//echo $sql;
//echo "<br>";

$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_array($result);

$supid=$row['id'];
//echo $supid;
//echo "<br>";

$sql = "INSERT INTO employee_details( fname, mname, lname, address, city, state, pincode, country, phone, email, birth_date, title, store_id, supervisor, id, start_date, salary, ecd_fname, ecd_mname, ecd_lname, ecd_address, ecd_city, ecd_state, ecd_pincode, ecd_country, ecd_phone, ecd_relationship) VALUES ('".$_POST['firstname']."', '" .$_POST['middlename']."', '" .$_POST['lastname']."', '" .$_POST['address']."', '" .$_POST['city']."', '" .$_POST['state']."', '" .$_POST['pincode']."', '" .$_POST['country']."', '" .$_POST['phone']."', '" .$_POST['email']."', '" .$_POST['DOB']."', '" .$_POST['title']."','".$storeid."','".$supid."','" .$_POST['employee_id']."', '" .$_POST['start_date']."', '" .$_POST['salary']."', '" .$_POST['ecdfirstname']."', '" .$_POST['ecdmiddlename']."', '" .$_POST['ecdlastname']."', '" .$_POST['ecdaddress']."', '" .$_POST['ecdcity']."', '" .$_POST['ecdstate']."', '" .$_POST['ecdpincode']."', '" .$_POST['ecdcountry']."', '" .$_POST['ecdphone']."', '" .$_POST['relationship']."');";

//echo $sql;
//echo "<br>";
//echo "<br>";
if (mysqli_query($conn,$sql)) {
    echo "New record stored successfully";
//    echo $supid;
} else {
    echo "Error: ";// . mysqli_error;
}
?>