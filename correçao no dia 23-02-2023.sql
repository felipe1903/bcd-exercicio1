use banco;


create table tipofundo (
codTipoFundo int not null auto_increment,
descrTipoFundo varchar (30),
primary key (codTipoFundo)
);

create table fundoinvestimento (
NumFundo int not null auto_increment,
NomEComFundo varchar (60) not null,
CodTipoFundo int not null,
DtInicio datetime not null,
ativo_S_N char (1) not null,
primary key (NumFundo),
foreign key (CodTipoFundo) references tipofundo (codTipoFundo)
);

create table consultorinvestimento (
NumConsultor int not null auto_increment,
Nom_eConsultor varchar (30) not null,
percentual_comissao numeric (10,2) not null,
primary key(NumConsultor)
);

create table cliente (
codCli int not null auto_increment,
nomeCli varchar (50) not null,
DtNascimento datetime not null,
CPF varchar (11) not null unique,
primary key (codCli)
);

create table aplicaçao (
NumAplicaçao int not null auto_increment,
codCli int not null,
NumFundo int not null,
NumConsultor int not null,
DtAplicaçao datetime,
ValorAplicaçao numeric (10,2),
primary key (NumAplicaçao),
foreign key (codCli) references cliente (codCli),
foreign key (NumFundo) references fundoinvestimento (NumFundo),
foreign key (NumConsultor) references consultorinvestimento (NumConsultor)
);

insert into tipofundo (descrTipoFundo) values 
('renda fixa'),('açoes'),('imobiliarios'),('multimercado'),('cambiais');

select *from tipofundo;


insert into fundoinvestimento (NomEComFundo,CodTipoFundo,DtInicio,ativo_S_N) values 
("brasil",5,'2033-08-09','N'),("japao",4,'2001-09-12','S'),('inglaterra',3,'2009-12-01','S'),('eua',2,'2090-04-06','S'),
("alemanha",1,'3044-01-01','N');

select *from fundoinvestimento;

insert into consultorinvestimento (Nom_eConsultor,percentual_comissao) values 
("Clotilde",10),("Jorge",10),("Gilmar",5),("Roberto",10),("Neide",10);

select *from consultorinvestimento;

insert into cliente (nomeCli,DtNascimento,CPF) values 
("Claudia","1997-05-10",13265478945),("MOnica","2000-04-07",45679345698),("Adalberto","1988-09-09",78932145696),("Cleber","1950-07-22",56432185296);

select *from cliente;

insert into aplicaçao (codCli,NumFundo,NumConsultor,DtAplicaçao,ValorAplicaçao) values 
(2,2,2,"2022-12-05",480),(3,3,3,"2005-06-09",900),(1,1,1,"2009-09-09",1500);

select *from aplicaçao


join cliente c on c.codCli = aplicaçao.codCli
join consultorinvestimento ci on ci.NumConsultor = aplicaçao.NumConsultor
join fundoinvestimento f on f.NumFundo = aplicaçao.NumFundo
join tipofundo t on t.codTipoFundo = f.codTipoFundo;



