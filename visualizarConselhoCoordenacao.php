<?php require_once 'connectToSQLServer.php';

$tsql = "SELECT CC.sigla, C.nome FROM CONSELHOCOORDENACAOCURSO CC, CURSO C WHERE C.codigo = CC.codigoCurso";
$stmt = sqlsrv_query($conn, $tsql);
?>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Conselho Coordenacão de Curso</title>
</head>
<link rel="stylesheet" type="text/css" href="Estilo/style.css">
<body>
<div id="tudo">
    <?php require_once 'cabecalho.php';?>
    <div id="conteudo">

<table border="1" align="center">
  <tr align="center" style="font-weight:bold">
    <td>Sigla</td>
    <td>Nome Curso</td>
   
  </tr>
  <?php while($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC)) { ?>
    <tr>
      <td><?php echo $row['sigla']  ; ?>&nbsp; </td>
      <td><?php echo $row['nome']; ?>&nbsp; </td>
    
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


<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

