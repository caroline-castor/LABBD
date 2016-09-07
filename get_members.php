<?php
//Include database configuration file
require_once 'connectToSQLServer.php';

if(isset($_POST['nroOrdem']) && !empty($_POST['nroOrdem'])){
    //Get all state data
    $query = "SELECT * FROM v_visualizaCoordenacaoReuniaoMembro WHERE codigoCoordenacaoCurso=".$_POST["nroOrdem"];
    $query_exec = sqlsrv_query($conn, $query);
    //Count total number of rows
    $rowCount = sqlsrv_num_rows($query_exec);
    
    //Display states list
    if($rowCount > 0){
        
        while($row = sqlsrv_fetch_array($query_exec, SQLSRV_FETCH_ASSOC)){ 
            echo "<option value='" . $row['id_membro'] . "'>" . $row['CPF'].' - '. $row['nome'] . " " . $row['sobrenome'] . '</option>';
        }
    }else{
        echo '<option value="">Members not available</option>';
    }
}


?>