<?php require_once 'connectToSQLServer.php';


$tsql = "INSERT INTO Estudante(cpf_estudante, RA, anoConclusaoEm, escolaEM) VALUES (?,?,?,?)";
$parameters = [$_POST['cpf_estudante'],$_POST['RA'], $_POST['anoConclusaoEM'], $_POST['escolaEM']];
$stmt = sqlsrv_query($conn, $tsql, $parameters);
if( $stmt === false ){
echo "Statement could not be executed.\n";
 die( print_r( sqlsrv_errors(), true));
} 
echo '<meta HTTP-EQUIV="Refresh" CONTENT="0.1; URL=visualizarEstudante.php">';
/* Free statement and connection resources. */
sqlsrv_free_stmt( $stmt);
sqlsrv_close( $conn);

?>