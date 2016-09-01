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
        <title>Cadastrar Membro</title>
    </head>
    <body>
       <div id="tudo">
           <?php require('cabecalho.php'); ?>
           <div id="conteudo">
               <h1> Cadastrar Membro </h1>
               <form action="cadastrarMembro.php" name="cadastroMembro" method="post">
            <table align="center">
            <tr valign="baseline">    
            <td nowrap="nowrap" align="right">CPF:</td>
            <td><input type="text" name="cpf" value="" /></td>
            </tr>
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Portaria de Identificação:</td>    
            <td><input type="text" name="portariaIdentificacao" value="" /></td>
            </tr>
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Conselho Coordenação de Curso:</td>
            
            <td><select name="selecionaCurso">
            <?php require_once 'connectToSQLServer.php';
            $tsql = "SELECT codigo, nome, sigla FROM CURSO C, CONSELHOCOORDENACAOCURSO CC WHERE C.codigo = CC.codigoCurso";
            $stmt = sqlsrv_query($conn, $tsql);
            
            while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)){
                echo "<option value='". $row['codigo']."'>".$row['sigla']." - ".$row['nome']. '</option>';
            }    
            ?>
            </select>  
            </td>
            </tr>
            <tr valign="baseline">
                <td colspan="2"><input type="submit" value="Cadastrar Membro" name="enviarPessoa" /></td>
            </tr>
            </table>
        </form>
           </div>
       </div>
    </body>
</html>
