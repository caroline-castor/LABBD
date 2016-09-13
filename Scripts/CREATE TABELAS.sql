
DROP TABLE ENADE_realizado
DROP TABLE ENADE_avalia
DROP TABLE ENADE
DROP TABLE Sala
DROP TABLE TipoSala
DROP TABLE Predio
DROP TABLE COMUNICACOESPRESIDENCIA
DROP TABLE DECISOESAPROVADAS
DROP TABLE Estudante
DROP TABLE Docente
DROP TABLE TecnicoAdm
DROP TABLE MEMBROSINTERVENCAO
DROP TABLE MEMBROSPRESENTES
DROP TABLE MEMBRO
DROP TABLE Pessoa
DROP TABLE Departamento
DROP TABLE CentroAcademico
DROP TABLE Ofertante
DROP TABLE ATA
DROP TABLE REUNIAO
DROP TABLE CONSELHOCOORDENACAOCURSO
DROP TABLE CURSO
GO
--tabela atribuida a outro membro mas precisei para realizar inserts
CREATE TABLE CURSO(
	codigo INT IDENTITY(1,1)PRIMARY KEY NOT NULL,
	presencial VARCHAR(10),
	nome VARCHAR(50),
	campus VARCHAR(50)
);

CREATE TABLE CONSELHOCOORDENACAOCURSO(
	codigoCurso INT NOT NULL,
	FOREIGN KEY (codigoCurso) REFERENCES CURSO(codigo),
	sigla VARCHAR(20) NOT NULL,
	PRIMARY KEY (codigoCurso,sigla)
);

CREATE TABLE REUNIAO(
	nroOrdem INT PRIMARY KEY NOT NULL,
	pauta VARCHAR(50),
	tipoReuniao VARCHAR(50),
	continuacao VARCHAR(20),
	data DATE,
	codigoCoordenacaoCurso INT NOT NULL,
	siglaCoordenacaoCurso VARCHAR(20) NOT NULL,
	CONSTRAINT fk_reuniao FOREIGN KEY(codigoCoordenacaoCurso, siglaCoordenacaoCurso) REFERENCES CONSELHOCOORDENACAOCURSO(codigoCurso,sigla)

);

CREATE TABLE ATA(
	nroOrdemReuniao INT,
	textoDescritivo VARCHAR(200),
	FOREIGN KEY(nroOrdemReuniao) REFERENCES REUNIAO(nroOrdem),
	PRIMARY KEY(nroOrdemReuniao)
);

CREATE TABLE Ofertante (
    sigla   NVARCHAR(10)     NOT NULL,
    nome    NVARCHAR(255)     NOT NULL,

    CONSTRAINT pk_ofertante PRIMARY KEY (sigla)
);

CREATE TABLE CentroAcademico (
    siglaOfertante      NVARCHAR(10)     NOT NULL,

    CONSTRAINT pk_ca    PRIMARY KEY (siglaOfertante),
    CONSTRAINT fk_ca_ofertante    FOREIGN KEY (siglaOfertante)
        REFERENCES Ofertante (sigla)
);

CREATE TABLE Departamento (
    siglaOfertante  NVARCHAR(10)     NOT NULL,
    siglaCA         NVARCHAR(10)     NOT NULL,
    area            NVARCHAR(20)     NULL,
    localizacao     CHAR(21)         NULL,

    CONSTRAINT pk_departamento              PRIMARY KEY (siglaOfertante),
    CONSTRAINT fk_departamento_ofertante    FOREIGN KEY (siglaOfertante)
        REFERENCES Ofertante (sigla),
    CONSTRAINT fk_departamento_ca           FOREIGN KEY (siglaCA)
        REFERENCES CentroAcademico (siglaOfertante)
);

CREATE TABLE Pessoa(
	cpf_pessoa			NVARCHAR(14)	NOT NULL,
	email1				NVARCHAR(50)	NOT NULL,
	email2				NVARCHAR(50),
	tel1 				NVARCHAR(13)	NOT NULL,
	tel2 				NVARCHAR(13),
	nome 				NVARCHAR(30)	NOT NULL,
	sobrenome 			NVARCHAR(30)	NOT NULL,
	dataNascimento 		DATE 			NOT NULL,
	rg					NVARCHAR(13)	NOT NULL,
	sexo				NVARCHAR(20)	NOT NULL,
	etnia 				NVARCHAR(30)	NOT NULL,
	pai_nome 			NVARCHAR(50)	NOT NULL,
	pai_sobrenome   	NVARCHAR(50) 	NOT NULL,
	mae_nome 			NVARCHAR(50) 	NOT NULL,
	mae_Sobrenome 		NVARCHAR(50) 	NOT NULL,
	nasce_cidade 		NVARCHAR(30) 	NOT NULL,
	nasce_UF 			NVARCHAR(30)	NOT NULL,
	nasce_pais 			NVARCHAR(30) 	NOT NULL,
	endereco_bairro 	NVARCHAR(30)	NOT NULL,
	endereco_cidade 	NVARCHAR(30)	NOT NULL,
	endereco_logradouro NVARCHAR(30),
	endereco_numero 	NVARCHAR(30)	NOT NULL,
	endereco_uf 		NVARCHAR(30)	NOT NULL,
	endereco_pais 		NVARCHAR(30) 	NOT NULL,

	CONSTRAINT	pk_pessoa 	PRIMARY KEY (cpf_pessoa)
);

CREATE TABLE MEMBRO(
	id_membro INT IDENTITY(1,1) NOT NULL,
	CPF NVARCHAR(14) NOT NULL,
	portariaIdentificacao VARCHAR(50),
	codigoCoordenacaoCurso INT,
	sigla VARCHAR(20)
	CONSTRAINT fk_membro_pessoa FOREIGN KEY(CPF) REFERENCES Pessoa(cpf_pessoa),
	PRIMARY KEY(CPF, id_membro)
);

Alter Table MEMBRO ADD CONSTRAINT fk_membro_conselho FOREIGN KEY(codigoCoordenacaoCurso, sigla) references CONSELHOCOORDENACAOCURSO(codigoCurso, sigla) ;

CREATE TABLE MEMBROSPRESENTES(
	nroOrdemReuniao INT,
	CPF NVARCHAR(14),
	id_membro INT,
	FOREIGN KEY (nroOrdemReuniao) REFERENCES REUNIAO(nroOrdem),
	FOREIGN KEY (CPF, id_membro) REFERENCES MEMBRO(CPF, id_membro),
	PRIMARY KEY (nroOrdemReuniao,CPF)
);

CREATE TABLE MEMBROSINTERVENCAO(
	id_intervencao INT IDENTITY(1,1),
	nroOrdemReuniao INT,
	CPF Nvarchar(14),
	intervencao VARCHAR(200),
	FOREIGN KEY(nroOrdemReuniao,CPF) REFERENCES MEMBROSPRESENTES(nroOrdemReuniao,CPF),
	PRIMARY KEY(id_intervencao,nroOrdemReuniao)
);

CREATE TABLE TecnicoAdm(
	cpf_tecnicoAdm	NVARCHAR(14)	NOT NULL,
	SIAPE			NVARCHAR(20) 	NOT NULL,
	trabalha_em		NVARCHAR(10)	NOT NULL,

	CONSTRAINT 	pk_tecnicoAdm				PRIMARY KEY (cpf_tecnicoAdm),
	CONSTRAINT  fk_tecnicoAdm_pessoa    	FOREIGN KEY (cpf_tecnicoAdm) 	REFERENCES 	Pessoa 		(cpf_pessoa),
	CONSTRAINT	fk_tecnicoAdm_departamento	FOREIGN KEY (trabalha_em)		REFERENCES	Departamento(siglaOfertante)
);

CREATE TABLE Docente(
	cpf_docente 	NVARCHAR(14)	NOT NULL,
	SIAPE			NVARCHAR(20) 	NOT NULL,
	ligadoA			NVARCHAR(10)	NOT NULL,

	CONSTRAINT 	pk_Docente					PRIMARY KEY (cpf_docente),
	CONSTRAINT  fk_docente_pessoa	    	FOREIGN KEY (cpf_docente) 	REFERENCES 	Pessoa 		(cpf_pessoa),
	CONSTRAINT	fk_docente_departamento		FOREIGN KEY (ligadoA)		REFERENCES	Departamento(siglaOfertante)
);

CREATE TABLE Estudante(
	cpf_estudante	NVARCHAR(14)	NOT NULL,
	RA				NVARCHAR(6)		NOT NULL,
	anoConclusaoEm 	DATE 			NOT NULL,
	escolaEM		NVARCHAR(30)	NOT NULL,

	CONSTRAINT pk_estudante			PRIMARY KEY (cpf_estudante),
	CONSTRAINT fk_estudante_pessoa	FOREIGN KEY (cpf_estudante) REFERENCES Pessoa(cpf_pessoa)
);

CREATE TABLE DECISOESAPROVADAS(
	 id_decisao INT IDENTITY(1,1),
	 id_intervencao INT,
     nroOrdemReuniao INT,
	 FOREIGN KEY (id_intervencao,nroOrdemReuniao) REFERENCES MEMBROSINTERVENCAO(id_intervencao,nroOrdemReuniao),
	 PRIMARY KEY (nroOrdemReuniao, id_decisao, id_intervencao)
);


CREATE TABLE COMUNICACOESPRESIDENCIA(
	 id_comunicacao INT IDENTITY(1,1),
	 nroOrdemReuniao INT,
	 comunicacao VARCHAR(50),
	 CPF nVARCHAR(14),
	 id_membro INT,
	 FOREIGN KEY (CPF, id_membro) REFERENCES MEMBRO(CPF, id_membro),
	 FOREIGN KEY (nroOrdemReuniao) REFERENCES ATA(nroOrdemReuniao),
	 PRIMARY KEY (nroOrdemReuniao,id_comunicacao)

);

CREATE TABLE ENADE(
	ano int not null primary key,
	periodo int not null
);

CREATE TABLE ENADE_avalia(
	ano int not null,
	conceito int not null,
	codigo int not null,

	CONSTRAINT fk_enade FOREIGN KEY(ano)
	REFERENCES ENADE(ano),

	CONSTRAINT fk_enade_curso FOREIGN KEY(codigo)
	REFERENCES CURSO(codigo),

	CONSTRAINT pk_enade_avalia PRIMARY KEY(ano, codigo)
);

CREATE TABLE ENADE_realizado(
	ano int not null,
	cpf_estudante nvarchar(14) not null,
	data date,
	nota float not null,

	constraint fk_enadeR foreign key(ano)
	references ENADE(ano),

	constraint fk_estudante_enade foreign key(cpf_estudante)
	references Estudante(cpf_estudante),

	constraint pk_enade_realizado primary key(cpf_estudante, nota)
);

GO


CREATE TABLE PREDIO
(
sigla varchar(10),
imagem varchar(255),
mapaLocalizacao varchar(255),
gpsLat varchar(11),
gpsLog varchar(11),
descricao varchar(255),
intervaloSalaMenor smallint,
intervaloSalaMaior smallint,
CONSTRAINT pk_predio PRIMARY KEY (sigla)
);

CREATE TABLE TIPOSALA
(
sigla varchar(10) not null,
tipo varchar(255) not null,
CONSTRAINT pk_tipoSala PRIMARY KEY (sigla)
);

CREATE TABLE SALA
(
siglaPredio varchar(10),
numero smallint not null,
capacidadeEfetiva smallint not null,
capacidade smallint not null,
siglaTipo varchar(10),
CONSTRAINT fk_sala_predio FOREIGN KEY (siglaPredio) REFERENCES Predio(sigla),
CONSTRAINT fk_sala_tiposala FOREIGN KEY (siglaTipo) REFERENCES TipoSala(sigla),
CONSTRAINT pk_sala PRIMARY KEY (siglaPredio, numero)
);
GO
