<?php require_once 'connectToSQLServer.php';


// Armazena a query de insercao
$tsql = "INSERT INTO ATA(nroOrdemReuniao,textoDescritivo) VALUES (?,?)";

$parameters = [$_POST['selecionaReuniaoSemAta'],$_POST['textoDescritivo']];

//executa a query tsql, resultado fica em stmt
$stmt = sqlsrv_query($conn,$tsql,$parameters);
//verifica se o retorno é falso
if( $stmt === false ){
echo "Statement could not be executed.\n";
 die( print_r( sqlsrv_errors(), true));
} 


//se nenhum erro ocorrer, redireciona a pagina
echo '<meta HTTP-EQUIV="Refresh" CONTENT="0.1; URL=visualizarAta.php">';

/* Free statement and connection resources. */
sqlsrv_free_stmt( $stmt);

sqlsrv_close( $conn);




?>


