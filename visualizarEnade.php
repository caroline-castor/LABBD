<html>
    <head>
      	<meta charset="UTF-8">
        <title>ENADE</title>
        <style type="text/css">
        	.text{
        		text-align: justify;
        		font-size: 1.5em;
        	}
        	#ano_enade{
        		text-align: left;
        		font: small;
        	}
        	#title{
        		text-align: center;
        		font-size: 2.5em;
        		font-weight: bolder;
        		color: #900;
        	}
        	#textbox{
        		border: 1px solid;
        		padding: 20px; 
        		margin: 20px;
        	}
            
        </style>
    </head>
    <link rel="stylesheet" type="text/css" href="Estilo/style.css">
    <body>
        <!-- Modal -->
        
        <div id="tudo">
<?php require_once 'cabecalho.php'; ?>
            <div id="conteudo">
                <h1> ENADE </h1><br/>

                <div id="textbox">
                <h2 id="title">Exame Nacional de Desempenho de Estudantes</h2>
                <p class="text">
                	O Exame Nacional de Desempenho de Estudantes (Enade) avalia o rendimento dos concluintes dos cursos de graduação, em relação aos conteúdos programáticos, habilidades e competências adquiridas em sua formação. O Enade é obrigatório e a situação de regularidade do estudante no Exame deve constar em seu histórico escolar. A primeira aplicação do Enade ocorreu em 2004 e a periodicidade máxima da avaliação é trienal para cada área do conhecimento.

					O objetivo do Enade é avaliar o desempenho dos estudantes com relação aos conteúdos programáticos previstos nas diretrizes curriculares dos cursos de graduação, o desenvolvimento de competências e habilidades necessárias ao aprofundamento da formação geral e profissional, e o nível de atualização dos estudantes com relação à realidade brasileira e mundial, integrando o Sistema Nacional de Avaliação da Educação Superior (Sinaes).
                </p><br/>

                <p class="text">
                	Para verificar o desempenho dos cursos avaliados pelo ENADE, selecione o ano em que o exame ocorreu.
                </p><br/><br/>
                    <form action="visualizarConceitoEnade.php" method="POST">
                    <label for="ano_enade" id="ano_enade" name="ano_enade">
                		Selecione o ano em que o exame foi realizado:
	                </label>
	                <select name="ano">
	                	<option value="-">Selecione o ano</option>
	                	<option value="2011">2011</option>
	                	<option value="2012">2012</option>
	                	<option value="2013">2013</option>
	                	<option value="2014">2014</option>
	                	<option value="2015">2015</option>
	                </select>
	                <input type="submit" value="Buscar"/>
	                </form><br/><br/><br/>

                   <p class="text">
                    Para consultar o desempenho individual entre com o CPF:
                    <form action="visualizarNotaEnade.php" method="POST">
                        <label for="cpf_enade" id="cpf_enade">
                            CPF:
                        </label>
                        <input type="text" name="cpf_enade">
                        <input type="submit" value="Buscar">
                    </form>
                </div><br/>
            </div>


        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    </body>
</html>




