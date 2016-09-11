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
        <title>Cadastrar Pessoa</title>
    </head>
    <body>
        <div id="tudo">
            <?php require_once 'cabecalho.php' ?>;
            <div id="conteudo">
                <form action="cadastrarPessoa.php" autocomplete="off" class="form-control" name="cadastroPessoa" method="post">
                    <table align="center">
                        <tr valign="baseline">    
                            <td nowrap="nowrap" align="right">Nome:</td>
                            <td><input type="text" required name="nome" value="" /></td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Sobrenome:</td>    
                            <td><input type="text" required name="sobrenome" value="" /></td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">CPF:</td>
                            <td><input type="text" required name="cpf" value="" /></td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Email:</td>
                            <td><input type="text" name="email1" value="" /></td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Email 2:</td>
                            <td><input type="text" name="email2" value="" /></td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Telefone</td>
                            <td><input type="text" name="tel1" value="" /></td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Telefone 2:</td>
                            <td> <input type="text" name="tel2" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Data de Nascimento:</td>
                            <td> <input type="text" name="dataNascimento" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">RG:</td>
                            <td> <input type="text" name="rg" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Sexo:</td>
                            <td> <input type="text" name="sexo" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Etnia:</td>
                            <td> <input type="text" name="etnia" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Nome do Pai:</td>
                            <td> <input type="text" name="pai_nome" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Sobrenome do Pai:</td>
                            <td> <input type="text" name="pai_sobrenome" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Nome da Mae:</td>
                            <td> <input type="text" name="mae_nome" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Sobrenome da Mae:</td>
                            <td> <input type="text" name="mae_Sobrenome" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Cidade Natal:</td>
                            <td> <input type="text" name="nasce_cidade" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Estado Natal:</td>
                            <td> <input type="text" name="nasce_UF" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Nacionalidade:</td>
                            <td> <input type="text" name="nasce_pais" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Bairro:</td>
                            <td> <input type="text" name="endereco_bairro" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Cidade:</td>
                            <td> <input type="text" name="endereco_cidade" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Logradouro:</td>
                            <td> <input type="text" name="endereco_logradouro" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Numero:</td>
                            <td> <input type="text" name="endereco_numero" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">UF:</td>
                            <td> <input type="text" name="endereco_uf" value="" /> </td>
                        </tr>
                        <tr valign="baseline">
                            <td nowrap="nowrap" align="right">Pais:</td>
                            <td> <input type="text" name="endereco_pais" value="" /> </td>
                        </tr>
                        <tr valign="baseline">

                            <td colspan="2"><input type="submit" value="Cadastrar Pessoa" name="enviarPessoa" /></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
