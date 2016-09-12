<?php
require_once 'connectToSQLServer.php';

$tsql = "SELECT * FROM CURSO";
$stmt = sqlsrv_query($conn, $tsql);
?>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      

        <title>Membros</title>
    </head>
    <link rel="stylesheet" type="text/css" href="Estilo/style.css">
    <body>

<?php require_once 'cabecalho.php'; ?>
            <div id="conteudo">
                <h1> Curso </h1>
                <table border="1" align="center">
                    <tr align="center" style="font-weight:bold">
                        <td>Nome</td>
                        <td>Campus</td>
                        <td>Presencial?</td>

                    </tr>
<?php while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) { ?>
                        <tr>
                            <td><?php echo $row['nome']; ?>&nbsp; </td>
                            <td><?php echo $row['campus']; ?>&nbsp; </td>
                            <td><?php echo $row['presencial']; ?>&nbsp; </td>


                            
                            <td class="actions">
                                <a class="btn btn-danger btn-xs" href="excluiCurso.php?codigo=<?php echo $row['codigo'];?>">Excluir</a>
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



