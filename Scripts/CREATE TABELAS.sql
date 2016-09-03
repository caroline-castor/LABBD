
--tabela atribuida a outro membro mas precisei para realizar inserts
CREATE TABLE CURSO(
	codigo INT IDENTITY(1,1)PRIMARY KEY NOT NULL,
	presencial VARCHAR(10),
	nome VARCHAR(50),
	campus VARCHAR(50),
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

--tabela atribuida a outro membro mas precisei para realizar inserts
CREATE TABLE PESSOA(
	CPF VARCHAR(15) NOT NULL,
	email VARCHAR(50),
	email2 VARCHAR(50),
	telefone VARCHAR(15),
	telefone2 VARCHAR(15),
	nome VARCHAR(20),
	sobrenome VARCHAR(50),
	PRIMARY KEY(CPF)
);

CREATE TABLE MEMBRO(
	id_membro INT IDENTITY(1,1) NOT NULL,
	CPF VARCHAR(15) NOT NULL,
	portariaIdentificacao VARCHAR(50),
	codigoCoordenacaoCurso INT,
	sigla VARCHAR(20)
	CONSTRAINT fk_membro_pessoa FOREIGN KEY(CPF) REFERENCES PESSOA(CPF),
	PRIMARY KEY(CPF, id_membro)
);

Alter Table MEMBRO ADD CONSTRAINT fk_membro_conselho FOREIGN KEY(codigoCoordenacaoCurso, sigla) references CONSELHOCOORDENACAOCURSO(codigoCurso, sigla) ;

CREATE TABLE MEMBRO_CONSELHOCOORDENACAOCURSO(
	CPF VARCHAR(15),
	id_membro INT,
	siglaCoordenacaoCurso VARCHAR(20),
	codigoCoordenacaoCurso INT,
	dataPosse DATE,
	FOREIGN KEY(CPF, id_membro) REFERENCES MEMBRO(CPF, id_membro),
	FOREIGN KEY(codigoCoordenacaoCurso, siglaCoordenacaoCurso) REFERENCES CONSELHOCOORDENACAOCURSO(codigoCurso, sigla),
	PRIMARY KEY(CPF, id_membro, codigoCoordenacaoCurso, siglaCoordenacaoCurso)
);

CREATE TABLE MEMBROSPRESENTES(
	nroOrdemReuniao INT,
	CPF VARCHAR(15),
	id_membro INT,
	FOREIGN KEY (nroOrdemReuniao) REFERENCES REUNIAO(nroOrdem),
	FOREIGN KEY (CPF, id_membro) REFERENCES MEMBRO(CPF, id_membro),
	PRIMARY KEY (nroOrdemReuniao,CPF)
);
CREATE TABLE ATA(
	nroOrdemReuniao INT,
	textoDescritivo VARCHAR(200),
	FOREIGN KEY(nroOrdemReuniao) REFERENCES REUNIAO(nroOrdem),
	PRIMARY KEY(nroOrdemReuniao)
);

CREATE TABLE MEMBROSINTERVENCAO(
	id_intervencao INT IDENTITY(1,1),
	nroOrdemReuniao INT,
	CPF varchar(15),
	intervencao VARCHAR(200),
	FOREIGN KEY(nroOrdemReuniao,CPF) REFERENCES MEMBROSPRESENTES(nroOrdemReuniao,CPF),
	PRIMARY KEY(id_intervencao,nroOrdemReuniao)
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
	 CPF VARCHAR(15),
	 id_membro INT,
	 FOREIGN KEY (CPF, id_membro) REFERENCES MEMBRO(CPF, id_membro),
	 FOREIGN KEY (nroOrdemReuniao) REFERENCES ATA(nroOrdemReuniao),
	 PRIMARY KEY (nroOrdemReuniao,id_comunicacao)

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

GO
