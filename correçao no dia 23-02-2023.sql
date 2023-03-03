/*projeto atualizado - 21:41*/



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



----------------------------------------------------------------------


create database sample;

use sample;

create table productlines (
productLine int not null auto_increment,
textDrescription varchar (1000) not null,
htmlDescription varchar (1000) not null,
image text (1000) not null,
primary key (productLine)
);

create table products (
productCode int not null auto_increment,
productName varchar (50) not null,
productLineFK int not null,
productScale int not null,
productVendor varchar (100) not null,
productDescription varchar (300),
quantilyInStock int not null,
buyPrice int not null,
MSRP int not null,
primary key (productCode),
foreign key  (productLineFK) references productlines (productLine)
);

create table offices (
officeCode int not null auto_increment,
city varchar (20) not null,
phone varchar (11),
addressLine1 varchar (100) not null, 
adressLine2 varchar (100) not null,
state varchar (50) not null,
country varchar (30) not null, 
postalCode varchar (8),
territory varchar (50),
primary key (officeCode)
);

create table employees (
employeeNumber int not null auto_increment,
lastname varchar (20) not null,
firstname varchar (20) not null, 
extension varchar (50) not null,
email varchar (50) not null,
officeCodeFK int not null,
reportsTo varchar (500) not null, 
jobTitle varchar (20) not null,
primary key (employeeNumber),
foreign key (officeCodeFK) references offices (officeCode)
);

create table payments (
customerNumber int not null auto_increment,
checkNumber int not null,
paymentDate date not null, 
amount int not null,
primary key (customerNumber)
);

create table customers ( 
customerNumberFK int not null,
customerName varchar (50) not null,
contatcLastName varchar (15) not null,
contactFirstName varchar (15) not null,
phone varchar (11) not null,
addressLine1 varchar (100) not null, 
adressLine2 varchar (100) not null,
city varchar (20) not null,
state varchar (50) not null,
postalCode varchar (8),
country varchar (30) not null,
salesRepEmployeeNumberFK int not null,
creditLimit int not null, 
primary key (customerNumberFK),
foreign key (customerNumberFK) references payments (customerNumber),
foreign key (salesRepEmployeeNumberFK) references employees (employeeNumber)
);

create table orders (
orderNumber int not null auto_increment,
orderDate date not null, 
requiredDate date not null,
shippedDate date not null, 
status_A_R varchar (1) not null,
comments varchar (200), 
customerNumberFK int not null,
primary key (orderNumber),
foreign key (customerNumberFK) references customers (customerNumberFK)
);

create table orderdetails (
orderNumberFK int not null,
productCodeFK int not null,
quantityOrdered int not null,
priceEach int not null,
orderLineNumber int not null,
primary key (orderNumberFK),
foreign key (orderNumberFK) references orders (orderNumber),
foreign key (productCodeFK) references products (productCode)
);



insert into  productlines (textDrescription,htmlDescription,image) values
("olha se vc nao me ama, entao nao me ligue, nao fique fazendo queixa","acesse.one/AFYGw","l1nk.dev/6KVvX"),
("caneta azul azul caneta, caneta azul ta marcada com minha letra", "l1nk.dev/TnbFa","l1nk.dev/HsVD2"),
("voce é a luz, raio estrela e luar, manha de sol, meu iaia meu ioio", "acesse.one/IsyHG", "l1nk.dev/gMDSp"),
("andei so, pela noite, cantei um reagge pros cachorros da rua, andei so pela noite", "acesse.one/AIIBD","l1nk.dev/HDmTL"),
("vou ficar com certeza maluco beleza, eu vou ficar com certeza maluco beleza","acesse.one/T7Oma","l1nk.dev/h6RPE");

select *from productlines;

insert into products (productName,productLineFK,productScale,productVendor,productDescription,quantilyInStock,buyPrice,MSRP) values 
("iphone 14",1,1,"amazon","celular muito bom",1500,8000,7500),
("caneta bic",2,1,"amazon","caneta esferografica",50000,2,1),
("mouse redragon",3,1,"amazon","mouse gamer bom para jogos de fps",1000,130,100),
("air pods pro 2",4,1,"amazon","fones sem fio muito uteis",3000,2000,1500),
("radio",5,1,"amazon", "radio para escutar sua emissora preferida",500,250,150);

select *from products;

insert into offices (city,phone,addressLine1,adressLine2,state,country,postalCode,territory) values
("campinas", 19905337698,"rua joaquim de ferraz","rua jorge almeida","sao paulo","brasil",76473764,"sul america"),
("valinhos",19973845613,"rua jardim dos figos","rua colheita da goiaba","sao paulo","brasil",76439710,"sul america"),
("juiz de fora",32997653907,"rua garibaldo silva","rua pao de queijo feliz", "minas gerais","brasil",61309874,"sul america"),
("rio branco",82974650912,"rua dinossauro branco","rua jararaca verde","acre","brasil",85094328,"sul america"),
("indaiatuba",19908716234,"rua julio freitas","rua adalberto costa", "sao paulo","brasil",76802846,"sul america");

select *from offices;

insert into employees (lastname,firstname,extension,email,officeCodeFK,reportsTo,jobTitle) values 
("silva","adalberto","pppppp","adalberto@email.com",5,"rh","vendedor"),
("santos","roberto","rrrrrr","roberto@email.com",4,"rh","vendedor"),
("oliveira","roger","ssssss","roger@email.com",3,"rh","vendedor"),
("cardoso","cleber","jjjjjj","cleber@email.com",2,"rh","vendedor"),
("costa","clotilde","cccccc","clotilde@email.com",1,"rh","vendedor");

select *from employees;

insert into payments (checkNumber,paymentDate,amount) values 
(100,"2022-09-05",2000),
(50,"2021-10-22",250),
(80,"2022-11-01",8000),
(300,"2021-06-10",130),
(200,"2023-01-05",2);

select *from payments;

insert into customers (customerNumberFK,customerName,contatcLastName,contactFirstName,phone,
addressLine1,adressLine2,city,state,postalCode,country,salesRepEmployeeNumberFK,creditLimit) values 
(5,"cleusa","almeida","claudia",19890921931,"rua alecrim dourado","rua das flores","campinas","sao paulo",67732163,"Brasil",1,10000),
(4,"mauricio","souza","ronaldo",18901273461,"rua amadeu mendes","rua josefina das dores","valinhos","sao paulo",87436472,"brasil",2,15000),
(3,"jose","costa","gilmar",90284756251,"rua amoreiras","rua campos sales","vinhedo","sao paulo",37651239,"brasil",3,9000),
(2,"glauber","carvalho","felipe",18983475612,"rua asaleias","rua tulipas vermelhas","valinhos","sao paulo",89829012,"brasil",4,30000),
(1,"rivaldo","ferreira","gilberto",19023745628,"rua uvas verdes","rua jardim das flores","louveira","sao paulo",74824376,"brasil",5,5000);

select *from customers;

insert into orders (orderDate,requiredDate,shippedDate,status_A_R,comments,customerNumberFK) values 
("2021-10-09","2022-01-10","2021-10-15","A","enviado com sucesso",5),
("2022-07-15","2022-08-14","2022-07-18","R","nao conseguimos enviar",4),
("2022-02-22","2022-03-30","2022-02-25","A","enviado com sucesso",3),
("2021-06-02","2021-09-02","2021-06-06","A","enviado com sucesso",2),
("2022-12-01","2023-01-10","2022-12-10","A","enviado com sucesso",1);

select *from orders;

insert into orderdetails (orderNumberFK,productCodeFK,quantityOrdered,priceEach,orderLineNumber) values 
(1,5,500,250,982981),
(2,4,1000,2000,732372),
(3,3,150,130,477273),
(4,2,10000,2,278337),
(5,1,5000,8000,478478);

select *from orderdetails

join orderdetails o on o.productCodeFK = products.productCode
join orderdetails od on od.orderNumberFK = orders.orderNumber
join orders o on o.customerNumberFK = customers.customerNumberFK
join customers c on c.salesRepEmployeeNumberFK = employees.employeeNumber
join customers c on c.customerNumberFK = payments.customerNumber
join employees e on e.officeCodeFK = offices.officeCode
join products p on p.productLineFK = productlines.productLine;
















