-- Quantos veiculos cada cliente tem?
select concat(c.pNome, ' ', c.nomeMeio, '. ', c.sobrenome) as Nome_Completo, count(*) as Qtd_Veiculos
from clientes c
join veiculosClientes vc on c.idCliente = vc.idveiculosClientesCliente
join veiculos v on v.idVeiculo = vc.idveiculosClientesVeiculo
group by c.idCliente;

-- Quais os clientes que possuem 3 ou mais veículos?
select concat(c.pNome, ' ', c.nomeMeio, '. ', c.sobrenome) as Nome_Completo, count(*) as Qtd_Veiculos
from clientes c
join veiculosClientes vc on c.idCliente = vc.idveiculosClientesCliente
join veiculos v on v.idVeiculo = vc.idveiculosClientesVeiculo
group by c.idCliente having Qtd_Veiculos >= 3;

-- Qual a quatidade por peça utilizadas em todas os orçamentos?
select nomePeca as Nome_Peça, count(*) as Quantidade
from pecas p
join pecasServicos ps on p.idPeca = ps.idPecasServicosPeca
join servicos s on s.idServico = ps.idPecasServicosServico
join orcamentosServicos os on s.idServico = os.idOrcamentosServicosServicos
join orcamentos o on o.idOrcamento = os.idOrcamentosServicosOrcamentos
group by p.idPeca;

-- Quantos orcamentos foram feitos por cada cliente?
select concat(c.pNome, ' ', c.nomeMeio, '. ', c.sobrenome) as Nome_Completo, count(*) as Qtd_Orçamentos
from clientes c
join orcamentos o on c.idCliente = o.idOrcamentoCliente
group by c.idCliente order by Qtd_Orçamentos;

-- Qual a marca que utilizou mais peças? 
select marca as Marca, count(*) as Quantidade
from veiculos v
join veiculosClientes vc on v.idVeiculo = vc.idveiculosClientesVeiculo
join clientes c on c.idCliente = vc.idveiculosClientesCliente
join orcamentos o on o.idOrcamentoCliente = c.idCliente
join orcamentosServicos os on o.idOrcamento = os.idOrcamentosServicosOrcamentos
join servicos s on s.idServico = os.idOrcamentosServicosServicos
join pecasServicos ps on s.idServico = ps.idPecasServicosServico
join pecas p on p.idPeca = ps.idPecasServicosPeca
group by Marca order by Quantidade;