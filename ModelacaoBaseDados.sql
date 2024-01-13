CREATE TABLE Estudante (
  EstudanteID int NOT NULL, 
  CursoID     int NOT NULL, 
  Nome        varchar(20) NULL, 
  Password    varchar(20) NULL, 
  PRIMARY KEY (EstudanteID));
CREATE TABLE Contacto (
  EstudanteID      int NOT NULL, 
  TipodeContactoID int NOT NULL, 
  Contacto         varchar(30) NULL, 
  PRIMARY KEY (EstudanteID, TipodeContactoID));
CREATE TABLE TipodeContacto (
  TipodeContactoID  int NOT NULL, 
  DescricaoContacto varchar(20) NULL, 
  PRIMARY KEY (TipodeContactoID));
CREATE TABLE Curso (
  CursoID       int NOT NULL, 
  InstituicaoID int NOT NULL, 
  Nome          varchar(35) NULL, 
  PRIMARY KEY (CursoID));
CREATE TABLE Instituicao (
  InstituicaoID     int NOT NULL, 
  TipodeInstituicao varchar(20) NULL, 
  Nome              varchar(50) NULL, 
  PRIMARY KEY (InstituicaoID));
CREATE TABLE Disciplina (
  CursoID    int NOT NULL, 
  NomeDisc   varchar(50) NULL, 
  NoticiasID int NOT NULL, 
  PRIMARY KEY (CursoID, 
  NoticiasID));
CREATE TABLE Noticias (
  NoticiasID            int NOT NULL, 
  TipodeNoticiasID      int NOT NULL, 
  NumerodeVisualizacoes int NULL, 
  PRIMARY KEY (NoticiasID));
CREATE TABLE Produtos (
  EstudanteID       int NOT NULL, 
  TiposdeProdutosID int NOT NULL, 
  Valor             decimal(19, 2) NULL, 
  NomeProduto       varchar(50) NULL, 
  PRIMARY KEY (EstudanteID, TiposdeProdutosID));
CREATE TABLE TiposdeProdutos (
  TiposdeprodutosID  int NOT NULL, 
  DescricaodoProduto varchar(20) NULL, 
  PRIMARY KEY (TiposdeprodutosID));
CREATE TABLE Transacao (
  TransacaoID          int NOT NULL, 
  EstudanteIDComprador int NOT NULL, 
  Data                 datetime NULL, 
  Hora                 varchar(10) NULL, 
  TaxaInstituicao      varchar(10) NULL, 
  NomeProduto          varchar(50) NULL, 
  EstudanteIDVendedor  int NULL, 
  TiposdeProdutosID    int NULL, 
  PRIMARY KEY (TransacaoID));
CREATE TABLE Fatura (
  FaturaID      int NOT NULL, 
  TransacaoID   int NOT NULL, 
  DataFatura    varchar(20) NULL, 
  HoraFatura    varchar(10) NULL, 
  ValorFaturado decimal(19, 2) NULL, 
  PRIMARY KEY (FaturaID));
CREATE TABLE Recibo (
  ReciboID    int NOT NULL, 
  FaturaID    int NOT NULL, 
  DataRecibo  varchar(20) NULL, 
  HoraRecibo  varchar(10) NULL, 
  ValorRecibo decimal(19, 2) NULL, 
  PRIMARY KEY (ReciboID));
CREATE TABLE Entregas (
  EntregaID        int NOT NULL, 
  TransacaoID      int NOT NULL, 
  DescricaoEntrega varchar(50) NOT NULL, 
  MoradaID         int NOT NULL, 
  PRIMARY KEY (EntregaID));
CREATE TABLE Morada (
  EstudanteID    int NOT NULL, 
  Rua            varchar(30) NULL, 
  NumeroPorta    int NULL, 
  MoradaID       int NOT NULL, 
  CodigoPostalID int NOT NULL, 
  PRIMARY KEY (MoradaID));
CREATE TABLE CodigoPostal (
  CodigoPostal   varchar(255) NOT NULL, 
  Localidade     varchar(30) NULL, 
  CodigoPostalID int NOT NULL, 
  PRIMARY KEY (CodigoPostalID));
CREATE TABLE TipodeNoticias (
  TipodeNoticiasID int NOT NULL, 
  DescNoticia      varchar(50) NULL, 
  PRIMARY KEY (TipodeNoticiasID));
ALTER TABLE Contacto ADD CONSTRAINT FKContacto735629 FOREIGN KEY (EstudanteID) REFERENCES Estudante (EstudanteID);
ALTER TABLE Contacto ADD CONSTRAINT FKContacto520420 FOREIGN KEY (TipodeContactoID) REFERENCES TipodeContacto (TipodeContactoID);
ALTER TABLE Estudante ADD CONSTRAINT FKEstudante605068 FOREIGN KEY (CursoID) REFERENCES Curso (CursoID);
ALTER TABLE Curso ADD CONSTRAINT FKCurso663059 FOREIGN KEY (InstituicaoID) REFERENCES Instituicao (InstituicaoID);
ALTER TABLE Disciplina ADD CONSTRAINT FKDisciplina310357 FOREIGN KEY (CursoID) REFERENCES Curso (CursoID);
ALTER TABLE Produtos ADD CONSTRAINT FKProdutos558363 FOREIGN KEY (EstudanteID) REFERENCES Estudante (EstudanteID);
ALTER TABLE Produtos ADD CONSTRAINT FKProdutos485660 FOREIGN KEY (TiposdeProdutosID) REFERENCES TiposdeProdutos (TiposdeprodutosID);
ALTER TABLE Transacao ADD CONSTRAINT FKTransacao143638 FOREIGN KEY (EstudanteIDVendedor, TiposdeProdutosID) REFERENCES Produtos (EstudanteID, TiposdeProdutosID);
ALTER TABLE Transacao ADD CONSTRAINT FKTransacao821006 FOREIGN KEY (EstudanteIDComprador) REFERENCES Estudante (EstudanteID);
ALTER TABLE Fatura ADD CONSTRAINT FKFatura558616 FOREIGN KEY (TransacaoID) REFERENCES Transacao (TransacaoID);
ALTER TABLE Recibo ADD CONSTRAINT FKRecibo406820 FOREIGN KEY (FaturaID) REFERENCES Fatura (FaturaID);
ALTER TABLE Morada ADD CONSTRAINT FKMorada601520 FOREIGN KEY (CodigoPostalID) REFERENCES CodigoPostal (CodigoPostalID);
ALTER TABLE Entregas ADD CONSTRAINT FKEntregas194439 FOREIGN KEY (MoradaID) REFERENCES Morada (MoradaID);
ALTER TABLE Entregas ADD CONSTRAINT FKEntregas724688 FOREIGN KEY (TransacaoID) REFERENCES Transacao (TransacaoID);
ALTER TABLE Morada ADD CONSTRAINT FKMorada977660 FOREIGN KEY (EstudanteID) REFERENCES Estudante (EstudanteID);
ALTER TABLE Noticias ADD CONSTRAINT FKNoticias178383 FOREIGN KEY (TipodeNoticiasID) REFERENCES TipodeNoticias (TipodeNoticiasID);
ALTER TABLE Disciplina ADD CONSTRAINT FKDisciplina371353 FOREIGN KEY (NoticiasID) REFERENCES Noticias (NoticiasID);

INSERT INTO Instituicao(InstituicaoID, TipodeInstituicao, Nome) VALUES (1, 'Politécnico', 'Instituto Politécnico do Cávado e Ave');
INSERT INTO Instituicao(InstituicaoID, TipodeInstituicao, Nome) VALUES (2, 'Universidade', 'Faculdade de Ciências da Universidade de Lisboa');
INSERT INTO Instituicao(InstituicaoID, TipodeInstituicao, Nome) VALUES (3, 'Universidade', 'Faculdade de Engenharia da Universidade do Porto');
INSERT INTO Instituicao(InstituicaoID, TipodeInstituicao, Nome) VALUES (4, 'Politécnico', 'Instituto Politécnico de Bragança');

INSERT INTO TipodeContacto(TipodeContactoID, DescricaoContacto) VALUES (1, 'Telefone');
INSERT INTO TipodeContacto(TipodeContactoID, DescricaoContacto) VALUES (2, 'E-mail');
INSERT INTO TipodeContacto(TipodeContactoID, DescricaoContacto) VALUES (3, 'Telemóvel');
INSERT INTO TipodeContacto(TipodeContactoID, DescricaoContacto) VALUES (4, 'Fax');

INSERT INTO Curso(CursoID, InstituicaoID, Nome) VALUES (1, 1, 'EDJD');
INSERT INTO Curso(CursoID, InstituicaoID, Nome) VALUES (2, 2, 'Engenharia Fisica');
INSERT INTO Curso(CursoID, InstituicaoID, Nome) VALUES (3, 1, 'Design Gráfico');
INSERT INTO Curso(CursoID, InstituicaoID, Nome) VALUES (4, 4, 'Design de Videojogos');
INSERT INTO Curso(CursoID, InstituicaoID, Nome) VALUES (5, 1, 'Engenharia Eletrica ');
INSERT INTO Curso(CursoID, InstituicaoID, Nome) VALUES (6, 1, 'EIM');
INSERT INTO Curso(CursoID, InstituicaoID, Nome) VALUES (7, 1, 'GAT');

INSERT INTO Estudante(EstudanteID, CursoID, Nome, Password) VALUES (23483, 1, 'Francisco Andrade', 'bananafrita');
INSERT INTO Estudante(EstudanteID, CursoID, Nome, Password) VALUES (45638, 7, 'Hugo Boss', 'worldBoss');
INSERT INTO Estudante(EstudanteID, CursoID, Nome, Password) VALUES (24563, 3, 'Donald Trump', 'trumptower');
INSERT INTO Estudante(EstudanteID, CursoID, Nome, Password) VALUES (43589, 4, 'Joel Miller', 'golfbat');
INSERT INTO Estudante(EstudanteID, CursoID, Nome, Password) VALUES (15634, 1, 'Nathan Drake', 'sicparvismagna');
INSERT INTO Estudante(EstudanteID, CursoID, Nome, Password) VALUES (65479, 5, 'Oliver Tsubasa', 'oliverbenji');

INSERT INTO Contacto(EstudanteID, TipodeContactoID, Contacto) VALUES (23483, 1, '253563778');
INSERT INTO Contacto(EstudanteID, TipodeContactoID, Contacto) VALUES (45638, 2, 'gmail@gmail.com');
INSERT INTO Contacto(EstudanteID, TipodeContactoID, Contacto) VALUES (24563, 3, '934567898');
INSERT INTO Contacto(EstudanteID, TipodeContactoID, Contacto) VALUES (43589, 2, 'branco@hotmail.com');
INSERT INTO Contacto(EstudanteID, TipodeContactoID, Contacto) VALUES (15634, 4, 'isto é um fax');
INSERT INTO Contacto(EstudanteID, TipodeContactoID, Contacto) VALUES (65479, 2, 'sovaco@gmail.com');

INSERT INTO TipodeNoticias(TipodeNoticiasID, DescNoticia) VALUES (1, 'Arte');
INSERT INTO TipodeNoticias(TipodeNoticiasID, DescNoticia) VALUES (2, 'Armazenamento de Dados');
INSERT INTO TipodeNoticias(TipodeNoticiasID, DescNoticia) VALUES (3, 'Eventos');
INSERT INTO TipodeNoticias(TipodeNoticiasID, DescNoticia) VALUES (4, 'Computadores');
INSERT INTO TipodeNoticias(TipodeNoticiasID, DescNoticia) VALUES (5, 'Fisica');

INSERT INTO Noticias(NoticiasID, TipodeNoticiasID, NumerodeVisualizacoes) VALUES (1, 2, 23);
INSERT INTO Noticias(NoticiasID, TipodeNoticiasID, NumerodeVisualizacoes) VALUES (2, 4, 45);
INSERT INTO Noticias(NoticiasID, TipodeNoticiasID, NumerodeVisualizacoes) VALUES (3, 3, 13);
INSERT INTO Noticias(NoticiasID, TipodeNoticiasID, NumerodeVisualizacoes) VALUES (4, 1, 67);
INSERT INTO Noticias(NoticiasID, TipodeNoticiasID, NumerodeVisualizacoes) VALUES (5, 5, 147);
INSERT INTO Noticias(NoticiasID, TipodeNoticiasID, NumerodeVisualizacoes) VALUES (6, 2, 87);

INSERT INTO TiposdeProdutos(TiposdeprodutosID, DescricaodoProduto) VALUES (1, 'Apontamentos');
INSERT INTO TiposdeProdutos(TiposdeprodutosID, DescricaodoProduto) VALUES (2, 'Livros');
INSERT INTO TiposdeProdutos(TiposdeprodutosID, DescricaodoProduto) VALUES (3, 'Explicações');
INSERT INTO TiposdeProdutos(TiposdeprodutosID, DescricaodoProduto) VALUES (4, null);

INSERT INTO Produtos(EstudanteID, TiposdeProdutosID, Valor, NomeProduto) VALUES (23483, 1, 24.50, 'Apontamentos de BD');
INSERT INTO Produtos(EstudanteID, TiposdeProdutosID, Valor, NomeProduto) VALUES (45638, 2, 15.89, 'Livro 4');
INSERT INTO Produtos(EstudanteID, TiposdeProdutosID, Valor, NomeProduto) VALUES (43589, 3, 15.00, 'Explicaçõs de Photoshop');
INSERT INTO Produtos(EstudanteID, TiposdeProdutosID, Valor, NomeProduto) VALUES (65479, 1, 12.89, 'Apontamentos de Cálculo');

INSERT INTO Transacao(TransacaoID, EstudanteIDComprador, Data, Hora, TaxaInstituicao, NomeProduto, EstudanteIDVendedor, TiposdeProdutosID) VALUES (1, 23483, '2022-08-09', '23:34', '5%', 'Livro 4', 45638, 2);
INSERT INTO Transacao(TransacaoID, EstudanteIDComprador, Data, Hora, TaxaInstituicao, NomeProduto, EstudanteIDVendedor, TiposdeProdutosID) VALUES (2, 45638, '2022-09-27', '12:13', '10%', 'Apontamentos de Cálculo', 65479, 1);
INSERT INTO Transacao(TransacaoID, EstudanteIDComprador, Data, Hora, TaxaInstituicao, NomeProduto, EstudanteIDVendedor, TiposdeProdutosID) VALUES (3, 65479, '2021-04-26', '16:45', '5%', 'Apontamentos de BD', 23483, 1);
INSERT INTO Transacao(TransacaoID, EstudanteIDComprador, Data, Hora, TaxaInstituicao, NomeProduto, EstudanteIDVendedor, TiposdeProdutosID) VALUES (4, 65479, '2022-05-30', '12:54', '5%', 'Explicações de Photoshop', 43589, 3);

INSERT INTO Fatura(FaturaID, TransacaoID, DataFatura, HoraFatura, ValorFaturado) VALUES (1, 1, '2022-08-10', '17:26', 15.89);
INSERT INTO Fatura(FaturaID, TransacaoID, DataFatura, HoraFatura, ValorFaturado) VALUES (2, 2, '2022-09-27', '15:15', 12.89);
INSERT INTO Fatura(FaturaID, TransacaoID, DataFatura, HoraFatura, ValorFaturado) VALUES (3, 3, '2022-04-26', '17:00', 24.50);

INSERT INTO Recibo(ReciboID, FaturaID, DataRecibo, HoraRecibo, ValorRecibo) VALUES (1, 1, '2022-08-10', '17:30', 15.89);
INSERT INTO Recibo(ReciboID, FaturaID, DataRecibo, HoraRecibo, ValorRecibo) VALUES (2, 2, '2022-09-27', '15:20', 12.89);
INSERT INTO Recibo(ReciboID, FaturaID, DataRecibo, HoraRecibo, ValorRecibo) VALUES (3, 3, '2022-04-26', '17:02', 24.50);

INSERT INTO CodigoPostal(CodigoPostal, Localidade, CodigoPostalID) VALUES ('4890-542', 'S.Clemente', 1);
INSERT INTO CodigoPostal(CodigoPostal, Localidade, CodigoPostalID) VALUES ('3456-879', 'Venda das Raparigas', 2);
INSERT INTO CodigoPostal(CodigoPostal, Localidade, CodigoPostalID) VALUES ('5423-675', 'Tomar', 3);
INSERT INTO CodigoPostal(CodigoPostal, Localidade, CodigoPostalID) VALUES ('5463-980', 'Fofocas', 4);
INSERT INTO CodigoPostal(CodigoPostal, Localidade, CodigoPostalID) VALUES ('1234-567', 'Numeros', 5);
INSERT INTO CodigoPostal(CodigoPostal, Localidade, CodigoPostalID) VALUES ('9998-098', 'Outro', 6);

INSERT INTO Morada(EstudanteID, Rua, NumeroPorta, MoradaID, CodigoPostalID) VALUES (23483, 'Dois', 3, 1, 1);
INSERT INTO Morada(EstudanteID, Rua, NumeroPorta, MoradaID, CodigoPostalID) VALUES (45638, 'Três', 4, 2, 2);
INSERT INTO Morada(EstudanteID, Rua, NumeroPorta, MoradaID, CodigoPostalID) VALUES (24563, 'Quatro', 5, 3, 3);
INSERT INTO Morada(EstudanteID, Rua, NumeroPorta, MoradaID, CodigoPostalID) VALUES (43589, 'Cinco', 6, 4, 4);
INSERT INTO Morada(EstudanteID, Rua, NumeroPorta, MoradaID, CodigoPostalID) VALUES (15634, 'Seis', 7, 5, 5);
INSERT INTO Morada(EstudanteID, Rua, NumeroPorta, MoradaID, CodigoPostalID) VALUES (65479, 'Sete', 8, 6, 1);
INSERT INTO Entregas(EntregaID, TransacaoID, DescricaoEntrega, MoradaID) VALUES (1, 1, 'Entrega por Correio', 1);
INSERT INTO Entregas(EntregaID, TransacaoID, DescricaoEntrega, MoradaID) VALUES (2, 2, 'Entrega Online', 2);
INSERT INTO Entregas(EntregaID, TransacaoID, DescricaoEntrega, MoradaID) VALUES (3, 3, 'Entrega por correio', 6);
INSERT INTO Entregas(EntregaID, TransacaoID, DescricaoEntrega, MoradaID) VALUES (4, 4, 'Entrega em mãos', 6);
INSERT INTO Disciplina(CursoID, NomeDisc, NoticiasID) VALUES (1, 'Sistema de Armazenamento de Dados', 1);
INSERT INTO Disciplina(CursoID, NomeDisc, NoticiasID) VALUES (2, 'Cálculo I', 3);
INSERT INTO Disciplina(CursoID, NomeDisc, NoticiasID) VALUES (1, 'Arte 2D', 4);
INSERT INTO Disciplina(CursoID, NomeDisc, NoticiasID) VALUES (1, 'IVC', 5);
INSERT INTO Disciplina(CursoID, NomeDisc, NoticiasID) VALUES (7, 'Gestão de Eventos', 2);
