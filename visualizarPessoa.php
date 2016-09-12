<?php
require_once 'connectToSQLServer.php';

$tsql = "SELECT * FROM PESSOA";
$stmt = sqlsrv_query($conn, $tsql);
?>

<html>
    <head>

        <meta http-equiv="content-Type" content="text/html; charset=UTF-8" /> 
      
        <title>Pessoas</title>
    </head>
    <link rel="stylesheet" type="text/css" href="Estilo/style.css">
    <body>
       
        <div id="tudo">
<?php require_once 'cabecalho.php'; ?>
            <div id="conteudo">

                <table border="1" align="center">
                    <tr align="center" style="font-weight:bold">
                        <td>CPF</td>
                        <td>Nome</td>
                        <td>Sobrenome</td>
                        <td>Email</td>
                        <td>Email 2</td>
                        <td>Telefone</td>
                        <td>Telefone 2</td>
                        <td>Data de Nascimento</td>
                        <td>RG</td>
                        <td>Sexo</td>
                        <td>Etnia</td>
                        <td>Nome do Pai</td>
                        <td>Sobrenome do Pai</td>
                        <td>Nome da Mae</td>
                        <td>Sobrenome da Mae</td>
                        <td>Cidade Natal</td>
                        <td>Estado Natal</td>
                        <td>Nacionalidade</td>
                        <td>Bairro</td>
                        <td>Cidade</td>
                        <td>Logradouro</td>
                        <td>Numero da Casa</td>
                        <td>Estado</td>
                        <td>Pais</td>                        
                    </tr>
<?php while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) { ?>
                        <tr>
                            <td><?php echo $row['cpf_pessoa']; ?>&nbsp; </td>
                            <td><?php echo $row['nome']; ?>&nbsp; </td>
                            <td><?php echo $row['sobrenome']; ?>&nbsp; </td>
                            <td><?php echo $row['email1']; ?>&nbsp; </td>
                            <td><?php echo $row['email2']; ?>&nbsp; </td>
                            <td><?php echo $row['tel1']; ?>&nbsp; </td>
                            <td><?php echo $row['tel2']; ?>&nbsp; </td>
                            <td><?php echo date_format($row['dataNascimento'],'d/m/Y'); ?>&nbsp; </td>
                            <td><?php echo $row['rg']; ?>&nbsp; </td>
                            <td><?php echo $row['sexo']; ?>&nbsp; </td
                            <td><?php echo $row['etnia']; ?>&nbsp; </td>
                            <td><?php echo $row['pai_nome']; ?>&nbsp; </td>
                            <td><?php echo $row['pai_sobrenome']; ?>&nbsp; </td>
                            <td><?php echo $row['mae_nome']; ?>&nbsp; </td>
                            <td><?php echo $row['mae_Sobrenome']; ?>&nbsp; </td>
                            <td><?php echo $row['nasce_cidade']; ?>&nbsp; </td>
                            <td><?php echo $row['nasce_UF']; ?>&nbsp; </td>
                            <td><?php echo $row['nasce_pais']; ?>&nbsp; </td>
                            <td><?php echo $row['endereco_bairro']; ?>&nbsp; </td>
                            <td><?php echo $row['endereco_cidade']; ?>&nbsp; </td>
                            <td><?php echo $row['endereco_logradouro']; ?>&nbsp; </td>
                            <td><?php echo $row['endereco_numero']; ?>&nbsp; </td>
                            <td><?php echo $row['endereco_uf']; ?>&nbsp; </td>
                            <td><?php echo $row['endereco_pais']; ?>&nbsp; </td>
                            <td class="actions">
                                <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#myModal">Excluir</button>
                            </td>
                        </tr>
<?php } ?>

                </table>
                <br />

            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    </body>
</html>

<?php
sqlsrv_close($conn);
?>


