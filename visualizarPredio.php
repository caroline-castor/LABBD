<?php
require_once 'connectToSQLServer.php';

  $tsql = "SELECT * FROM v_Predio";
$stmt = sqlsrv_query($conn, $tsql);
?>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="Estilo/style.css">

               <title>Prédio</title>
    </head>


    <body>

        <div id="tudo">
            <?php require_once 'cabecalho.php'; ?>
            <div id="conteudo">
                <h1> Prédio </h1>
                <table border="1" align="center">
                    <tr align="center" style="font-weight:bold">
                        <td>Sigla</td>
                        <td>Imagem</td>
                        <td>Mapa</td>
                        <td>Latitude</td>
						<td>Longetude</td>
                        <td>Descrição</td>
                        <td>Menor Sala do Intervalo</td>
                        <td>Maior Sala do Intervalo</td>
                    </tr>
                    <?php while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) { ?>
                        <tr>
                            <td><?php echo $row['sigla']; ?>&nbsp; </td>
							<td><?php echo $row['imagem']; ?>&nbsp; </td>
							<td><?php echo $row['mapaLocalizacao']; ?>&nbsp; </td>
							<td><?php echo $row['gpsLat']; ?>&nbsp; </td>
							<td><?php echo $row['gpsLog']; ?>&nbsp; </td>
							<td><?php echo $row['descricao']; ?>&nbsp; </td>
							<td><?php echo $row['intervaloSalaMenor']; ?>&nbsp; </td>
							<td><?php echo $row['intervaloSalaMaior']; ?>&nbsp; </td>




                            <td class="actions">
                                <a class="btn btn-danger btn-xs" href="excluiPredio.php?sigla=<?php echo $row['sigla'];?>">Excluir</a>
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
