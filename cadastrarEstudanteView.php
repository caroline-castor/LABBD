<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="Estilo/style.css" />
        <title>Cadastrar Estudante</title>
    </head>
    <body>
        <div id="tudo">
            <?php require_once 'cabecalho.php' ?>;
            <div id="conteudo">
                <form action="cadastrarEstudante.php" autocomplete="off" class="form-control" name="cadastroEstudante" method="post">
                    <table align="center">
                        <tr valign="baseline">    
                            <td nowrap="nowrap" align="right">CPF:</td>
                            <td><input type="text" required name="cpf_estudante" value="" /></td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">RA:</td>    
                            <td><input type="text" required name="RA" value="" /></td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Ano conclusao ensino medio:</td>
                            <td><input type="text" required name="anoConclusaoEm" value="" /></td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Escola:</td>
                            <td><input type="text" required name="escolaEM" value="" /></td>
                        </tr>
                        <tr valign="baseline">

                            <td colspan="2"><input type="submit" value="Cadastrar Estudante" name="enviarEstudante" /></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>