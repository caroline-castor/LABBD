--DROP TRIGGER t_insertof_membrosPresentes
CREATE TRIGGER t_insertof_membrosPresentes ON MEMBROSPRESENTES INSTEAD OF INSERT
AS
	BEGIN
		DECLARE
			@nroOrdem INT,
			@cpf VARCHAR(15),
			@id_membro INT,
			@ocorrenciaMembro INT,
			@ocorrenciaReuniaoConselho INT
			
		SELECT @nroOrdem= nroOrdemReuniao, @cpf = CPF, @id_membro= id_membro FROM inserted
		SET @ocorrenciaReuniaoConselho = (SELECT COUNT(DISTINCT codigoCoordenacaoCurso) FROM v_visualizaReuniao WHERE codigoCoordenacaoCurso IN(SELECT codigoCoordenacaoCurso FROM v_visualizaMembro WHERE CPF=@cpf))
			 IF @ocorrenciaReuniaoConselho > 0
				BEGIN
				  INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF,id_membro) VALUES (@nroOrdem, @cpf, @id_membro)
				END;
			
		ELSE
			RAISERROR('Membro não faz parte do conselho que organizou a reunião', 50001, 1)
			
			
	END;
GO

--DROP TRIGGER t_deleteof_decisoesAprovadas
CREATE TRIGGER t_deleteof_decisoesAprovadas ON DECISOESAPROVADAS INSTEAD OF DELETE
AS
	BEGIN
		DECLARE
			@id_decisao INT,
			@id_intervencao INT,
			@nroOrdemReuniao INT
	
		SELECT @id_decisao= id_decisao, @id_intervencao = id_intervencao,
		 @nroOrdemReuniao= nroOrdemReuniao FROM deleted
		DELETE FROM DECISOESAPROVADAS WHERE id_decisao = @id_decisao	
	END;
GO


--DROP TRIGGER t_deleteof_membrosIntervencao
CREATE TRIGGER t_deleteof_membrosIntervencao ON MEMBROSINTERVENCAO INSTEAD OF DELETE
AS
	BEGIN
		DECLARE
			@id_intervencao INT,
			@nroOrdemReuniao INT,
			@CPF VARCHAR(15),
			@intervencao VARCHAR(200)
	
		SELECT @id_intervencao = id_intervencao,
		 @nroOrdemReuniao= nroOrdemReuniao, @CPF = CPF, @intervencao = intervencao FROM deleted
		DELETE FROM DECISOESAPROVADAS WHERE id_intervencao = @id_intervencao
		DELETE FROM MEMBROSINTERVENCAO WHERE id_intervencao = @id_intervencao	
	END;
GO

--DROP TRIGGER t_deleteof_membrosPresentes
CREATE TRIGGER t_deleteof_membrosPresentes ON MEMBROSPRESENTES INSTEAD OF DELETE
AS
	BEGIN
		DECLARE
			@id_membro INT,
			@nroOrdemReuniao INT,
			@CPF VARCHAR(15),
			@id_intervencao INT
		SELECT @id_membro = id_membro, @nroOrdemReuniao= nroOrdemReuniao, @CPF=CPF FROM deleted
		DELETE FROM MEMBROSINTERVENCAO WHERE @CPF = @CPF
		DELETE FROM MEMBROSPRESENTES WHERE @id_membro = id_membro	
	END;
GO

--DROP TRIGGER t_deleteof_ata
CREATE TRIGGER t_deleteof_ata ON ATA INSTEAD OF DELETE
AS
	BEGIN
		DECLARE
			
			@nroOrdemReuniao INT
			
		SELECT @nroOrdemReuniao= nroOrdemReuniao FROM deleted
		DELETE FROM COMUNICACOESPRESIDENCIA WHERE @nroOrdemReuniao = nroOrdemReuniao
		DELETE FROM ATA WHERE @nroOrdemReuniao = nroOrdemReuniao
			
	END;
GO

--DROP TRIGGER t_deleteof_reuniao
CREATE TRIGGER t_deleteof_reuniao ON REUNIAO INSTEAD OF DELETE
AS
	BEGIN
		DECLARE
			
			@nroOrdem INT
			
		SELECT @nroOrdem= nroOrdem FROM deleted
		DELETE FROM MEMBROSPRESENTES WHERE nroOrdemReuniao = @nroOrdem
		DELETE FROM REUNIAO WHERE nroOrdem = @nroOrdem
			
	END;
GO