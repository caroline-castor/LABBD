<?php require_once 'connectToSQLServer.php';

$sigla = $_GET["sigla"];
$numero = $_GET["numero"];
// Armazena a query de insercao
$tsql = "DELETE FROM SALA WHERE siglaPredio='".$sigla."' and numero='".$numero."'";

//executa a query tsql, resultado fica em stmt
$stmt = sqlsrv_query($conn,$tsql);
//verifica se o retorno é falso
if( $stmt === false ){
  echo '<meta HTTP-EQUIV="Refresh" CONTENT="0.1; URL=visualizarSala.php">';
   die();
}


//se nenhum erro ocorrer, redireciona a pagina
echo '<meta HTTP-EQUIV="Refresh" CONTENT="0.1; URL=visualizarSala.php">';

/* Free statement and connection resources. */
sqlsrv_free_stmt( $stmt);


sqlsrv_close( $conn);




?>
