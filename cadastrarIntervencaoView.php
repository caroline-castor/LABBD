<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="../Estilo/style.css" />
        <title>Cadastrar Intervenção</title>
    </head>
    <body>
       <div id="tudo">
           <?php require_once 'cabecalho.php' ?>;
           <div id="conteudo">
               <h1>Cadastrar Intervenção</h1>
               <p> Por favor, selecione uma reunião </p><br><br>
               <form action="cadastrarIntervencaoView2.php" class="form-control" name="cadastroIntervencao" method="post">
            <table align="center">
            <tr valign="baseline">    
                <td nowrap="nowrap" align="right">Reunião:</td>
                <td><select name="selectReuniao" required id="selectReuniao">
                                    <option value="">Selecione Reunião</option>
                                    
                                    <?php
                                    require_once 'connectToSQLServer.php';
                                    $tsql = "SELECT * FROM v_visualizaReuniao";
                                    $stmt = sqlsrv_query($conn, $tsql);

                                    while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
                                        echo "<option value='" . $row['nroOrdem'] . "'>" . $row['nroOrdem'] . " - " . $row['pauta'] . "-" . $row['siglaCoordenacaoCurso'] . "-" . $row['nomeCurso'] . '</option>';
                                    }
                                    
                                    
                                    ?>
                                </select> 
                                </td>
                                </tr>
            
           
            <tr valign="baseline">
                
                <td colspan="2"><input type="submit" value="Próximo >>" name="enviarReuniao" /></td>
            </tr>
            </table>
        </form>
           </div>
       </div>
    </body>
</html>



