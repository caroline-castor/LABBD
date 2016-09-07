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