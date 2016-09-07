--CREATE OR REPLACE
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
        WHERE TABLE_NAME = 'v_pessoa')
    DROP VIEW v_pessoa
GO
-- CODIGO VIEW
CREATE VIEW v_pessoa 
	AS
		SELECT CPF,nome FROM PESSOA
GO



--CREATE OR REPLACE SQL SERVER
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
        WHERE TABLE_NAME = 'v_membro')
    DROP VIEW v_membro
GO
--CODIGO VIEW
CREATE VIEW v_membro
	AS
		SELECT M.id_membro, M.CPF, P.nome, P.sobrenome FROM MEMBRO M, PESSOA P
			WHERE P.CPF = M.CPF

GO

-- CREATE OR REPLACE SQL SERVER
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
        WHERE TABLE_NAME = 'v_conselhoCoordCurso')
    DROP VIEW v_conselhoCoordCurso
GO
--CODIGO VIEW
CREATE VIEW v_conselhoCoordCurso
	AS
		SELECT CON.codigoCurso Codigo_Curso, C.nome Nome_Curso, CON.sigla Sigla_Curso FROM CONSELHOCOORDENACAOCURSO CON, CURSO C
GO

-- CREATE OR REPLACE SQL SERVER
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
        WHERE TABLE_NAME = 'v_membrosPresentesReuniao')
    DROP VIEW v_membrosPresentesReuniao
GO
--CODIGO VIEW
CREATE VIEW v_membrosPresentesReuniao
	AS
		SELECT M.nroOrdemReuniao Nro_Ordem_Reuniao, M.id_membro, M.CPF, P.nome Nome_Membro, P.sobrenome FROM MEMBROSPRESENTES M, PESSOA P
			WHERE P.CPF = M.CPF
GO




--CREATE OR REPLACE SQL SERVER
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
        WHERE TABLE_NAME = 'v_ata')
    DROP VIEW v_ata
GO
--CODIGO VIEW
CREATE VIEW v_ata
	AS
		SELECT R.pauta, R.data, A.textoDescritivo, C.nome, CC.sigla FROM ATA A, REUNIAO R, CURSO C, CONSELHOCOORDENACAOCURSO CC 
			WHERE (A.nroOrdemReuniao = R.nroOrdem) AND (R.codigoCoordenacaoCurso = C.codigo) AND (R.codigoCoordenacaoCurso = CC.codigoCurso)
GO


--CREATE OR REPLACE SQL SERVER
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
        WHERE TABLE_NAME = 'v_membroConselhoCoordenacaoCurso')
    DROP VIEW v_membroConselhoCoordenacaoCurso
GO
--CODIGO VIEW
CREATE VIEW v_membroConselhoCoordenacaoCurso
	AS
		SELECT MC.id_membro, P.nome nomePessoa, MC.codigoCoordenacaoCurso, C.nome nomeCurso FROM MEMBRO_CONSELHOCOORDENACAOCURSO MC,
		 PESSOA P, CURSO C
			WHERE MC.CPF = P.CPF AND MC.codigoCoordenacaoCurso = C.codigo
GO



-- CREATE OR REPLACE EM SQL_SERVER
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
        WHERE TABLE_NAME = 'v_comunicacoesPresidencia')
    DROP VIEW v_comunicacoesPresidencia
GO
--CODIGO VIEW
CREATE VIEW v_comunicacoesPresidencia
	AS
		SELECT COM.nroOrdemReuniao, R.data, C.nome nomeCurso, COM.comunicacao, P.nome nomeMembro FROM 
			COMUNICACOESPRESIDENCIA COM, REUNIAO R, CURSO C, PESSOA P
				WHERE COM.nroOrdemReuniao = R.nroOrdem AND C.codigo = R.codigoCoordenacaoCurso AND COM.CPF = P.CPF
GO
--------------------------------------------------------------------------------

--CREATE OR REPLACE
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
        WHERE TABLE_NAME = 'v_visualizaMembro')
    DROP VIEW v_visualizaMembro
GO
-- CODIGO VIEW
CREATE VIEW v_visualizaMembro
	AS
		SELECT M.id_membro, M.CPF, P.nome, P.sobrenome, M.portariaIdentificacao, M.sigla AS siglaCurso, C.nome as nomeCurso, M.codigoCoordenacaoCurso  FROM MEMBRO M, PESSOA P, CURSO C 
WHERE P.CPF=M.CPF AND C.codigo = M.codigoCoordenacaoCurso

GO

----------------- Centro Acadêmico -----------------------
-- CREATE OR REPLACE EM SQL SERVER
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
    	WHERE TABLE_NAME = 'v_centroAcademico')
	DROP VIEW v_centroAcademico;
GO

-- CODIGO VIEW
CREATE VIEW v_centroAcademico
    AS
   	 SELECT O.sigla AS Sigla, O.nome AS Nome
   	 FROM Ofertante O, CentroAcademico C
   		 WHERE O.sigla = C.siglaOfertante;
GO

---------------------- Departamento ----------------------
-- CREATE OR REPLACE EM SQL SERVER
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
    	WHERE TABLE_NAME = 'v_departamento')
	DROP VIEW v_departamento;
GO

-- CODIGO VIEW
CREATE VIEW v_departamento
    AS
   	 SELECT O.sigla AS Sigla, O.nome AS Nome,
   	 		CA.siglaOfertante AS SiglaCA
   	 FROM Ofertante O, CentroAcademico CA, Departamento D
   		 WHERE O.sigla = D.siglaOfertante AND
   		 	   CA.siglaOfertante = D.siglaCA;
GO


---------------------------02/09--------------------------------------------------------------------------------------------


IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
        WHERE TABLE_NAME = 'v_visualizaReuniaoSemAta')
    DROP VIEW v_visualizaReuniaoSemAta
	
GO
-- CODIGO VIEW
CREATE VIEW v_visualizaReuniaoSemAta
	AS
		
	SELECT * FROM v_visualizaReuniao WHERE nroOrdem NOT IN (SELECT nroOrdemReuniao FROM ATA)

GO

----------------------------------05/09-------------------------------------------------
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
        WHERE TABLE_NAME = 'v_visualizaReuniao')
    DROP VIEW v_visualizaReuniao
GO
-- CODIGO VIEW
CREATE VIEW v_visualizaReuniao
	AS
		SELECT nroOrdem, pauta, tipoReuniao, continuacao, data, nome AS nomeCurso, siglaCoordenacaoCurso, codigoCoordenacaoCurso FROM REUNIAO,CURSO WHERE  codigoCoordenacaoCurso = codigo

GO

IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
        WHERE TABLE_NAME = 'v_visualizaCoordenacaoReuniaoMembro')
    DROP VIEW v_visualizaCoordenacaoReuniaoMembro
	
GO
-- CODIGO VIEW
CREATE VIEW v_visualizaCoordenacaoReuniaoMembro
	AS
		
	SELECT * FROM v_visualizaMembro, v_visualizaReuniao vm WHERE codigoCoordenacaoCurso IN (SELECT codigoCoordenacaoCurso FROM REUNIAO R WHERE R.codigoCoordenacaoCurso = vm.codigoCoordenacaoCurso)

GO

--CREATE OR REPLACE SQL SERVER
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
        WHERE TABLE_NAME = 'v_membrosIntervencao')
    DROP VIEW v_membrosIntervencao
GO
--CODIGO VIEW
CREATE VIEW v_membrosIntervencao
	AS
		SELECT M.nroOrdemReuniao, M.id_intervencao, M.intervencao, R.pauta, M.CPF, P.nome, P.sobrenome FROM MEMBROSINTERVENCAO M, PESSOA P, REUNIAO R 
			WHERE P.CPF = M.CPF AND  M.nroOrdemReuniao = R.nroOrdem
GO


--CREATE OR REPLACE SQL SERVER
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
        WHERE TABLE_NAME = 'v_decisoesAprovadas')
    DROP VIEW v_decisoesAprovadas
GO
--CODIGO VIEW
CREATE VIEW v_decisoesAprovadas
	AS
		SELECT DA.id_decisao, DA.id_intervencao, DA.nroOrdemReuniao, MI.intervencao, MI.CPF, P.nome, P.sobrenome, R.pauta FROM
		DECISOESAPROVADAS DA, MEMBROSINTERVENCAO MI, PESSOA P, REUNIAO R WHERE DA.id_intervencao = MI.id_intervencao AND 
		MI.CPF = P.CPF AND DA.nroOrdemReuniao = R.nroOrdem;
GO
