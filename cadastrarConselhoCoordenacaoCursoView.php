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
        <title>Cadastrar Conselho Coordenação Curso</title>
    </head>
    <body>
      
        <div id="tudo">
            <?php require_once 'cabecalho.php' ?>;
            <div id="conteudo">
                <form action="cadastrarConselhoCoordenacaoCurso.php" name="cadastroCoordenacao" method="post">
                    <table align="center">
                        <tr valign="baseline">    
                            <td nowrap="nowrap" align="right">Curso:</td>
                            <td><select name="selecionaCurso" required>

                                    <?php
                                    require_once 'connectToSQLServer.php';
                                    $tsql = "SELECT codigo, nome FROM CURSO C WHERE codigo NOT IN (SELECT codigoCurso FROM CONSELHOCOORDENACAOCURSO) ";
                                    $stmt = sqlsrv_query($conn, $tsql);
                                    if (sqlsrv_has_rows($stmt)) {
                                        while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
                                            echo "<option value='" . $row['codigo'] . "'>" . $row['codigo'] . " - " . $row['nome'] . '</option>';
                                        }
                                    } else {
                                        echo "<option value=''>Nenhum curso sem conselho de coordenação encontrado</option>";
                                    }
                                    ?>
                                </select>  
                            </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Sigla:</td>    
                            <td><input type="text" name="sigla" required value="" /></td>
                        </tr>

                        <tr valign="baseline">

                            <td colspan="2"><input type="submit" value="Cadastrar Conselho Coordenação Curso" name="enviarPessoa" /></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>

