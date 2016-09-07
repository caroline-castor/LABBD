<?php require_once 'connectToSQLServer.php';


// Armazena a query de insercao
$tsql2 = "INSERT INTO CONSELHOCOORDENACAOCURSO(codigoCurso, sigla) VALUES (?,?)";


$parameters = [$_POST['selecionaCurso'],$_POST['sigla']];

//executa a tsql2
$stmt2 = sqlsrv_query($conn, $tsql2, $parameters);
//verifica erro
if( $stmt2 === false ){
echo "Statement could not be executed.\n";
 die( print_r( sqlsrv_errors(), true));
}

//se nenhum erro ocorrer, redireciona a pagina
echo '<meta HTTP-EQUIV="Refresh" CONTENT="0.1; URL=visualizarConselhoCoordenacao.php">';

/* Free statement and connection resources. */

sqlsrv_free_stmt( $stmt2);
sqlsrv_close( $conn);




?>
