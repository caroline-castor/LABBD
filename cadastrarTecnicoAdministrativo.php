<?php require_once 'connectToSQLServer.php';


$tsql = "INSERT INTO TecnicoAdm(cpf_tecnicoAdm, SIAPE, trabalha_em) VALUES (?,?,?)";
$parameters = [$_POST['cpf_tecnicoAdm'],$_POST['SIAPE'], $_POST['trabalha_em']];
$stmt = sqlsrv_query($conn, $tsql, $parameters);
if( $stmt === false ){
echo "Statement could not be executed.\n";
 die( print_r( sqlsrv_errors(), true));
} 
echo '<meta HTTP-EQUIV="Refresh" CONTENT="0.1; URL=visualizarTecnicoAdm.php">';
/* Free statement and connection resources. */
sqlsrv_free_stmt( $stmt);
sqlsrv_close( $conn);

?>
