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
        <title>Cadastrar Sala</title>
    </head>
    <body>
        <div id="tudo">
            <?php require('cabecalho.php'); ?>
            <div id="conteudo">
                <h1> Cadastrar Sala </h1>
                <form action="cadastrarSala.php" autocomplete="off" class="form-control" name="cadastroSala" method="post">
                    <table align="center">
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Prédio:</td>
                            <td><select name="escolhaSiglaPredio" required>
                                    <?php
                                    require_once 'connectToSQLServer.php';
                                    $tsql = "SELECT * FROM v_Predio";
                                    $stmt = sqlsrv_query($conn, $tsql);
                                    if(sqlsrv_has_rows($stmt)){
                                    while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
                                        echo "<option value='" . $row['sigla'] . "'>" . $row['sigla'] . " - " . $row['descricao'] . '</option>';
                                    }
                                    }else{
                                       echo "<option value=''>Nenhum Prédio encontrado</option>";
                                    }
                                    ?>
                                </select>
                            </td>
                        </tr>
						<tr valign="baseline">
                            <td nowrap="nowrap" valign="top">Número da Sala:</td>
                            <td>
                                <textarea name="textoNumSala" required ></textarea>
                            </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" valign="top">Capacidade Efetiva:</td>
                            <td>
                                <textarea name="textoCapacidadeEfetiva" required ></textarea>
                            </td>
                        </tr>
						<tr valign="baseline">
                            <td nowrap="nowrap" valign="top">Capacidade:</td>
                            <td>
                                <textarea name="textoCapacidade" required ></textarea>
                            </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Tipo da Sala:</td>
                            <td><select name="textoSiglaTipoSala" required>
                                    <?php
                                    require_once 'connectToSQLServer.php';
                                    $tsql = "SELECT * FROM TIPOSALA";
                                    $stmt = sqlsrv_query($conn, $tsql);
                                    if(sqlsrv_has_rows($stmt)){
                                    while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
                                        echo "<option value='" . $row['sigla'] . "'>" . $row['sigla'] . " - " . $row['tipo'] . '</option>';
                                    }
                                    }else{
                                       echo "<option value=''>Nenhum Prédio encontrado</option>";
                                    }
                                    ?>
                                </select>
                            </td>
                        </tr>

                        <tr valign="baseline">
                            <td colspan="2"><input type="submit" value="Cadastrar Sala" name="enviarSala" /></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
