<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->


<html>
    <head>
        <meta charset="iso-8859-1">
        <link rel="stylesheet" type="text/css" href="../Estilo/style.css"/>
        <title>Cadastrar Membros Presentes</title>
        <link href="multiselect/css/multi-select.css" media="screen" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

	

    </head>
    <body>
        <div id="tudo">
            <?php require('cabecalho.php'); ?>
            <div id="conteudo">
                <h1> Cadastrar Membros Presentes - Parte 2 </h1>
                <form action="cadastrarMembrosPresentes.php" class="form-control" name="cadastroMembrosPresentes" method="post">
                    <table align="center">
                        <tr valign="baseline">    
                            <td nowrap="nowrap" valign="top">Membros do Conselho:</td>
                            <td>
                                <select multiple="multiple" id="my-select" name="my-select[]" >
                                  <?php
                                        require_once 'connectToSQLServer.php';
                                        echo $_POST['selectReuniao'];
                                    $tsql = "SELECT * FROM " ;
                                    $stmt = sqlsrv_query($conn, $tsql);
                                    $resultados= sqlsrv_num_rows ($stmt);
                                    if($resultados > 0){
                                    while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
                                        echo "<option value='" . $row['id_membro'] . "'>" . $row['CPF'] . " - " . $row['nome'] . " " . $row['sobrenome'] . '</option>';
                                    }
                                    }else{
                                        
                                       echo "<option value=''> Todos membros já cadastrados nessa reunião </option>'";
                                    }
                                  ?>
                                </select>
                                <script src="multiselect/js/jquery.multi-select.js" type="text/javascript"></script>
                                <script type="text/javascript">
                                    $('#my-select').multiSelect();
                                    $('#my-select').multiSelect('deselect_all');
                                </script>
                            </td>
                             <input type="hidden" name="nroOrdem" value="<?php echo $_POST['selectReuniao']?>"> 
                        </tr>
                       
                        <tr valign="baseline">
                            <td colspan="2"><input type="submit" value="Cadastrar" name="enviarMembroPresente" /></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>




