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
        <title>Cadastrar Curso</title>
    </head>
    <body>
       <div id="tudo">
           <?php require('cabecalho.php'); ?>
           <div id="conteudo">
               <h1> Cadastrar Curso </h1>
               <form action="cadastrarCurso.php" autocomplete="off" class="form-control" name="cadastroCurso" method="post">
            <table align="center">
            <tr valign="baseline">    
            <td nowrap="nowrap" align="right">Nome:</td>
            <td><input type="text" required name="nome" value="" /></td>
            </tr>
            <tr valign="baseline">
            <td nowrap="nowrap" align="right">Campus:</td>    
            <td><input type="text" required name="campus" value="" /></td>
            </tr>
            <tr valign="baseline">
            <td nowrap="nowrap" required align="right">Presencial:</td>
            <td>
                <input type="checkbox" name="presencial" value="sim">
            </td>
            </tr>
            <tr valign="baseline">
                <td colspan="2"><input type="submit" value="Cadastrar Curso" name="enviarCurso" /></td>
            </tr>
            </table>
        </form>
           </div>
       </div>
    </body>
</html>


