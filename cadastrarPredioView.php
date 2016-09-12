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
        <title>Cadastrar Prédio</title>
    </head>
    <body>
        <div id="tudo">
            <?php require('cabecalho.php'); ?>
            <div id="conteudo">
                <h1> Cadastrar Prédio </h1>
                <form action="cadastrarPredio.php" autocomplete="off" class="form-control" name="cadastroPredio" method="post">
                    <table align="center">
                        <tr valign="baseline">
                            <td nowrap="nowrap" valign="top">Sigla:</td>
                            <td>
                                <textarea name="textoSigla" required cols="100" maxlength="1000"></textarea>
                            </td>
                        </tr>
						<tr valign="baseline">
                            <td nowrap="nowrap" valign="top">Imagem(link):</td>
                            <td>
                                <textarea name="linkImagem" required cols="100" maxlength="1000"></textarea>
                            </td>
                        </tr>
						<tr valign="baseline">
                            <td nowrap="nowrap" valign="top">Mapa(link):</td>
                            <td>
                                <textarea name="linkMapa" required cols="100" maxlength="1000"></textarea>
                            </td>
                        </tr>
						<tr valign="baseline">
                            <td nowrap="nowrap" valign="top">Latitude:</td>
                            <td>
                                <textarea name="textoLatitude" required cols="100" maxlength="1000"></textarea>
                            </td>
                        </tr>
						<tr valign="baseline">
                            <td nowrap="nowrap" valign="top">Longitude:</td>
                            <td>
                                <textarea name="textoLongitude" required cols="100" maxlength="1000"></textarea>
                            </td>
                        </tr>
						<tr valign="baseline">
                            <td nowrap="nowrap" valign="top">Descrição:</td>
                            <td>
                                <textarea name="textoDescricao" required cols="100" maxlength="1000"></textarea>
                            </td>
                        </tr>
						<tr valign="baseline">
                            <td nowrap="nowrap" valign="top">Menor Sala:</td>
                            <td>
                                <textarea name="textoMenorSala" required cols="100" maxlength="1000"></textarea>
                            </td>
                        </tr>
						<tr valign="baseline">
                            <td nowrap="nowrap" valign="top">Maior Sala:</td>
                            <td>
                                <textarea name="textoMaiorSala" required cols="100" maxlength="1000"></textarea>
                            </td>
                        </tr>

                        <tr valign="baseline">
                            <td colspan="2"><input type="submit" value="Cadastrar Prédio" name="enviarPredio" /></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
