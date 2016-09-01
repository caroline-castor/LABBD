<?php require_once 'connectToSQLServer.php';

$tsql = "SELECT * FROM PESSOA";
$stmt = sqlsrv_query($conn, $tsql);
?>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pessoas</title>
</head>
<link rel="stylesheet" type="text/css" href="Estilo/style.css">
<body>
<div id="tudo">
    <?php require_once 'cabecalho.php';?>
    <div id="conteudo">

<table border="1" align="center">
  <tr align="center" style="font-weight:bold">
    <td>CPF</td>
    <td>Nome</td>
    <td>Sobrenome</td>
    <td>Email</td>
    <td>Email 2</td>
    <td>Telefone</td>
    <td>Telefone 2</td>
  </tr>
  <?php while($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC)) { ?>
    <tr>
      <td><?php echo $row['CPF']  ; ?>&nbsp; </td>
      <td><?php echo $row['nome']; ?>&nbsp; </td>
      <td><?php echo $row['sobrenome']; ?>&nbsp; </td>
      <td><?php echo $row['email']; ?>&nbsp; </td>
      <td><?php echo $row['email2']; ?>&nbsp; </td>
      <td><?php echo $row['telefone']; ?>&nbsp; </td>
      <td><?php echo $row['telefone2']; ?>&nbsp; </td>
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


