<?php require_once 'connectToSQLServer.php';


// Armazena a query de insercao
$tsql = "INSERT INTO MEMBROSINTERVENCAO (nroOrdemReuniao,CPF,intervencao) VALUES (?,?,?)";
$tsql2 = "SELECT CPF from MEMBRO WHERE id_membro =".$_POST['selecionaMembro'];
$stmt2 = sqlsrv_query($conn,$tsql2);
//verifica se o retorno é falso
if( $stmt2 === false ){
echo "Statement could not be executed 1.\n";
 die( print_r( sqlsrv_errors(), true));
} 

$CPF = sqlsrv_fetch_array($stmt2, SQLSRV_FETCH_ASSOC);

$parameters = [intval($_POST['nroOrdem']),$CPF['CPF'],$_POST['intervencao']];

//executa a query tsql, resultado fica em stmt
$stmt = sqlsrv_query($conn,$tsql,$parameters);
//verifica se o retorno é falso
if( $stmt === false ){
echo "Statement could not be executed 2.\n".$_POST['nroOrdem'];
 die( print_r( sqlsrv_errors(), true));
} 


//se nenhum erro ocorrer, redireciona a pagina
echo '<meta HTTP-EQUIV="Refresh" CONTENT="0.1; URL=visualizarIntervencao.php">';

/* Free statement and connection resources. */
sqlsrv_free_stmt( $stmt);
sqlsrv_free_stmt( $stmt2);

sqlsrv_close( $conn);




?>
