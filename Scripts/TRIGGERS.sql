---- CAROLINE -------
DROP TRIGGER t_insertof_membrosPresentes
GO
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


DROP TRIGGER t_deleteof_decisoesAprovadas
GO
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

DROP TRIGGER t_deleteof_membrosIntervencao
GO
CREATE TRIGGER t_deleteof_membrosIntervencao ON MEMBROSINTERVENCAO INSTEAD OF DELETE
AS
	BEGIN
		DECLARE
			@id_intervencao INT,
			@nroOrdemReuniao INT,
			@CPF VARCHAR(15),
			@intervencao VARCHAR(200),
			@id_decisao INT

		 SELECT @id_intervencao = id_intervencao,
		 @nroOrdemReuniao= nroOrdemReuniao, @CPF = CPF, @intervencao = intervencao FROM deleted
		 SET @id_decisao = (SELECT id_decisao FROM DECISOESAPROVADAS WHERE id_intervencao = @id_intervencao)
	     DELETE FROM DECISOESAPROVADAS WHERE  id_decisao= @id_decisao
		 DELETE FROM MEMBROSINTERVENCAO WHERE id_intervencao = @id_intervencao

	END;
GO

DROP TRIGGER t_deleteof_membrosPresentes
GO
CREATE TRIGGER t_deleteof_membrosPresentes ON MEMBROSPRESENTES INSTEAD OF DELETE
AS
	BEGIN
		DECLARE
			@id_membro INT,
			@nroOrdemReuniao INT,
			@CPF VARCHAR(15),
			@id_intervencao INT
		    SELECT @id_membro = id_membro, @nroOrdemReuniao= nroOrdemReuniao, @CPF=CPF FROM deleted
			DECLARE i_cursor CURSOR FOR SELECT id_intervencao FROM MEMBROSINTERVENCAO WHERE CPF = @CPF
			OPEN i_cursor
			FETCH NEXT FROM i_cursor INTO @id_intervencao
			WHILE @@FETCH_STATUS =0
				BEGIN
					DELETE FROM MEMBROSINTERVENCAO WHERE id_intervencao = @id_intervencao
					FETCH NEXT FROM i_cursor INTO @id_intervencao
				END
			CLOSE i_cursor
			DEALLOCATE i_cursor
			DELETE FROM MEMBROSPRESENTES WHERE id_membro = @id_membro

		END;
GO

DROP TRIGGER t_deleteof_ata
GO
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


DROP TRIGGER t_deleteof_reuniao
GO
CREATE TRIGGER t_deleteof_reuniao ON REUNIAO INSTEAD OF DELETE
AS
	BEGIN
		DECLARE
			@nroOrdem INT,
			@id_membro INT
		SELECT @nroOrdem= nroOrdem FROM deleted
		DELETE FROM ATA WHERE nroOrdemReuniao = @nroOrdem
		DECLARE mp_cursor CURSOR LOCAL FOR
			SELECT id_membro FROM MEMBROSPRESENTES WHERE nroOrdemReuniao = @nroOrdem
			OPEN mp_cursor
			FETCH NEXT FROM mp_cursor INTO @id_membro

			WHILE @@FETCH_STATUS = 0
			BEGIN
				DELETE FROM MEMBROSPRESENTES WHERE id_membro = @id_membro
				FETCH NEXT FROM mp_cursor INTO @id_membro
			END;
		CLOSE mp_cursor
		DEALLOCATE mp_cursor
		DELETE FROM REUNIAO WHERE nroOrdem = @nroOrdem

	END;
GO

DROP TRIGGER t_deleteof_ccursos
GO
CREATE TRIGGER t_deleteof_ccursos ON CONSELHOCOORDENACAOCURSO INSTEAD OF DELETE
AS
	BEGIN
		DECLARE
		@codigoCurso INT,
		@sigla VARCHAR(20),
		@id_membro INT,
		@nroOrdem INT
		SELECT @codigoCurso = codigoCurso, @sigla = sigla FROM DELETED
		DECLARE m_cursor CURSOR FOR SELECT id_membro FROM MEMBRO WHERE codigoCoordenacaoCurso = @codigoCurso
		OPEN m_cursor
		FETCH NEXT FROM m_cursor INTO @id_membro
		WHILE @@FETCH_STATUS =0
			BEGIN
				DELETE FROM MEMBRO WHERE id_membro = @id_membro
				FETCH NEXT FROM m_cursor INTO @id_membro
			END
		CLOSE m_cursor
		DEALLOCATE m_cursor
		DECLARE r_cursor CURSOR FOR SELECT nroOrdem FROM REUNIAO WHERE codigoCoordenacaoCurso = @codigoCurso
		OPEN r_cursor
		FETCH NEXT FROM r_cursor INTO @nroOrdem
		WHILE @@FETCH_STATUS = 0
			BEGIN
				DELETE FROM REUNIAO WHERE nroOrdem = @nroOrdem
				FETCH NEXT FROM r_cursor INTO @nroOrdem
			END
		CLOSE r_cursor
		DEALLOCATE r_cursor
		DELETE FROM CONSELHOCOORDENACAOCURSO WHERE codigoCurso = @codigoCurso
	END;
GO

	DROP TRIGGER t_deleteof_membro
	GO
	CREATE TRIGGER t_deleteof_membro ON MEMBRO INSTEAD OF DELETE
	AS
	BEGIN
		 DECLARE
		 @id_membro INT,
		 @id_comunicacao INT

		 SELECT @id_membro= id_membro FROM DELETED
		 DELETE FROM MEMBROSPRESENTES WHERE id_membro = @id_membro
		 DECLARE cp_cursor CURSOR FOR SELECT id_comunicacao FROM COMUNICACOESPRESIDENCIA WHERE id_membro = @id_membro
		 OPEN cp_cursor
		 FETCH NEXT FROM cp_cursor INTO @id_comunicacao
		 WHILE @@FETCH_STATUS =0
			BEGIN
				DELETE FROM COMUNICACOESPRESIDENCIA WHERE id_comunicacao = @id_comunicacao
				FETCH NEXT FROM cp_cursor INTO @id_comunicacao
			END
		CLOSE cp_cursor
		DEALLOCATE cp_cursor
		DELETE FROM MEMBRO WHERE id_membro = @id_membro
	END;
	GO

	DROP TRIGGER t_deleteof_curso
	GO
	CREATE TRIGGER t_deleteof_curso ON CURSO INSTEAD OF DELETE
	AS
	BEGIN
		 DECLARE
		 @codigo INT

		 SELECT @codigo= codigo FROM DELETED
		 DELETE FROM CONSELHOCOORDENACAOCURSO WHERE codigoCurso = @codigo
		 DELETE FROM CURSO WHERE codigo = @codigo
	END;
	GO

	DROP TRIGGER t_deleteof_pessoa
	GO
	CREATE TRIGGER t_deleteof_pessoa ON PESSOA INSTEAD OF DELETE
	AS
	BEGIN
		DECLARE @CPF NVARCHAR(14);
		DECLARE curr CURSOR FOR SELECT cpf_pessoa FROM deleted;

		OPEN curr;
		FETCH NEXT FROM curr INTO @CPF;
		WHILE @@FETCH_STATUS = 0
		BEGIN
				DELETE FROM Docente WHERE cpf_docente = @CPF
				DELETE FROM TecnicoAdm WHERE cpf_tecnicoAdm = @CPF
				DELETE FROM Estudante WHERE cpf_estudante = @CPF
				DELETE FROM MEMBRO WHERE CPF = @CPF
				DELETE FROM PESSOA WHERE cpf_pessoa = @CPF

				FETCH NEXT FROM curr INTO @CPF;
		END;
		CLOSE curr;
		DEALLOCATE curr;
	END;
GO

--------------------------------------------------------------------------------------------------------------------------------------------

DROP TRIGGER t_deleteof_departamento
GO

CREATE TRIGGER t_deleteof_departamento ON Departamento INSTEAD OF DELETE
AS
	BEGIN
		DECLARE @sigla NVARCHAR(10);
		DECLARE cur CURSOR FOR SELECT siglaOfertante FROM deleted;

		OPEN cur;
		FETCH NEXT FROM cur INTO @sigla;
		WHILE @@FETCH_STATUS = 0
	  BEGIN
			DELETE FROM Docente WHERE ligadoA = @sigla;
			DELETE FROM TecnicoAdm WHERE trabalha_em = @sigla;
			DELETE FROM Departamento WHERE siglaOfertante = @sigla;
			DELETE FROM Ofertante WHERE sigla = @sigla;

			FETCH NEXT FROM cur INTO @sigla;
	  END;

		CLOSE cur;
		DEALLOCATE cur;
	END;
GO

DROP TRIGGER t_deleteof_centroacademico;
GO
CREATE TRIGGER t_deleteof_centroacademico ON CentroAcademico INSTEAD OF DELETE
AS
	BEGIN
		DECLARE @sigla NVARCHAR(10);
		DECLARE curr CURSOR FOR SELECT siglaOfertante FROM deleted;

		OPEN curr;
		FETCH NEXT FROM curr INTO @sigla;
		WHILE @@FETCH_STATUS = 0
	  BEGIN
			DELETE FROM Departamento WHERE siglaCA = @sigla;
			DELETE FROM CentroAcademico WHERE siglaOfertante = @sigla;
			DELETE FROM Ofertante WHERE sigla = @sigla;
			FETCH NEXT FROM curr INTO @sigla;
	  END;

		CLOSE curr;
		DEALLOCATE curr;
	END;
GO

/* ------------------------------ MURIEL ------------------------------ */

/* ------------------------------ ------ ------------------------------ */


DROP TRIGGER t_deleteof_tiposala;
GO
CREATE TRIGGER t_deleteof_tiposala ON TIPOSALA INSTEAD OF DELETE
AS
	BEGIN
		DECLARE @sigla NVARCHAR(10);
		DECLARE curr CURSOR FOR SELECT sigla FROM deleted;

		OPEN curr;
		FETCH NEXT FROM curr INTO @sigla;
	WHILE @@FETCH_STATUS = 0
	  BEGIN
			DELETE FROM SALA WHERE siglaTipo = @sigla;
			DELETE FROM TIPOSALA WHERE sigla = @sigla;

			FETCH NEXT FROM curr INTO @sigla;
	  END;

		CLOSE curr;
		DEALLOCATE curr;
	END;
GO

DROP TRIGGER t_deleteof_predio;
GO
CREATE TRIGGER t_deleteof_predio ON PREDIO INSTEAD OF DELETE
AS
	BEGIN
		DECLARE @sigla NVARCHAR(10);
		DECLARE curr CURSOR FOR SELECT sigla FROM deleted;

		OPEN curr;
		FETCH NEXT FROM curr INTO @sigla;
		WHILE @@FETCH_STATUS = 0
	  BEGIN
			DELETE FROM SALA WHERE siglaPredio = @sigla;
			DELETE FROM PREDIO WHERE sigla = @sigla;

			FETCH NEXT FROM curr INTO @sigla;
	  END;

		CLOSE curr;
		DEALLOCATE curr;
	END;
GO

DROP TRIGGER t_insertof_sala;
GO
CREATE TRIGGER t_insertof_sala
ON SALA
FOR INSERT
AS
BEGIN
	DECLARE
	@NumeroSala	smallint,
	@Predio varchar(10),
	@IntMenor smallint,
	@IntMaior smallint

	SELECT @NumeroSala = numero, @Predio = siglaPredio FROM INSERTED
	SELECT @IntMenor = intervaloSalaMenor, @IntMaior = intervaloSalaMaior FROM PREDIO WHERE sigla = @Predio

	IF @NumeroSala > @IntMaior
		UPDATE PREDIO SET intervaloSalaMaior = @NumeroSala
		WHERE sigla = @Predio


	IF @NumeroSala < @IntMenor
		UPDATE PREDIO SET intervaloSalaMenor = @NumeroSala
		WHERE sigla = @Predio

END
GO
