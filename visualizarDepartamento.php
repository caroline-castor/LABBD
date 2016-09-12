<?php
require_once 'connectToSQLServer.php';

$tsql = "SELECT * FROM v_departamento";
$stmt = sqlsrv_query($conn, $tsql);
?>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <title>Departamento</title>
    </head>
    <link rel="stylesheet" type="text/css" href="Estilo/style.css">
    <body>

        <div id="tudo">
<?php require_once 'cabecalho.php'; ?>
            <div id="conteudo">
                <h1> Departamento</h1>
                <table border="1" align="center">
                    <tr align="center" style="font-weight:bold">
                        <td>Sigla</td>
                        <td>Nome</td>
                        <td>Sigla do Centro Acadêmico</td>

                    </tr>
<?php while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) { ?>
                        <tr>
                            <td><?php echo $row['Sigla']; ?>&nbsp; </td>
                            <td><?php echo $row['Nome']; ?>&nbsp; </td>
                            <td><?php echo $row['SiglaCA']; ?>&nbsp; </td>

                            <td class="actions">
                                <a class="btn btn-danger btn-xs" href="excluiDepartamento.php?sigla=<?php echo $row['Sigla'];?>">Excluir</a>
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
