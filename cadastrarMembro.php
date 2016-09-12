<?php require_once 'connectToSQLServer.php';

// Armazena a query de busca da sigla do curso de acordo com o codigo
$tsql = "exec p_buscaSigla ".$_POST['selecionaCurso'];
// Armazena a query de insercao
$tsql2 = "INSERT INTO MEMBRO(CPF, portariaIdentificacao, codigoCoordenacaoCurso, sigla) VALUES (?,?,?,?)";

//executa a query tsql, resultado fica em stmt
$stmt = sqlsrv_query($conn,$tsql);
//verifica se o retorno é falso
if( $stmt === false ){
echo "Statement could not be executed.\n";
 die( print_r( sqlsrv_errors(), true));
} 
//pega o resultado da execucao de stmt
$sigla=sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC);

$codigoCurso = $_POST['selecionaCurso'];

$parameters = [$_POST['selecionaPessoa'],$_POST['portariaIdentificacao'], $codigoCurso,$sigla['sigla']];

//executa a tsql2
$stmt2 = sqlsrv_query($conn, $tsql2, $parameters);
//verifica erro
if( $stmt2 === false ){
echo "Statement could not be executed.\n";
 die( print_r( sqlsrv_errors(), true));
} 

//se nenhum erro ocorrer, redireciona a pagina
echo '<meta HTTP-EQUIV="Refresh" CONTENT="0.1; URL=visualizarMembro.php">';

/* Free statement and connection resources. */
sqlsrv_free_stmt( $stmt);
sqlsrv_free_stmt( $stmt2);
sqlsrv_close( $conn);




?>
