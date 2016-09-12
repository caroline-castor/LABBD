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
        <title>Cadastrar Ata</title>
    </head>
    <body>
        <div id="tudo">
            <?php require('cabecalho.php'); ?>
            <div id="conteudo">
                <h1> Cadastrar Ata </h1>
                <form action="cadastrarAta.php" autocomplete="off" class="form-control" name="cadastroAta" method="post">
                    <table align="center">
                        <tr valign="baseline">    
                            <td nowrap="nowrap" align="right">Reunião:</td>
                            <td><select name="selecionaReuniaoSemAta" required>
                                    <?php
                                    require_once 'connectToSQLServer.php';
                                    $tsql = "SELECT * FROM v_visualizaReuniaoSemAta";
                                    $stmt = sqlsrv_query($conn, $tsql);
                                    if(sqlsrv_has_rows($stmt)){
                                    while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
                                        echo "<option value='" . $row['nroOrdem'] . "'>" . $row['nroOrdem'] . " - " . $row['pauta'] . "-" . $row['siglaCoordenacaoCurso'] . "-" . $row['nomeCurso'] . '</option>';
                                    }
                                    }else{
                                       echo "<option value=''>Nenhuma reunião sem ata encontrada</option>"; 
                                    }
                                    ?>
                                </select>  
                            </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" valign="top">Ata:</td>    
                            <td>
                                <textarea name="textoDescritivo" required rows="25" cols="100" maxlength="1000"></textarea>
                            </td>
                        </tr>

                        <tr valign="baseline">
                            <td colspan="2"><input type="submit" value="Cadastrar Ata" name="enviarAta" /></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>


