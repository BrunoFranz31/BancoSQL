-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Jun-2022 às 06:58
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `super`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `consumidor`
--

CREATE TABLE `consumidor` (
  `idConsumidor` int(11) NOT NULL,
  `tipoConsumidor` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `idFuncionario` int(11) NOT NULL,
  `nomeFuncionario` varchar(100) NOT NULL,
  `setorFuncionario` varchar(100) NOT NULL,
  `CPFfuncionario` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`idFuncionario`, `nomeFuncionario`, `setorFuncionario`, `CPFfuncionario`) VALUES
(1, 'João Paulo', 'Atendente de padaria', '61690935'),
(2, 'Adamastor Júnior', 'Repositor', '45061690935'),
(3, 'Clóvis Nogueira', 'Atendente de padaria', '235656565'),
(4, 'Amanda Carvalho', 'Atendente de caixa', '33256987525');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itensvendidos`
--

CREATE TABLE `itensvendidos` (
  `idVendas` int(11) NOT NULL,
  `idProdutos` int(11) NOT NULL,
  `quantidadeVendida` int(11) NOT NULL,
  `valorProduto` double NOT NULL,
  `valorTotalProduto` double NOT NULL,
  `STATUS` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `idProdutos` int(11) NOT NULL,
  `nomeProduto` varchar(200) NOT NULL,
  `valorProduto` double(9,2) NOT NULL,
  `quantidadeProduto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`idProdutos`, `nomeProduto`, `valorProduto`, `quantidadeProduto`) VALUES
(1, 'Batata-branca', 2.10, 100),
(2, 'Batata-branca', 2.10, 100),
(3, 'Óleo de soja', 3.19, 300),
(4, 'Feijão', 3.89, 250),
(5, 'Açúcar', 2.59, 100),
(6, 'Tomate', 4.10, 58),
(7, 'Cotonete', 2.70, 100);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `idVendas` int(11) NOT NULL,
  `idConsumidor` int(11) NOT NULL,
  `valorTotalVendas` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `consumidor`
--
ALTER TABLE `consumidor`
  ADD PRIMARY KEY (`idConsumidor`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`idFuncionario`);

--
-- Índices para tabela `itensvendidos`
--
ALTER TABLE `itensvendidos`
  ADD PRIMARY KEY (`idVendas`,`idProdutos`),
  ADD KEY `idProdutos` (`idProdutos`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idProdutos`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`idVendas`),
  ADD KEY `Vendas` (`idConsumidor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `consumidor`
--
ALTER TABLE `consumidor`
  MODIFY `idConsumidor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `idFuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `idProdutos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `idVendas` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `itensvendidos`
--
ALTER TABLE `itensvendidos`
  ADD CONSTRAINT `itensvendidos_ibfk_1` FOREIGN KEY (`idVendas`) REFERENCES `vendas` (`idVendas`),
  ADD CONSTRAINT `itensvendidos_ibfk_2` FOREIGN KEY (`idProdutos`) REFERENCES `produtos` (`idProdutos`);

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `Vendas` FOREIGN KEY (`idConsumidor`) REFERENCES `consumidor` (`idConsumidor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
