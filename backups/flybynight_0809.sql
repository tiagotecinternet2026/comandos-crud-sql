-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 08/09/2026 às 14:51
-- Versão do servidor: 8.0.46
-- Versão do PHP: 8.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `flybynight`
--
CREATE DATABASE IF NOT EXISTS `flybynight` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `flybynight`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id`, `nome`) VALUES
(1, 'Eletrônicos Tabajara'),
(2, 'Mundo dos Games'),
(3, 'Supermercado Tem de Tudo'),
(4, 'Livraria Demais da Conta'),
(6, 'Epson'),
(8, 'samsung');

-- --------------------------------------------------------

--
-- Estrutura para tabela `lojas`
--

CREATE TABLE `lojas` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `lojas`
--

INSERT INTO `lojas` (`id`, `nome`) VALUES
(1, 'Casas Bahia'),
(2, 'Shopping Zona Leste'),
(3, 'Bazar das Coisas'),
(4, 'Americanas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `lojas_produtos`
--

CREATE TABLE `lojas_produtos` (
  `loja_id` int NOT NULL,
  `produto_id` int NOT NULL,
  `estoque` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `lojas_produtos`
--

INSERT INTO `lojas_produtos` (`loja_id`, `produto_id`, `estoque`) VALUES
(1, 1, 5),
(2, 1, 4),
(2, 3, 10),
(4, 1, 2),
(4, 2, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text,
  `preco` decimal(10,2) NOT NULL,
  `quantidade` int NOT NULL,
  `fornecedor_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `preco`, `quantidade`, `fornecedor_id`) VALUES
(1, 'Smartphone Galaxy S23', 'Equipamento com sistema Android e câmera Full HD e etc e tal', 1599.45, 20, 1),
(2, 'Senhor dos Anéis: As Duas Torres', 'Volume 2 da série de livros criados pelo autor J.R.R. Tolkien', 80.99, 100, 4),
(3, 'TV Led', 'Tela de 50 polegadas, resolução 4K, 4 entradas HDMI e etc e tal', 2999.00, 5, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `lojas`
--
ALTER TABLE `lojas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `lojas_produtos`
--
ALTER TABLE `lojas_produtos`
  ADD PRIMARY KEY (`loja_id`,`produto_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fornecedor_id` (`fornecedor_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `lojas`
--
ALTER TABLE `lojas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `lojas_produtos`
--
ALTER TABLE `lojas_produtos`
  ADD CONSTRAINT `lojas_produtos_ibfk_1` FOREIGN KEY (`loja_id`) REFERENCES `lojas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lojas_produtos_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE RESTRICT;

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
