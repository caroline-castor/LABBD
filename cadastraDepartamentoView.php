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
        <title>Cadastrar Departamento</title>
    </head>
    <body>
       <div id="tudo">
           <?php require('cabecalho.php'); ?>
           <div id="conteudo">
               <h1> Cadastrar Departamento </h1>
               <form action="cadastrarDepartamento.php" autocomplete="off" class="form-control" name="cadastroDepartamento" method="post">
            <table align="center">
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Sigla:</td>
            <td><input type="text" name="sigla" value="" /></td>
            </tr>
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Nome:</td>
            <td><input type="text" name="nome" value="" /></td>
            </tr>
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Centro Acadêmico:</td>

            <td><select name="siglaCA">
            <?php require_once 'connectToSQLServer.php';
            $tsql = "SELECT Sigla FROM v_centroAcademico";
            $stmt = sqlsrv_query($conn, $tsql);

            while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)){
                echo "<option value='". $row['Sigla']."'>".$row['Sigla']."</option>";
            }
            ?>
            </select>
            </td>
            </tr>
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Área:</td>
            <td><input type="text" name="area" value="" /></td>
            </tr>
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Localização:</td>
            <td><input type="text" name="localizacao" value="" /></td>
            </tr>
            <tr valign="baseline">
                <td colspan="2"><input type="submit" value="Cadastrar Departamento" name="enviarDepartamento" /></td>
            </tr>
            </table>
        </form>
           </div>
       </div>
    </body>
</html>
