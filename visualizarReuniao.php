<?php require_once 'connectToSQLServer.php';

$tsql = "SELECT * FROM v_visualizaReuniao";
$stmt = sqlsrv_query($conn, $tsql);
?>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Reunião</title>
</head>
<link rel="stylesheet" type="text/css" href="Estilo/style.css">
<body>
<div id="tudo">
    <?php require_once 'cabecalho.php';?>
    <div id="conteudo">

<table border="1" align="center">
  <tr align="center" style="font-weight:bold">
    <td>Numero de Ordem</td>
    <td>Pauta</td>
    <td>Tipo de Reunião</td>
    <td>Continuação?</td>
    <td>Data</td>
    <td>Nome do Curso Responsável</td>
    <td>Sigla da Coordenação de Curso</td>
  
  </tr>
  <?php while($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC)) { ?>
    <tr>
      <td><?php echo $row['nroOrdem']  ; ?>&nbsp; </td>
      <td><?php echo $row['pauta']; ?>&nbsp; </td>
      <td><?php echo $row['tipoReuniao']; ?>&nbsp; </td>
      <td><?php echo $row['continuacao']; ?>&nbsp; </td>
      <td><?php echo date_format($row['data'], 'd/m/Y'); ?>&nbsp; </td>
      <td><?php echo $row['nomeCurso']; ?>&nbsp; </td>
      <td><?php echo $row['siglaCoordenacaoCurso']; ?>&nbsp; </td>
      
     
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



