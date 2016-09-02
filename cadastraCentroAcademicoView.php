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
        <title>Cadastrar Centro Acadêmico</title>
    </head>
    <body>
       <div id="tudo">
           <?php require('cabecalho.php'); ?>
           <div id="conteudo">
               <h1> Cadastrar Centro Acadêmico </h1>
               <form action="cadastrarCentroAcademico.php" name="cadastroCentroAcademico" method="post">
            <table align="center">
              <tr valign="baseline">
                <td nowrap="nowrap" align="right">Sigla:</td>
                <td><input type="text" name="sigla" value="" /></td>
              </tr>
              <tr valign="baseline">
                <td nowrap="nowrap" align="right">Nome:</td>
                <td><input type="text" name="nome" value="" /></td>
              </tr>
              <tr valign="baseline">
                  <td colspan="2"><input type="submit" value="Cadastrar Centro Acadêmico" name="enviarCentroAcademico" /></td>
              </tr>
            </table>
        </form>
           </div>
       </div>
    </body>
</html>
