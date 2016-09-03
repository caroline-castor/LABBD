<?php require_once 'connectToSQLServer.php';

$tsql = "SELECT * FROM v_centroAcademico";
$stmt = sqlsrv_query($conn, $tsql);
?>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Centros Acadêmicos</title>
</head>
<link rel="stylesheet" type="text/css" href="Estilo/style.css">
<body>
<div id="tudo">
    <?php require_once 'cabecalho.php';?>
    <div id="conteudo">

<table border="1" align="center">
  <tr align="center" style="font-weight:bold">
    <td>Sigla</td>
    <td>Nome</td>
  </tr>
  <?php while($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC)) { ?>
    <tr>
      <td><?php echo $row['Sigla']  ; ?>&nbsp; </td>
      <td><?php echo $row['Nome']; ?>&nbsp; </td>
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
