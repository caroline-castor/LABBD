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
        <title>Cadastrar Tipo de Sala</title>
    </head>
    <body>
        <div id="tudo">
            <?php require('cabecalho.php'); ?>
            <div id="conteudo">
                <h1> Cadastrar Tipo de Sala </h1>
                <form action="cadastrarTipoSala.php" autocomplete="off" class="form-control" name="cadastroTipoSala" method="post">
                    <table align="center">
                        <tr valign="baseline">
                            <td nowrap="nowrap" valign="top">Sigla:</td>    
                            <td>
                                <textarea name="textoSigla" required rows="25" cols="100" maxlength="1000"></textarea>
                            </td>
                        </tr>
						<tr valign="baseline">
                            <td nowrap="nowrap" valign="top">Tipo:</td>    
                            <td>
                                <textarea name="textoTipo" required rows="25" cols="100" maxlength="1000"></textarea>
                            </td>
                        </tr>

                        <tr valign="baseline">
                            <td colspan="2"><input type="submit" value="Cadastrar Tipo de Sala" name="enviarTipoSala" /></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>


