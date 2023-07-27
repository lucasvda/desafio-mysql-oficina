use oficina;

-- inserindo valores na tabela clientesPF
insert into clientes (pNome, nomeMeio, sobrenome, endereco, dataNascimento) 
			  values ('Lucas', 'V', 'Araujo', 'rua 1, 1 - bairro 1 - São Paulo/SP', '1990-04-15'),
					 ('Diego', 'D', 'Venancio', 'rua 2, 2 - bairro 2 - São Paulo/SP', '1992-06-19'),
                     ('Maria', 'O', 'Castro', 'rua 3, 3 - bairro 3 - São Paulo/SP', '1964-12-05'),
                     ('Luiz', 'V', 'Araujo', 'rua 4, 4 - bairro 4 - São Paulo/SP', '1968-05-07'),
                     ('Alice', 'S', 'Araujo', 'rua 5, 5 - bairro 5 - São Paulo/SP', '2016-09-10'),
                     ('Mayara', 'N', 'Silva', 'rua 6, 6 - bairro 6 - São Paulo/SP', '1988-09-09');

-- consultando os valores inseridos na tabela clientes                    
-- select * from clientes;

-- inserindo valores na tabela veiculos
insert into veiculos (tipo, marca, modelo, anoFabricacao, cor) 
			  values (default, 'Honda', 'Fit', '2015', 'Prata'),
					 (default, 'Honda', 'Civic', '2017', 'Preto'),
                     ('Moto', 'Yamaha', 'Crosser', '2012', 'Branco'),
                     ('Moto', 'Yamaha', 'Lander', '2019', 'Azul'),
                     (default, 'Ferrari', 'F430', '2013', 'Vermelho'),
                     (default, 'Lamborghini', 'Murcielago', '2011', 'Marrom');

-- consultando os valores inseridos na tabela veiculos                    
-- select * from veiculos;

-- inserindo valores na tabela pagamentos
insert into pagamentos (tipoPagamento) 
			  values ('Cartão'),
					 ('PIX'),
					 ('Dois Cartões'),
                     ('Boleto'),
					 ('Cartão'),
                     ('PIX'),
					 ('Cartão'),
                     ('Dois Cartões'),
					 ('Boleto'),
                     ('PIX'),
					 ('Boleto'),
                     ('Dois Cartões'),
					 ('PIX');

-- consultando os valores inseridos na tabela pagamentos                    
-- select * from pagamentos;
                     
-- inserindo valores na tabela servicos
insert into servicos (nomeServico, prazo, descricao, valor)
			  values ('Troca de pneus', '1 dia', 'Troca de pneus, calibragem e balanceamento', 400),
					 ('Troca de amortecedores', '2 dias', 'Troca dos amortecedores e calibragem', 800),
                     ('Troca de lanternas', '1 dia', 'Troca das lanternas', 100);
                     
-- consultando os valores inseridos na tabela servicos                
-- select * from servicos;

-- inserindo valores na tabela veiculosClientes
insert into veiculosClientes (idveiculosClientesVeiculo, idveiculosClientesCliente, descricaoEstado, km)
			  values (1, 6, 'Quebrou o amortercedor', 25000),
					 (2, 6, 'Trocar pneus', 25000),
                     (3, 6, 'Quebrou o amortercedor', 25000),
                     (4, 5, 'Trocar pneus', 25000),
                     (5, 5, 'Quebrou o amortercedor', 30000),
                     (6, 5, 'Trocar pneus', 30000),
                     (1, 4, 'Quebrou o amortercedor', 30000),
                     (6, 4, 'Trocar pneus', 30000),
                     (3, 2, 'Trocar lanternas', 40000),
                     (5, 1, 'Quebrou o amortercedor', 40000),
                     (4, 2, 'Trocar lanternas', 40000),
                     (6, 1, 'Quebrou o amortercedor', 40000),
                     (3, 4, 'Trocar lanternas', 45000),
                     (5, 2, 'Quebrou o amortercedor', 45000),
                     (6, 3, 'Trocar lanternas', 45000);
                     
-- consultando os valores inseridos na tabela veiculosClientes                
-- select * from veiculosClientes;

-- inserindo valores na tabela orcamentos
insert into orcamentos (idOrcamentosPagamento, idOrcamentoCliente, descricao, valor)
			 values (1,2, 'Descontar a mão de obra', 1000),
					(1,2, 'Acrescentar os valores das peças', 1000),
                    (1,3, 'Descontar os valores das peças', 1000),
                    (1,3, 'Acrescentar a mão de obra', 1000),
                    (2,3, 'Descontar a mão de obra', 2000),
                    (2,4, 'Acrescentar os valores das peças', 2000),
                    (2,4, 'Descontar os valores das peças', 2000),
                    (2,5, 'Acrescentar a mão de obra', 2000),
                    (3,6, 'Descontar a mão de obra', 3000),
                    (3,3, 'Descontar os valores das peças', 3000),
                    (3,1, 'Acrescentar a mão de obra', 3000),
                    (4,2, 'Acrescentar os valores das peças', 3000),
                    (4,5, 'Descontar a mão de obra', 3000),
                    (5,4, 'Descontar os valores das peças', 4000),
                    (6,6, 'Acrescentar a mão de obra', 4000);
                    
-- consultando os valores inseridos na tabela orcamentos                
-- select * from orcamentos;

-- inserindo valores na tabela pecas
insert into pecas (nomePeca, tipoPeca, valor)
			values ('Pneu', 'Mecânica', 200),
				   ('Amortecedor', 'Mecânica', 300),
                   ('Lanterna', 'Elétrica', 50);
                   
-- consultando os valores inseridos na tabela pecas              
-- select * from pecas;

-- consultando os valores inseridos na tabela pecasServicos
insert into pecasServicos (idPecasServicosPeca, idPecasServicosServico, quantidade)
			values (1, 1, default), 
				   (2, 2, default), 
                   (3, 3, default);

-- consultando os valores inseridos na tabela pecasServicos               
-- select * from pecasServicos;

-- consultando os valores inseridos na tabela orcamentosServicos
insert into orcamentosServicos (idOrcamentosServicosServicos, idOrcamentosServicosOrcamentos, statusPedido)
			values (1, 1, default), 
				   (2, 2, default), 
                   (3, 3, default),
                   (1, 4, default), 
				   (2, 5, default), 
                   (3, 6, default),
                   (1, 7, default), 
				   (2, 8, default), 
                   (3, 9, default),
                   (1, 10, default), 
				   (2, 11, default), 
                   (3, 12, default),
                   (1, 13, default), 
				   (2, 14, default), 
                   (3, 15, default);

-- consultando os valores inseridos na tabela orcamentosServicos               
-- select * from orcamentosServicos;



