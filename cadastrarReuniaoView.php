<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->


<html>
    <head>
        <meta charset="UTF-8">
         <link rel="stylesheet" type="text/css" href="../Estilo/style.css"/>
        <title>Cadastrar Curso</title>
    </head>
    <body>
       <div id="tudo">
           <?php require('cabecalho.php'); ?>
           <div id="conteudo">
               <h1> Cadastrar Reunião </h1>
               <form action="cadastrarReuniao.php" name="cadastroReuniao" method="post">
            <table align="center">
            <tr valign="baseline">    
            <td nowrap="nowrap" align="right">Número de Ordem</td>
            <td><input type="text" name="nroOrdem" value="" /></td>
            </tr>
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Pauta:</td>    
            <td><input type="text" name="pauta" value="" /></td>
            </tr>
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Tipo Reunião:</td>
            <td><input type="text" name="tipoReuniao" value="" /></td>
            </tr>
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Continuação?</td>
            <td><input type="checkbox" name="continuacao" value="sim" /></td>
            </tr>
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Data:</td>
            <td><input type="text" name="data" value="" /></td>
            </tr>
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Coordenacão de Curso Responsável:</td>
            <td><select name="selecionaCurso">
            <?php require_once 'connectToSQLServer.php';
            $tsql = "SELECT codigo,nome,sigla FROM CURSO C, CONSELHOCOORDENACAOCURSO CC WHERE C.codigo = CC.codigoCurso";
            $stmt = sqlsrv_query($conn, $tsql);
            
            while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)){
                echo "<option value='". $row['codigo']."'>".$row['sigla']." - ".$row['nome']. '</option>';
            }    
            ?>
            </select>  
            </td>
            </tr>
            <tr valign="baseline">
                <td colspan="2"><input type="submit" value="Cadastrar Curso" name="enviarCurso" /></td>
            </tr>
            </table>
        </form>
           </div>
       </div>
    </body>
</html>



