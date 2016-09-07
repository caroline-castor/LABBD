<?php
require_once 'connectToSQLServer.php';

$tsql = "SELECT * FROM v_decisoesAprovadas";
$stmt = sqlsrv_query($conn, $tsql);
?>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
     
        <title>Decisões Aprovadas</title>
    </head>
    <link rel="stylesheet" type="text/css" href="Estilo/style.css">
    <body>

        <!-- Modal -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalLabel">Excluir Item</h4>
                    </div>
                    <div class="modal-body">
                        <h2> Deseja realmente excluir este item?</h2>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">Sim</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="tudo">
<?php require_once 'cabecalho.php'; ?>
            <div id="conteudo">
                <h1> Decisões Aprovadas </h1>

                <table border="1" align="center">
                    <tr align="center" style="font-weight:bold">
                        <td>Número de Ordem Reunião</td>
                        <td> ID Decisão </td>
                        <td>Pauta</td>
                        <td>Intervencão</td>
                        <td>Intervencão Realizada por</td>

                    </tr>
<?php while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) { ?>
                        <tr>
                            <td><?php echo $row['nroOrdemReuniao']; ?>&nbsp; </td>
                            <td><?php echo $row['id_decisao']; ?>&nbsp; </td>
                            <td><?php echo $row['pauta']; ?>&nbsp; </td>
                            <td><?php echo $row['intervencao']; ?>&nbsp; </td>
                            <td><?php echo $row['CPF'] . " - " . $row['nome'] . " " . $row['sobrenome']; ?>&nbsp; </td>

                            <td class="actions">
                                <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#myModal">Excluir</button>
                            </td>
                        </tr>
<?php } ?>

                </table>
                <br />

            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    </body>
</html>

<?php
sqlsrv_close($conn);
?>






