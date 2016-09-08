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
            <td><input type="text" name="telefone1" value="" /></td>
            </tr>
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Telefone 2:</td>
            <td> <input type="text" name="telefone2" value="" /> </td>
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
