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


//if(isset($_GET['rowid'])){
//    echo $rowid = $_GET['rowid'];
//}
//
//if(isset($_GET['colid'])){
//    echo " ";
//    echo $rowid = $_GET['colid'];
//}
if($_GET['colid']==2)
{
?>

<table class="tbl-header" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <th>Address</th>
        <th>City</th>
        <th>State</th>
        <th>Pincode</th>
        <th>Country</th>
    </tr>
</table>
<?php
    $sql1 = "SELECT * FROM employee_details where id='".$_GET["rowid"]."'";
    
    $result = ($conn->query($sql1));

    if($result->num_rows > 0)
    {
        $temp=0;
        while($row = $result->fetch_assoc())
        {
?>
<table cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td><?php echo $row['address']; ?></td>
        <td><?php echo $row['city']; ?></td>
        <td><?php echo $row['state']; ?></td>
        <td><?php echo $row['pincode']; ?></td>
        <td><?php echo $row['country']; ?></td>
    </tr>
    <?php
        }
    }

    else
    {
        echo "0 results" ;
    }

    ?>

</table>
<?php
}

else if($_GET['colid']==3)
{
?>

<table class="tbl-header" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <th>Phone</th>
        <th>Email</th>
        <th>Birth_Date</th>
    </tr>

    <?php

    $sql1 = " SELECT * FROM employee_details where id='".$_GET["rowid"]."'";
    $result = ($conn->query($sql1)) ;

    if($result->num_rows > 0)
    {
        while($row = $result->fetch_assoc())
        {  

    ?>
    <table cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td><?php echo $row['phone']; ?></td>
            <td><?php echo $row['email']; ?></td>
            <td><?php echo $row['birth_date']; ?></td>
        </tr>
        <?php

        }
    }

    else
    {
        echo "0 results" ;
    }



        ?>

    </table>
    <?php
}

else if($_GET['colid']==4)
{
    ?>
    <table class="tbl-header" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <th>Title</th>
            <th>Department</th>
            <th>Supervisor</th>
            <th>Id</th>
            <th>Start_Date</th>
            <th>Salary</th>
        </tr>

        <?php

    $sql1 = " SELECT * FROM employee_details where id='".$_GET["rowid"]."'";
    $result = ($conn->query($sql1)) ;

    if($result->num_rows > 0)
    {
        while($row = $result->fetch_assoc())
        {  

        ?>
        <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td><?php echo $row['title']; ?></td>
                <td><?php echo $row['department']; ?></td>
                <td><?php echo $row['supervisor']; ?></td>
                <td><?php echo $row['id']; ?></td>
                <td><?php echo $row['start_date']; ?></td>
                <td><?php echo $row['salary']; ?></td>
            </tr>
            <?php

        }
    }

    else
    {
        echo "0 results" ;
    }



            ?>

        </table>

        <?php
}
else if($_GET['colid']==5)
{
        ?>
        <table class="tbl-header" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <th>Name</th>
                <th>Address</th>
                <th>City</th>
                <th>Pincode</th>
                <th>Phone</th>
                <th>Relation</th>
            </tr>

            <?php

    $sql1 = " SELECT * FROM employee_details where id='".$_GET["rowid"]."'";
    $result = ($conn->query($sql1)) ;

    if($result->num_rows > 0)
    {
        while($row = $result->fetch_assoc())
        {  

            ?>
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td><?php echo $row["ecd_fname"]. "  " . $row["ecd_lname"] . "<br>"; ?></td>
                <td><?php echo $row['ecd_address']; ?></td>
                <td><?php echo $row['ecd_city']; ?></td>
                <td><?php echo $row['ecd_pincode']; ?></td>
                <td><?php echo $row['ecd_phone']; ?></td>
                <td><?php echo $row['ecd_relationship']; ?></td>
            </tr>
            <?php

        }
    }

    else
    {
        echo "0 results" ;
    }



            ?>

        </table>
        <?php
}
        ?>