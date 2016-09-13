<?php
require_once 'connectToSQLServer.php';

$tsql = "SELECT * FROM Estudante";
$stmt = sqlsrv_query($conn, $tsql);
?>

<html>
    <head>

        <meta http-equiv="content-Type" content="text/html; charset=UTF-8" />

        <title>Estudante</title>
    </head>
    <link rel="stylesheet" type="text/css" href="Estilo/style.css">
    <body>
        <div id="tudo">
<?php require_once 'cabecalho.php'; ?>
            <div id="conteudo">

                <table border="1" align="center">
                    <tr align="center" style="font-weight:bold">
                        <td>CPF</td>
                        <td>RA</td>
                        <td>Ano Conclusao Ensino Medio</td>
                        <td>Escola</td>
                    </tr>
<?php while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) { ?>
                        <tr>
                            <td><?php echo $row['cpf_estudante']; ?>&nbsp; </td>
                            <td><?php echo $row['RA']; ?>&nbsp; </td>
                            <td><?php echo $row['anoConclusaoEm']->format('d-m-y'); ?>&nbsp; </td>
                            <td><?php echo $row['escolaEM']; ?>&nbsp; </td>
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
