
INSERT INTO CURSO (presencial,nome,campus) VALUES ('sim','Ciencia da Computacao', 'São Carlos');
INSERT INTO CURSO (presencial,nome,campus) VALUES ('sim','Ciencia da Computacao', 'Sorocaba');
INSERT INTO CURSO (presencial,nome,campus) VALUES ('sim','Engenharia da Computacao', 'São Carlos');
INSERT INTO CURSO (presencial,nome,campus) VALUES ('nao','Sistemas de Informacao', 'São Carlos');
INSERT INTO CURSO (presencial,nome,campus) VALUES ('sim','Engenharia Eletrica', 'São Carlos');

INSERT INTO CONSELHOCOORDENACAOCURSO (codigoCurso, sigla) VALUES (1,'BCC_SCA');
INSERT INTO CONSELHOCOORDENACAOCURSO (codigoCurso, sigla) VALUES (2,'BCC_SOR');
INSERT INTO CONSELHOCOORDENACAOCURSO (codigoCurso, sigla) VALUES (3,'ENC_SCA');
INSERT INTO CONSELHOCOORDENACAOCURSO (codigoCurso, sigla) VALUES (4,'SI_DIST_SCA');
INSERT INTO CONSELHOCOORDENACAOCURSO (codigoCurso, sigla) VALUES (5,'ENGELETRICA_SCA');

INSERT INTO REUNIAO(nroOrdem, pauta, tipoReuniao, continuacao, data,
codigoCoordenacaoCurso, siglaCoordenacaoCurso) VALUES (1,'Atualizacao normas','presencial','nao', '30/01/2015',1,'BCC_SCA');

INSERT INTO REUNIAO(nroOrdem, pauta, tipoReuniao, continuacao, data,
codigoCoordenacaoCurso, siglaCoordenacaoCurso) VALUES (2,'Estabelecimento normas','presencial','nao', '24/02/2016',2,'BCC_SOR');

INSERT INTO REUNIAO(nroOrdem, pauta, tipoReuniao, continuacao, data,
codigoCoordenacaoCurso, siglaCoordenacaoCurso) VALUES (3,'Eleicao Coordenador','presencial','nao', '30/01/2015',3,'ENC_SCA');

INSERT INTO REUNIAO(nroOrdem, pauta, tipoReuniao, continuacao, data,
codigoCoordenacaoCurso, siglaCoordenacaoCurso) VALUES (4,'Eleicao Coordenador','presencial','sim', '31/01/2016',3,'ENC_SCA');

INSERT INTO REUNIAO(nroOrdem, pauta, tipoReuniao, continuacao, data,
codigoCoordenacaoCurso, siglaCoordenacaoCurso) VALUES (5,'Nova Grade Curso','presencial','nao', '04/07/2016',5,'ENGELETRICA_SCA');


INSERT INTO PESSOA(CPF,email,email2,telefone,telefone2,nome,sobrenome) VALUES ('00000000001','jose@gmail.com','','1630205678','','José','Santos');
INSERT INTO PESSOA(CPF,email,email2,telefone,telefone2,nome,sobrenome) VALUES ('00000000002','maria@gmail.com','','1633334455','1699998888','Maria','Silva');
INSERT INTO PESSOA(CPF,email,email2,telefone,telefone2,nome,sobrenome) VALUES ('00000000003','joao@gmail.com','joaosouza@gmail.com','1633222222','16878345667','Joao','Souza');
INSERT INTO PESSOA(CPF,email,email2,telefone,telefone2,nome,sobrenome) VALUES ('00000000004','ana@gmail.com','','1633339900','1691189980','Ana','Cardoso');
INSERT INTO PESSOA(CPF,email,email2,telefone,telefone2,nome,sobrenome) VALUES ('00000000005','fernanda@gmail.com','fernandacarvalho@hotmail.com','1630223456','','Fernanda','Carvalho');
INSERT INTO PESSOA(CPF,email,email2,telefone,telefone2,nome,sobrenome) VALUES ('00000000006','jorge@gmail.com','jorgedias@hotmail.com','1633483839','','Jorge','Dias');
INSERT INTO PESSOA(CPF,email,email2,telefone,telefone2,nome,sobrenome) VALUES ('00000000007','francisco@gmail.com','franciscosantos@hotmail.com','1633774829','','Francisco','Santos');
INSERT INTO PESSOA(CPF,email,email2,telefone,telefone2,nome,sobrenome) VALUES ('00000000008','luizameire@gmail.com','luiza@hotmail.com','1639098909','','Luiza','Meire');
INSERT INTO PESSOA(CPF,email,email2,telefone,telefone2,nome,sobrenome) VALUES ('00000000009','aparecidamachado@gmail.com','apmachado@hotmail.com','1637890878','','Aparecida','Machado');
INSERT INTO PESSOA(CPF,email,email2,telefone,telefone2,nome,sobrenome) VALUES ('00000000010','janaina@gmail.com','janainasilveira@hotmail.com','1633441166','','Janaina','Silveira');
INSERT INTO PESSOA(CPF,email,email2,telefone,telefone2,nome,sobrenome) VALUES ('00000000011','rafael@gmail.com','rafaelcastro','1633243466','','Rafael','Castro');

INSERT INTO MEMBRO(CPF,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000001','456437/1',3,'ENC_SCA');

INSERT INTO MEMBRO(CPF,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000002','456437/1',1,'BCC_SCA');

INSERT INTO MEMBRO(CPF,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000003','12344/0',1,'BCC_SCA');

INSERT INTO MEMBRO(CPF,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000004','5060594/0',2,'BCC_SOR');

INSERT INTO MEMBRO(CPF,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000005','531344/0',2,'BCC_SOR');
INSERT INTO MEMBRO(CPF,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000006','504567/0',3,'ENC_SCA');

INSERT INTO MEMBRO(CPF,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000007','57584/1',3,'ENC_SCA');

INSERT INTO MEMBRO(CPF,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000008','45684/1',4,'SI_DIST_SCA');

INSERT INTO MEMBRO(CPF,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000009','78684/1',4,'SI_DIST_SCA');

INSERT INTO MEMBRO(CPF,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000010','423484/1',5,'ENGELETRICA_SCA');

INSERT INTO MEMBRO(CPF,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000011','423484/1',5,'ENGELETRICA_SCA');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000002',1,'BCC_SCA',1,'20/04/2009');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000003',2,'BCC_SCA',1,'25/01/2010');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000004',3,'BCC_SCA',1,'25/01/2010');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000005',4,'BCC_SOR',2,'02/07/2010');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000006',5,'BCC_SOR',2,'07/05/2012');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000007',6,'ENC_SCA',3,'09/11/2008');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000008',7,'ENC_SCA',3,'11/10/2016');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000009',8,'SI_DIST_SCA',4,'25/08/2014');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000010',9,'SI_DIST_SCA',4,'17/01/2015');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000011',10,'ENGELETRICA_SCA',5,'22/08/2013');


INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF,id_membro)VALUES(1,'00000000002',1);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF,id_membro)VALUES(1,'00000000003',2);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF,id_membro)VALUES(1,'00000000004',3);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF,id_membro)VALUES(2,'00000000005',4);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF,id_membro)VALUES(2,'00000000006',5);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF,id_membro)VALUES(3,'00000000007',6);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF,id_membro)VALUES(3,'00000000008',7);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF,id_membro)VALUES(4,'00000000009',8);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF,id_membro)VALUES(4,'00000000010',9);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF,id_membro)VALUES(5,'00000000011',10);



INSERT INTO ATA(nroOrdemReuniao,textoDescritivo) VALUES (1,'Reuniao de Atualizacao de normas')
INSERT INTO ATA(nroOrdemReuniao,textoDescritivo) VALUES (2,'Reuniao de Estabelecimento de normas');
INSERT INTO ATA(nroOrdemReuniao,textoDescritivo) VALUES (3,'Reuniao de Eleicao de Coordenador');
INSERT INTO ATA(nroOrdemReuniao,textoDescritivo) VALUES (4,'Reuniao de Eleicao de Coordenador');
INSERT INTO ATA(nroOrdemReuniao,textoDescritivo) VALUES (5,'Estabelecimento Coordenador');


INSERT INTO DECISOESAPROVADAS(nroOrdemReuniao,decisoes) VALUES(1,'decisao 1');
INSERT INTO DECISOESAPROVADAS(nroOrdemReuniao,decisoes) VALUES(2,'decisao 4');
INSERT INTO DECISOESAPROVADAS(nroOrdemReuniao,decisoes) VALUES(2,'decisao 6');
INSERT INTO DECISOESAPROVADAS(nroOrdemReuniao,decisoes) VALUES(3,'decisao 1');
INSERT INTO DECISOESAPROVADAS(nroOrdemReuniao,decisoes) VALUES(4,'decisao 5');
INSERT INTO DECISOESAPROVADAS(nroOrdemReuniao,decisoes) VALUES(5,'decisao 1');



INSERT INTO MEMBROSINTERVENCAO(nroOrdemReuniao,CPF,id_membro) VALUES (1,'00000000004',3);
INSERT INTO MEMBROSINTERVENCAO(nroOrdemReuniao,CPF,id_membro) VALUES (2,'00000000006',5);
INSERT INTO MEMBROSINTERVENCAO(nroOrdemReuniao,CPF,id_membro) VALUES (3,'00000000008',7);
INSERT INTO MEMBROSINTERVENCAO(nroOrdemReuniao,CPF,id_membro) VALUES (4,'00000000009',8);

SELECT * FROM MEMBROSPRESENTES

INSERT INTO COMUNICACOESPRESIDENCIA(nroOrdemReuniao, comunicacao, CPF, id_membro) VALUES (1,'decidida proposta 1','00000000002',1);
INSERT INTO COMUNICACOESPRESIDENCIA(nroOrdemReuniao, comunicacao, CPF, id_membro) VALUES (2,'decidida proposta  4 e 6','00000000005',4);
INSERT INTO COMUNICACOESPRESIDENCIA(nroOrdemReuniao, comunicacao, CPF, id_membro) VALUES (3,'decidida proposta 1','00000000008',7);
INSERT INTO COMUNICACOESPRESIDENCIA(nroOrdemReuniao, comunicacao, CPF, id_membro) VALUES (4,'decidida proposta 5','00000000009',8);
INSERT INTO COMUNICACOESPRESIDENCIA(nroOrdemReuniao, comunicacao, CPF, id_membro) VALUES (5,'decidida proposta 1','00000000011',10);


GO