<?php require_once 'connectToSQLServer.php';


$tsql = "INSERT INTO PESSOA(cpf_pessoa, email1, email2, tel1, tel2, nome, sobrenome, dataNascimento,"
        . "                 rg, sexo, etnia, pai_nome, pai_sobrenome, mae_nome, mae_sobrenome,"
        . "                 nasce_cidade, nasce_UF, nasce_pais, endereco_bairro, endereco_cidade,"
        . "                 endereco_logradouro, endereco_numero, endereco_uf, endereco_pais) "
        . "                 VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
$parameters = [$_POST['cpf_pessoa'],$_POST['email1'], $_POST['email2'],$_POST['tel1'], $_POST['tel2'], $_POST['nome'] , $_POST['sobrenome'] , $_POST['dataNascimento'], $_POST['rg'], $_POST['sexo'], $_POST['etnia'], $_POST['pai_nome'], $_POST['pai_sobrenome'], $_POST['mae_nome'], $_POST['mae_Sobrenome'], $_POST['nasce_cidade'], $_POST['nasce_UF'], $_POST['nasce_pais'], $_POST['endereco_bairro'], $_POST['endereco_cidade'], $_POST['endereco_logradouro'], $_POST['endereco_numero'], $_POST['endereco_uf'], $_POST['endereco_pais']];
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
