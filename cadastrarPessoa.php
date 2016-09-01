<?php require_once 'connectToSQLServer.php';


$tsql = "INSERT INTO PESSOA(CPF, email, email2, telefone, telefone2,nome, sobrenome) VALUES (?,?,?,?,?,?,?)";
$parameters = [$_POST['cpf'],$_POST['email1'], $_POST['email2'],$_POST['telefone1'], $_POST['telefone2'], $_POST['nome'] , $_POST['sobrenome']];
$stmt = sqlsrv_query($conn, $tsql, $parameters);
if( $stmt === false ){
echo "Statement could not be executed.\n";
 die( print_r( sqlsrv_errors(), true));
} 
echo '<meta HTTP-EQUIV="Refresh" CONTENT="0.1; URL=visualizarPessoa.php">';
/* Free statement and connection resources. */
sqlsrv_free_stmt( $stmt);
sqlsrv_close( $conn);




?>
