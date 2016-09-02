<?php require_once 'connectToSQLServer.php';

$tsql = "SELECT * FROM CURSO";
$stmt = sqlsrv_query($conn, $tsql);
?>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Membros</title>
</head>
<link rel="stylesheet" type="text/css" href="Estilo/style.css">
<body>
<div id="tudo">
    <?php require_once 'cabecalho.php';?>
    <div id="conteudo">

<table border="1" align="center">
  <tr align="center" style="font-weight:bold">
    <td>Nome</td>
    <td>Campus</td>
    <td>Presencial?</td>
  
  </tr>
  <?php while($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC)) { ?>
    <tr>
      <td><?php echo $row['nome']; ?>&nbsp; </td>
      <td><?php echo $row['campus']; ?>&nbsp; </td>
      <td><?php echo $row['presencial']; ?>&nbsp; </td>
     
    </tr>
    <?php }?>
    
</table>
<br />

    </div>


</div>
</body>
</html>

<?php
sqlsrv_close( $conn);

?>



