/*USE LABBD;
SET DATEFORMAT dmy;*/

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

/* -------------------- MURIEL -------------------- */

INSERT INTO Pessoa VALUES 
('13885350254','cmnascimento@solpro.biz','','6128296122','','Cauê Marcelo','Nascimento',convert(date,'1994-04-06'),'325814351','Masculino','Amarelo','João','Nascimento','Maria','Carvalho Nascimento','Santo Antônio do Descoberto','GO','Brasil','Parque Estrela Dalva XI','Santo Antônio do Descoberto','','959','GO','Brasil'),
('36022045452','bryan-henrique89@hotmail.co.jp','','6327369480','','Bryan Henrique','Barbosa',convert(date,'1994-10-15'),'344119567','Masculino','Negro','Bernando','Barbosa','Bernadete','Ypê Barbosa','Riachinho','TO','Brasil','Setor Central','Riachinho','','917','TO','Brasil'),
('70183866401','leonardo.cavalcanti@live.com.pt','','9128429903','','Leonardo Isaac','Rafael Cavalcanti',convert(date,'1994-11-08'),'212860793','Masculino','Indigena','Francisco','Pagé','Joana','Pescador Pagé','Belém','PA','Brasil','Mangueirão','Belém','','219','PA','Brasil'),
('53896948806','jialves@europamotors.com.br','','9635219207','','Joana Isabelle','Rebeca Alves',convert(date,'1994-09-19'),'278832398','Feminino','Branca','Elias','Alves','Rebeca','A. Alves','Macapá','AP','Brasil','Jardim Marco Zero','Macapá','','428','AP','Brasil'),
('97836548708','vitoria_carolina@asconnet.com.br','','6236301625','','Vitória','Fernandes',convert(date,'1994-10-17'),'341657256','Feminino','Parda','Vitor','Fernandes','Bruna','Silva Fernandes','Goiânia','GO','Brasil','Jardins Milão','Goiânia','','186','GO','Brasil'),
('97119617419','caio_h_monteiro@caporal.biz','','9228437231','','Caio Henrique','Monteiro',convert(date,'1986-11-24'),'286489016','Masculino','Branco','Joao','Monteiro','Maria','Monteiro','Manaus','AM','Brasil','Aparecida','Manaus','','686','AM','Brasil'),
('70033642630','gkdias@papayacomunicacao.com.br','','1436782495','','Giovanni Kevin','Dias',convert(date,'1986-06-13'),'199993531','Masculino','Pardo','Lucas','Dias','Luana','Dias','Marília','SP','Brasil','Parque das Acácias','Marília','','264','SP','Brasil'),
('68739747220','emanuelly_m_monteiro@carreira.com.br','','7726677791','','Emanuelly Marcela','Clara Monteiro',convert(date,'1986-05-12'),'242551786','Feminino','Branco','Henrique','Monteiro','Livia','Clara Monteiro','Vitória da Conquista','BA','Brasil','Jatobá','Vitória da Conquista','','958','BA','Brasil'),
('30961349603','lvalmeida@athoscontabil.com.br','','2137915733','','Laura Vitória','Alice Almeida',convert(date,'1986-04-01'),'224958574','Feminino','Negro','Leonardo','Almeida','Leticia','Alice Almeida','Belford Roxo','RJ','Brasil','Barro Vermelho','Belford Roxo','','834','RJ','Brasil'),
('85872499086','sarah-laura81@megamega.com.br','','4126694096','','Sarah Laura','Rafaela Castro',convert(date,'1986-07-21'),'329167613','Feminino','Branco','Zacarias','Castro','Lucineia','Rafaela Castro','Paranaguá','PR','Brasil','Ponta do Caju','Paranaguá','','100','PR','Brasil');

INSERT INTO TecnicoAdm VALUES
('13885350254','77889','DC'),
('36022045452','88997','DECiv'),
('70183866401','99887','DCSo'),
('53896948806','99778','DFisio'),
('97836548708','88779','DMed');

INSERT INTO Docente VALUES 
('53896948806','12345','DC'),
('97119617419','54321','DECiv'),
('70033642630','56897','DCSo'),
('68739747220','89754','DFisio'),
('30961349603','25468','DMed');

INSERT INTO Estudante VALUES 
('13885350254','11223',convert(date,'2018-01-01'),'Anglo'),
('97119617419','11332',convert(date,'2017-01-01'),'Objetivo'),
('70033642630','22113',convert(date,'2013-01-01'),'IF'),
('68739747220','22331',convert(date,'2015-01-01'),'Escola Estadual Dom Pedro II'),
('85872499086','33112',convert(date,'2019-01-01'),'FAAP');

INSERT INTO Predio VALUES
('AT1', '/images/at1.jpg', 'google.com.br/maps/', '-21.987959', '-47.879231', 'Aulas Teoricas 1', '1-19'),
('AT2', '/images/at2.jpg', 'google.com.br/maps/', '-21.987644', '-47.879145', 'Aulas Teoricas 2', '20-39'),
('AT3', '/images/at3.jpg', 'google.com.br/maps/', '-21.982078', '-47.881303', 'Aulas Teoricas 3', '40-59'),
('AT4', '/images/at4.jpg', 'google.com.br/maps/', '-21.982300', '-47.884003', 'Aulas Teoricas 4', '60-79'),
('AT5', '/images/at5.jpg', 'google.com.br/maps/', '-21.982164', '-47.879320', 'Aulas Teoricas 5', '80-99');

INSERT INTO TipoSala VALUES
('LabQ','Laboratorio de Quimica'),
('LabM','Laboratorio de Mecanica'),
('LabF','Laboratorio de Fisica'),
('Comp','Sala de Computadores'),
('LabMat','Laboratorio de Materiais');

INSERT INTO Sala VALUES
('AT1', 10, 30, 60, 'LabQ'),
('AT2', 20, 30, 60, 'LabF'),
('AT3', 43, 15, 30, 'LabM'),
('AT4', 69, 20, 40, 'Comp'),
('AT5', 96, 10, 15, 'LabMat');

/* -------------------- ------ -------------------- */

INSERT INTO PESSOA VALUES 
('00000000001','jose@gmail.com','','1630205678','','José','Santos',convert(date,'1990-01-01'),'325814351','M','HUMAN','john','doe','marie','doe','CIDADE','UF','PAIS','BAIRRO','CIDADE','LOGRADOURO','NUMERO','UF','PAIS'),
('00000000002','maria@gmail.com','','1633334455','1699998888','Maria','Silva',convert(date,'1990-01-01'),'111111111','F','HUMAN','john','doe','marie','doe','CIDADE','UF','PAIS','BAIRRO','CIDADE','LOGRADOURO','NUMERO','UF','PAIS'),
('00000000003','joao@gmail.com','joaosouza@gmail.com','1633222222','16878345667','Joao','Souza',convert(date,'1990-01-01'),'111111111','M','HUMAN','john','doe','marie','doe','CIDADE','UF','PAIS','BAIRRO','CIDADE','LOGRADOURO','NUMERO','UF','PAIS'),
('00000000004','ana@gmail.com','','1633339900','1691189980','Ana','Cardoso',convert(date,'1990-01-01'),'111111111','F','HUMAN','john','doe','marie','doe','CIDADE','UF','PAIS','BAIRRO','CIDADE','LOGRADOURO','NUMERO','UF','PAIS'),
('00000000005','fernanda@gmail.com','fernandacarvalho@hotmail.com','1630223456','','Fernanda','Carvalho',convert(date,'1990-01-01'),'111111111','F','HUMAN','john','doe','marie','doe','CIDADE','UF','PAIS','BAIRRO','CIDADE','LOGRADOURO','NUMERO','UF','PAIS'),
('00000000006','jorge@gmail.com','jorgedias@hotmail.com','1633483839','','Jorge','Dias',convert(date,'1990-01-01'),'111111111','M','HUMAN','john','doe','marie','doe','CIDADE','UF','PAIS','BAIRRO','CIDADE','LOGRADOURO','NUMERO','UF','PAIS'),
('00000000007','francisco@gmail.com','franciscosantos@hotmail.com','1633774829','','Francisco','Santos',convert(date,'1990-01-01'),'111111111','M','HUMAN','john','doe','marie','doe','CIDADE','UF','PAIS','BAIRRO','CIDADE','LOGRADOURO','NUMERO','UF','PAIS'),
('00000000008','luizameire@gmail.com','luiza@hotmail.com','1639098909','','Luiza','Meire',convert(date,'1990-01-01'),'111111111','F','HUMAN','john','doe','marie','doe','CIDADE','UF','PAIS','BAIRRO','CIDADE','LOGRADOURO','NUMERO','UF','PAIS'),
('00000000009','aparecidamachado@gmail.com','apmachado@hotmail.com','1637890878','','Aparecida','Machado',convert(date,'1990-01-01'),'111111111','F','marie','PNjohnOME','doe','MNOME','doe','CIDADE','UF','PAIS','BAIRRO','CIDADE','LOGRADOURO','NUMERO','UF','PAIS'),
('00000000010','janaina@gmail.com','janainasilveira@hotmail.com','1633441166','','Janaina','Silveira',convert(date,'1990-01-01'),'111111111','F','marie','john','doe','MNOME','doe','CIDADE','UF','PAIS','BAIRRO','CIDADE','LOGRADOURO','NUMERO','UF','PAIS'),
('00000000011','rafael@gmail.com','rafaelcastro','1633243466','','Rafael','Castro',convert(date,'1990-01-01'),'111111111','F','HUMAN','john','doe','marie','doe','CIDADE','UF','PAIS','BAIRRO','CIDADE','LOGRADOURO','NUMERO','UF','PAIS');

INSERT INTO MEMBRO(CPF_MEMBRO,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000001','456437/1',3,'ENC_SCA');

INSERT INTO MEMBRO(CPF_MEMBRO,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000002','456437/1',1,'BCC_SCA');

INSERT INTO MEMBRO(CPF_MEMBRO,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000003','12344/0',1,'BCC_SCA');

INSERT INTO MEMBRO(CPF_MEMBRO,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000004','5060594/0',2,'BCC_SOR');

INSERT INTO MEMBRO(CPF_MEMBRO,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000005','531344/0',2,'BCC_SOR');

INSERT INTO MEMBRO(CPF_MEMBRO,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000006','504567/0',3,'ENC_SCA');

INSERT INTO MEMBRO(CPF_MEMBRO,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000007','57584/1',3,'ENC_SCA');

INSERT INTO MEMBRO(CPF_MEMBRO,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000008','45684/1',4,'SI_DIST_SCA');

INSERT INTO MEMBRO(CPF_MEMBRO,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000009','78684/1',4,'SI_DIST_SCA');

INSERT INTO MEMBRO(CPF_MEMBRO,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000010','423484/1',5,'ENGELETRICA_SCA');

INSERT INTO MEMBRO(CPF_MEMBRO,portariaIdentificacao,codigoCoordenacaoCurso,
	sigla) VALUES ('00000000011','423484/1',5,'ENGELETRICA_SCA');


INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF_MCC,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000001',1,'BCC_SCA',1,'20/04/2009');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF_MCC,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000002',2,'BCC_SCA',1,'25/01/2010');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF_MCC,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000003',3,'BCC_SCA',1,'25/01/2010');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF_MCC,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000004',4,'BCC_SOR',2,'02/07/2010');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF_MCC,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000005',5,'BCC_SOR',2,'07/05/2012');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF_MCC,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000006',6,'ENC_SCA',3,'09/11/2008');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF_MCC,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000007',7,'ENC_SCA',3,'11/10/2016');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF_MCC,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000008',8,'SI_DIST_SCA',4,'25/08/2014');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF_MCC,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000009',9,'SI_DIST_SCA',4,'17/01/2015');

INSERT INTO MEMBRO_CONSELHOCOORDENACAOCURSO(CPF_MCC,id_membro,siglaCoordenacaoCurso,codigoCoordenacaoCurso,dataPosse)
	VALUES('00000000010',10,'ENGELETRICA_SCA',5,'22/08/2013');

INSERT INTO MEMBROSINTERVENCAO(nroOrdemReuniao,CPF_MI,intervencao) VALUES (1,'00000000003','Proposta de mudança de grade');
INSERT INTO MEMBROSINTERVENCAO(nroOrdemReuniao,CPF_MI,intervencao) VALUES (2,'00000000005','Proposta de mudança de ementa');
INSERT INTO MEMBROSINTERVENCAO(nroOrdemReuniao,CPF_MI,intervencao) VALUES (3,'00000000006','Proposta de divulgação de cursos');


INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF_MP,id_membro)VALUES(1,'00000000001',1);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF_MP,id_membro)VALUES(1,'00000000002',2);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF_MP,id_membro)VALUES(1,'00000000003',3);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF_MP,id_membro)VALUES(2,'00000000004',4);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF_MP,id_membro)VALUES(2,'00000000005',5);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF_MP,id_membro)VALUES(3,'00000000006',6);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF_MP,id_membro)VALUES(3,'00000000007',7);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF_MP,id_membro)VALUES(4,'00000000008',8);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF_MP,id_membro)VALUES(4,'00000000009',9);
INSERT INTO MEMBROSPRESENTES(nroOrdemReuniao,CPF_MP,id_membro)VALUES(5,'00000000010',10);


INSERT INTO ATA(nroOrdemReuniao,textoDescritivo) VALUES (1,'Reuniao de Atualizacao de normas')
INSERT INTO ATA(nroOrdemReuniao,textoDescritivo) VALUES (2,'Reuniao de Estabelecimento de normas');
INSERT INTO ATA(nroOrdemReuniao,textoDescritivo) VALUES (3,'Reuniao de Eleicao de Coordenador');
INSERT INTO ATA(nroOrdemReuniao,textoDescritivo) VALUES (4,'Reuniao de Eleicao de Coordenador');
INSERT INTO ATA(nroOrdemReuniao,textoDescritivo) VALUES (5,'Estabelecimento Coordenador');



INSERT INTO DECISOESAPROVADAS(nroOrdemReuniao,id_intervencao) VALUES(1,1);
INSERT INTO DECISOESAPROVADAS(nroOrdemReuniao,id_intervencao) VALUES(2,2);

INSERT INTO COMUNICACOESPRESIDENCIA(nroOrdemReuniao, comunicacao, CPF_CE, id_membro) VALUES (1,'decidida proposta 1','00000000001',1);
INSERT INTO COMUNICACOESPRESIDENCIA(nroOrdemReuniao, comunicacao, CPF_CE, id_membro) VALUES (2,'decidida proposta  4 e 6','00000000004',4);
INSERT INTO COMUNICACOESPRESIDENCIA(nroOrdemReuniao, comunicacao, CPF_CE, id_membro) VALUES (3,'decidida proposta 1','00000000007',7);
INSERT INTO COMUNICACOESPRESIDENCIA(nroOrdemReuniao, comunicacao, CPF_CE, id_membro) VALUES (4,'decidida proposta 5','00000000008',8);
INSERT INTO COMUNICACOESPRESIDENCIA(nroOrdemReuniao, comunicacao, CPF_CE, id_membro) VALUES (5,'decidida proposta 1','00000000010',10);

INSERT INTO Ofertante VALUES
('CCET', 'Centro de Ciências Exatas e de Tecnologia'),
('CCBS', 'Centro de Ciências Biológicas e da Saúde'),
('CECH', 'Centro de Educação e Ciências Humanas'),

('DC', 'Departamento de Computação'),
('DECiv', 'Departamento de Engenharia Civil'),
('DFisio', 'Departamento de Fisioterapia'),
('DMed', 'Departamento de Medicina'),
('DCSo', 'Departamento de Ciências Sociais'),
('DPsi', 'Departamento de Psicologia');

INSERT INTO CentroAcademico VALUES
('CCET'),
('CCBS'),
('CECH');

-- Dados retirados de www2.ufscar.br/vidaacademica/departamentos.php
-- Dados retirados do Google Maps
INSERT INTO Departamento VALUES
('DC', 'CCET', '', '-21.979704,-47.880556'),
('DECiv', 'CCET', '', '-21.981918,-47.880271'),
('DFisio', 'CCBS', '', '-21.977605,-47.880199'),
('DMed', 'CCBS', '', '-21.978036,-47.880359'),
('DCSo', 'CECH', '', '-21.988464,-47.882500'),
('DPsi', 'CECH', '', '-21.988400,-47.879933');

GO
