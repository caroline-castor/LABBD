<?php require_once 'connectToSQLServer.php';


$tsql = "INSERT INTO Docente(cpf_docente, SIAPE, ligadoA) VALUES (?,?,?)";
$parameters = [$_POST['cpf_docente'],$_POST['SIAPE'], $_POST['ligadoA']];
$stmt = sqlsrv_query($conn, $tsql, $parameters);
if( $stmt === false ){
echo "Statement could not be executed.\n";
 die( print_r( sqlsrv_errors(), true));
} 
echo '<meta HTTP-EQUIV="Refresh" CONTENT="0.1; URL=visualizarDocente.php">';
/* Free statement and connection resources. */
sqlsrv_free_stmt( $stmt);
sqlsrv_close( $conn);

?>