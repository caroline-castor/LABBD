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
        <title>Cadastrar Decisões Aprovadas pt.2</title>
    </head>
    <body>
       <div id="tudo">
           <?php require('cabecalho.php'); ?>
           <div id="conteudo">
               <h1> Cadastrar Decisões Aprovadas pt.2 </h1>
               <p> Por favor, escolha uma intervenção </p><br><br>
               <form action="cadastrarDecisao.php" autocomplete="off" class="form-control" name="cadastraDecisao" method="post">
            <table align="center">
           
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Intervenção:</td>
            
            <td><select name="selecionaIntervencao">
            <?php require_once 'connectToSQLServer.php';
            $tsql = "SELECT * FROM v_membrosIntervencao WHERE nroOrdemReuniao=".$_POST['selectReuniao'];
            $stmt = sqlsrv_query($conn, $tsql);
            
            while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)){
                echo "<option value='". $row['id_intervencao']."'>"."Intervenção nro: ".$row['id_intervencao']." - Intervenção: ".$row['intervencao']." - Membro: ".$row['nome']." ".$row['sobrenome'].'</option>';
            }    
            
           
            ?>
            </select>  
            </td>
            </tr>
          
            <input type="hidden" name="nroOrdem" value="<?php echo $_POST['selectReuniao']; ?>" />
            
            <tr valign="baseline">
                <td colspan="2"><input type="submit" value="Cadastrar Decisão" name="enviarDecisão" /></td>
            </tr>
            </table>
        </form>
           </div>
       </div>
    </body>
</html>


