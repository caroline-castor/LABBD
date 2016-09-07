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
                <h1> Cadastrar Membros Presentes </h1>
                <p> Por favor, selecione uma reunião </p><br><br>
                <form action="cadastrarMembrosPresentesView2.php" class="form-control" name="cadastroMembrosPresentes" method="post">
                    <table align="center">
                        <tr valign="baseline">    
                            <td nowrap="nowrap" align="right">Reunião:</td>
                            <td>
                                <select name="selectReuniao"  id="selectReuniao">
                                    <option value="">Selecione Reuniao</option>
                                    
                                    <?php
                                    require_once 'connectToSQLServer.php';
                                    $tsql = "SELECT * FROM v_visualizaReuniao";
                                    $stmt = sqlsrv_query($conn, $tsql);

                                    while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
                                        echo "<option value='" . $row['nroOrdem'] . "'>" . $row['nroOrdem'] . " - " . $row['pauta'] . "-" . $row['siglaCoordenacaoCurso'] . "-" . $row['nomeCurso'] . '</option>';
                                    }
                                    
                                    
                                    ?>
                                </select> 
                            </td>
                        </tr>
                        
                        <input type="hidden" name="acao" value="cadastro_1" />
                    
                        <tr valign="baseline">
                            <td colspan="2"><input type="submit" value="Próximo >>" name="enviarReuniao" /></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>


