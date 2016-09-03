DROP PROCEDURE p_atualizaTextoDescritivoAta
GO
CREATE PROCEDURE p_atualizaTextoDescritivoAta(@texto VARCHAR(200), @codigoReuniao INT)
	AS
		BEGIN
			UPDATE ATA SET textoDescritivo = @texto WHERE nroOrdemReuniao = @codigoReuniao
		END;
GO

DROP PROCEDURE p_atualizaComunicacaoPresidencia
GO
CREATE PROCEDURE p_atualizaComunicacaoPresidencia(@texto VARCHAR(50), @codigoReuniao INT)
	AS
		BEGIN
			UPDATE COMUNICACOESPRESIDENCIA SET comunicacao = @texto WHERE nroOrdemReuniao = @codigoReuniao
		END;
GO

DROP PROCEDURE p_atualizaNomeCurso
GO
CREATE PROCEDURE p_atualizaNomeCurso(@texto VARCHAR(50), @codigoCurso INT)
	AS
		BEGIN
			UPDATE CURSO SET nome = @texto WHERE codigo = @codigoCurso
		END;
GO


DROP PROCEDURE p_alteraPauta
GO
CREATE PROCEDURE p_alteraPauta(@textoPauta VARCHAR(50), @codigoReuniao INT)
	AS
		BEGIN
			UPDATE REUNIAO SET pauta = @textoPauta WHERE @codigoReuniao = nroOrdem
		END;
GO



DROP FUNCTION f_totalReuniao
	GO
	CREATE FUNCTION f_totalReuniao()
		RETURNS INT
		AS
			BEGIN
				DECLARE @valor INT
				SET @valor = (SELECT COUNT(DISTINCT nroOrdem) FROM REUNIAO)	
			RETURN @valor;
		END
	GO


DROP FUNCTION f_totalMembros
	GO
	CREATE FUNCTION f_totalMembros()
		RETURNS INT
		AS
			BEGIN
				DECLARE @valor INT
				SET @valor = (SELECT COUNT(DISTINCT id_membro) FROM MEMBRO)	
			RETURN @valor;
		END
	GO

DROP FUNCTION f_totalMembrosPresentesReuniao
	GO
CREATE FUNCTION f_totalMembrosPresentesReuniao(@nroOrdem INT)
	RETURNS INT
	AS
		BEGIN
			DECLARE @valor INT
			SET @valor = (SELECT COUNT(DISTINCT CPF) FROM MEMBROSPRESENTES M WHERE M.nroOrdemReuniao=@nroOrdem)
		RETURN @valor
	END
	GO

	----------------------------------------------------------------------------------
	CREATE PROCEDURE p_buscaSigla(@codigoCurso INT)
	AS
		BEGIN
			SELECT sigla FROM CONSELHOCOORDENACAOCURSO WHERE codigoCurso=@codigoCurso
		END;
GO


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'p_buscaSigla')
DROP PROCEDURE p_buscaSigla
GO
CREATE PROCEDURE p_buscaSigla(@codigoCurso INT)
AS
	BEGIN
		SELECT sigla FROM CONSELHOCOORDENACAOCURSO WHERE codigoCurso=@codigoCurso
	END;
GO

-- Insere Centro Acadêmico
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'p_insereCentroAcademico')
DROP PROCEDURE p_insereCentroAcademico
GO
CREATE PROCEDURE p_insereCentroAcademico(@sigla NVARCHAR(10), @nome NVARCHAR(255))
    AS
	  BEGIN
   		 INSERT INTO Ofertante
   		 VALUES (@sigla, @nome);

   		 INSERT INTO CentroAcademico
   		 VALUES (@sigla);
   	 END;
GO

-- Insere Departamento
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'p_insereDepartamento')
DROP PROCEDURE p_insereDepartamento
GO
CREATE PROCEDURE p_insereDepartamento(@sigla NVARCHAR(10), @nome NVARCHAR(255), @siglaCA NVARCHAR(10), 
										@area NVARCHAR(20), @localizacao CHAR(21))
    AS
	  BEGIN
   		 INSERT INTO Ofertante
   		 VALUES (@sigla, @nome);
   		 
   		 INSERT INTO Departamento
   		 VALUES (@sigla, @siglaCA, @area, @localizacao);
   	 END;
GO



