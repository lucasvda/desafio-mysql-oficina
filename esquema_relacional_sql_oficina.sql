-- criação do banco de dados para un E-commerce
drop database oficina;
create database oficina;
use oficina;

-- criar tabela clientes
create table clientes(
	idCliente int not null auto_increment,       
    dataNascimento date not null,
    pNome varchar(10) not null,
    nomeMeio char(3),
    sobrenome varchar(20),
    endereco varchar(45),
    primary key (idCliente)
);
alter table clientes auto_increment=1;

-- criar tabela Veiculos
create table veiculos(
	idVeiculo int not null auto_increment,
    tipo enum('Carro', 'Moto') default 'Carro',
    marca varchar(20) not null,
    modelo varchar(15) not null,
    anoFabricacao char(4),
    cor varchar(10) not null,
    primary key (idVeiculo)
);
alter table veiculos auto_increment=1;

-- criar tabela veiculos / clientes
create table veiculosClientes(
	idveiculosClientesVeiculo int not null,
    idveiculosClientesCliente int not null,
    descricaoEstado varchar(255) not null,
    km int not null,
    primary key (idveiculosClientesVeiculo, idveiculosClientesCliente),
    constraint fk_veiculosClientes_veiculos foreign key (idveiculosClientesVeiculo) references veiculos(idVeiculo),
    constraint fk_veiculosClientes_clientes foreign key (idveiculosClientesCliente) references clientes(idCliente)
);

-- criar tabela pagamentos
create table pagamentos(
	idPagamento int auto_increment not null,	
    tipoPagamento enum('PIX', 'Boleto', 'Cartão', 'Dois Cartões') default 'Cartão',    
    primary key (idPagamento)    
);
alter table pagamentos auto_increment=1;

-- criar tabela orcamentos
create table orcamentos(
	idOrcamento int auto_increment,
    idOrcamentosPagamento int not null,
    idOrcamentoCliente int not null,
    descricao varchar(255),
    valor float,
    primary key (idOrcamento, idOrcamentosPagamento, idOrcamentoCliente),
    constraint fk_orcamento_pagamento foreign key (idOrcamentosPagamento) references pagamentos(idPagamento),
    constraint fk_orcamento_cliente foreign key (idOrcamentoCliente) references clientes(idCliente)
);
alter table orcamentos auto_increment=1;

-- criar tabela servicos
create table servicos(
	idServico int auto_increment,
    nomeServico varchar(45) not null,
    prazo varchar(10) not null,
    descricao varchar(255) not null,
    valor float not null,
    primary key (idServico)
);
alter table servicos auto_increment=1;

-- criar tabela pecas
create table pecas(
	idPeca int auto_increment,
    nomePeca varchar(20) not null,
    tipoPeca varchar(15) not null,
    valor float not null,
    primary key (idPeca)
);
alter table pecas auto_increment=1;

-- criar tabela pecas / servicos
create table pecasServicos(
	idPecasServicosPeca int,
    idPecasServicosServico int,
    quantidade int default 1,
    primary key (idPecasServicosPeca, idPecasServicosServico),
    constraint fk_pecasServicos_pecas foreign key (idPecasServicosPeca) references pecas(idPeca),
    constraint fk_pecasServicos_servicos foreign key (idPecasServicosServico) references servicos(idServico)
);

-- criar tabela orcamentos / servicos
create table orcamentosServicos(
	idOrcamentosServicosServicos int,
    idOrcamentosServicosOrcamentos int,
    statusPedido enum('Aguardando peças', 'Serviço finalizado', 'Em andamento') default 'Em andamento',
    primary key (idOrcamentosServicosServicos, idOrcamentosServicosOrcamentos),
    constraint fk_orcamentosServicos_servicos foreign key (idOrcamentosServicosServicos) references servicos(idServico),
    constraint fk_orcamentosServicos_orcamentos foreign key (idOrcamentosServicosOrcamentos) references orcamentos(idOrcamento)
);