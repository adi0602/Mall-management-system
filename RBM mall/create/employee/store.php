<?php
session_start();

$conn = mysqli_connect('localhost', 'root', '', 'mall');
if (mysqli_connect_errno())
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

if($_GET['ttl']=='Store Manager')
{
    $sql="SELECT name FROM stores WHERE department='".$_GET['dept']."' AND manager_id is NULL ORDER BY name asc;";
//    echo "<option>".$sql."</option>";
    $stor=mysqli_query($conn, $sql);
//
    echo "<option value='--'>--</option>";
    while($st=mysqli_fetch_array($stor))
    {
        echo '<option value="'.$st['name'].'">'.$st['name'].'</option>';
    }
}
else
{
    $sql="SELECT name FROM stores WHERE department='".$_GET['dept']."' ORDER BY name asc;";
    $stor=mysqli_query($conn, $sql);

    echo "<option value='--'>--</option>";
    while($st=mysqli_fetch_array($stor))
    {
        echo '<option value="'.$st['name'].'">'.$st['name'].'</option>';
    }
}

$conn->close();
?>