<?php
$serverName = "DESKTOP-B63RV2P\sqlexpress"; //serverName\instanceName

// Since UID and PWD are not specified in the $connectionInfo array,
// The connection will be attempted using Windows Authentication.
$connectionInfo = array( "Database"=>"LABBD");
$conn = sqlsrv_connect( $serverName, $connectionInfo);

if( $conn == false ) {
  echo "Connection could not be established.<br />";
  die( print_r( sqlsrv_errors(), true));      
}

?>
