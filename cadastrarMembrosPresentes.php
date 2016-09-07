<?php

require_once 'connectToSQLServer.php';
header('Content-Type: text/html; charset=iso-8859-1');

$membros = $_POST['my-select'];

for ($i = 0; $i < count($membros); $i++) {

    // Armazena a query de insercao
    $tsql = "INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF,id_membro) VALUES (?,?,?)";
    $tsql2 = "SELECT CPF FROM MEMBRO WHERE id_membro=" . $membros[$i];

//executa a query tsql, resultado fica em stmt
    $stmt2 = sqlsrv_query($conn, $tsql2);
//verifica se o retorno é falso
    if ($stmt2 === false) {
///echo "Statement could not be executed.\n";
        die(print_r(sqlsrv_errors(), true));
    }

    $cpf = sqlsrv_fetch_array($stmt2, SQLSRV_FETCH_ASSOC);


    $parameters = [$_POST['nroOrdem'], $cpf['CPF'], $membros[$i]];

//executa a query tsql, resultado fica em stmt
    $stmt = sqlsrv_query($conn, $tsql, $parameters);
//verifica se o retorno é falso
    if ($stmt === false) {
   

        //die( print_r( sqlsrv_errors(), true));
    }


//se nenhum erro ocorrer, redireciona a pagina
echo '<meta HTTP-EQUIV="Refresh" CONTENT="0.1; URL=visualizarMembrosPresentes.php">';

    /* Free statement and connection resources. */

    sqlsrv_close($conn);
}
?>
