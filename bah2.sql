create database locadora;
use locadora;
create table cliente(
id_cliente int not null auto_increment,
nome_cli varchar(100),
sexo char(1),
data_nasc date,
rg varchar(20),
cpf varchar(20),
primary key(id_cliente)
);

create table endereco(
id_endereco int not null auto_increment,
cod_cliente int,
rua varchar(100),
num_casa varchar(20),
bairro varchar(100),
cidade varchar(100),
estado varchar(100),
cep varchar(50),
primary key(id_endereco)
);

ALTER TABLE endereco
ADD FOREIGN KEY (cod_cliente) REFERENCES cliente(id_cliente); 

desc endereco;

drop table endereco;

create table telefone(
id_tel int not null auto_increment,
cod_cliente int,
numero_tel varchar(50),
primary key(id_tel)
);

drop table telefone;

create table veiculo(
id_veiculo int not null auto_increment,
nome_car varchar(100),
modelo varchar(100),
fabricante varchar(50),
data_fab date,
cor varchar(50),
placa varchar(15),
primary key(id_veiculo)
);

desc veiculo;
insert into veiculo (nome_car, modelo, fabricante, data_fab, cor, placa) values ("supra","1.6","toyota","1970/07/22","vinho","Pgua0202");
insert into veiculo (nome_car, modelo, fabricante, data_fab, cor, placa) values ("supra","1.6","toyota","1970/07/22","branco","Pgua0207");

select * from veiculo;

create table atendente(
id_atende int not null auto_increment,
nome varchar(100),
primary key(id_atende)
);
desc atendente;
insert into atendente (nome) values ("José Admário");
insert into atendente (nome) values ("anjelina joules");

select * from atendente;


create table contrato(
id_contrato int not null auto_increment,
nome_contrato varchar(100),
cod_cliente int,
cod_aten int,
cod_carro int,
preco float,
data_aluguel date,
primary key(id_contrato)
);
desc contrato;
ALTER TABLE contrato
ADD FOREIGN KEY (cod_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE contrato
ADD FOREIGN KEY (cod_aten) REFERENCES atendente(id_atende);

ALTER TABLE contrato
ADD FOREIGN KEY (cod_carro) REFERENCES veiculo(id_veiculo);  


insert into contrato(nome_contrato, cod_cliente,cod_aten,cod_carro, preco, data_aluguel) values ("locaçao de veiculos",1,1,1,"500.00","2025/05/02");
insert into contrato(nome_contrato, cod_cliente,cod_aten,cod_carro, preco, data_aluguel) values ("locaçao de veiculos","2","1","2","400.00","2027/02/08");

select * from contrato;


create table manutencao(
id_manutencao int not null auto_increment,
servico varchar(100),
cod_carro int,
valor_reparo float,
primary key(id_manutencao)
);

desc cliente;
desc endereco;
desc telefone;
desc veiculo;
desc contrato; 
desc atendente;

insert into cliente (nome_cli, sexo, data_nasc, rg, cpf) values
("Macário josé","M", "2000/12/30", "12345678-9", "123.456.789-89");

insert into cliente(nome_cli, sexo, data_nasc, rg, cpf) values
("Angelina Fernades","F","2005/06/10","98765432-1","456789123-12");

select * from cliente;



insert into endereco(cod_cliente, rua, num_casa, bairro, cidade, estado, cep)values
("1", "Rua das Rosas","50","Jardim América","Paranaguá","Paraná","83209-210");

insert into endereco(cod_cliente, rua, num_casa, bairro, cidade, estado, cep)values
("2", "Rua Alípio dos Santos","1001","Bockman","Paranaguá","Paraná","83209-201");

select * from endereco;

ALTER TABLE telefone
ADD FOREIGN KEY (cod_cliente) REFERENCES cliente(id_cliente); 

insert into telefone (cod_cliente, numero_tel) values ("1","41-98431-5530");
insert into telefone (cod_cliente, numero_tel) values ("1","41-98543-5520");
insert into telefone (cod_cliente, numero_tel) values ("2","41-98845-5520");


select * from telefone;
select * from cliente;