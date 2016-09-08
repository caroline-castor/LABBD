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
        <title>Cadastrar Intervenção pt.2</title>
    </head>
    <body>
       <div id="tudo">
           <?php require('cabecalho.php'); ?>
           <div id="conteudo">
               <h1> Cadastrar Interveção pt.2 </h1>
               <p> Por favor, escolha um membro </p><br><br>
               <form action="cadastrarIntervencao.php" autocomplete="off" class="form-control" name="cadastraIntervencao" method="post">
            <table align="center">
           
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Membros Presentes:</td>
            
            <td><select name="selecionaMembro" required>
            <?php require_once 'connectToSQLServer.php';
            $tsql = "SELECT * FROM v_membrosPresentesReuniao WHERE nroOrdemReuniao=".$_POST['selectReuniao'];
            $stmt = sqlsrv_query($conn, $tsql);
            
            if(sqlsrv_has_rows($stmt)){
            while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)){
                echo "<option value='". $row['id_membro']."'>".$row['CPF']." - ".$row['nome']. " ". $row['sobrenome'].'</option>';
            }    
            }else{
                 echo "<option value=''> Nenhum membro presente encontrado </option>";
            }
            
            ?>
            </select>  
            </td>
            </tr>
            <tr valign="baseline">
                <td nowrap="nowrap" align="right">Intervenção:</td>
                <td><textarea name="intervencao" rows="7" cols="20"></textarea></td>
                
            </tr>
             <input type="hidden" name="nroOrdem" value="<?php echo $_POST['selectReuniao']; ?>" />
            
            <tr valign="baseline">
                <td colspan="2"><input type="submit" value="Cadastrar Intervenção" name="enviarPessoa" /></td>
            </tr>
            </table>
        </form>
           </div>
       </div>
    </body>
</html>


