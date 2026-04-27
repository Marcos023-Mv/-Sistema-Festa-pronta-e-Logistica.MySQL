CREATE TABLE `clientes` (
  `id` uuid PRIMARY KEY,
  `nome` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `email` varchar(255)
);

CREATE TABLE `itens` (
  `id` uuid PRIMARY KEY,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `qtd_total` int NOT NULL
);

CREATE TABLE `combos` (
  `id` uuid PRIMARY KEY,
  `nome` varchar(255),
  `descricao` varchar(255)
);

CREATE TABLE `combo_itens` (
  `id` uuid PRIMARY KEY,
  `nome` varchar(255) NOT NULL,
  `combo_id` uuid NOT NULL,
  `item_id` uuid NOT NULL,
  `quantidade` int NOT NULL
);

CREATE TABLE `estoque_mov` (
  `id` uuid PRIMARY KEY,
  `item_id` uuid NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `quantidade` int NOT NULL,
  `data` datetime UNIQUE NOT NULL
);

CREATE TABLE `contratos` (
  `id` uuid PRIMARY KEY,
  `cliente_id` uuid NOT NULL,
  `itens_id` uuid NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime NOT NULL,
  `qtd_total` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
);

CREATE TABLE `caminhoes` (
  `id` uuid PRIMARY KEY,
  `modelo` varchar(255) UNIQUE NOT NULL,
  `capacidade_peso` int NOT NULL
);

CREATE TABLE `motorista` (
  `id` uuid PRIMARY KEY,
  `nome` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL
);

CREATE TABLE `entregas` (
  `id` uuid PRIMARY KEY,
  `contrato_id` uuid NOT NULL,
  `caminhao_id` uuid NOT NULL,
  `motorista_id` uuid NOT NULL,
  `data_saida` datetime NOT NULL,
  `data_retorno` datetime NOT NULL
);

CREATE TABLE `manutencao` (
  `id` uuid PRIMARY KEY,
  `item_id` uuid NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime NOT NULL,
  `custo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL
);

CREATE TABLE `pagamento` (
  `id` uuid PRIMARY KEY,
  `contrato_id` varchar(255) NOT NULL,
  `valor_total` varcahr NOT NULL,
  `status` varchar(255) NOT NULL
);

CREATE TABLE `parcelas` (
  `id` uuid PRIMARY KEY,
  `pagamento_id` varchar(255) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `data_vencimento` date NOT NULL,
  `data_pagamento` date NOT NULL,
  `status` varchar(255) NOT NULL
);

ALTER TABLE `combo_itens` ADD FOREIGN KEY (`combo_id`) REFERENCES `combos` (`id`);

ALTER TABLE `combo_itens` ADD FOREIGN KEY (`item_id`) REFERENCES `itens` (`id`);

ALTER TABLE `estoque_mov` ADD FOREIGN KEY (`item_id`) REFERENCES `itens` (`id`);

ALTER TABLE `contratos` ADD FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

ALTER TABLE `contratos` ADD FOREIGN KEY (`itens_id`) REFERENCES `combo_itens` (`id`);

ALTER TABLE `entregas` ADD FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`);

ALTER TABLE `entregas` ADD FOREIGN KEY (`caminhao_id`) REFERENCES `caminhoes` (`id`);

ALTER TABLE `entregas` ADD FOREIGN KEY (`motorista_id`) REFERENCES `motorista` (`id`);

ALTER TABLE `manutencao` ADD FOREIGN KEY (`item_id`) REFERENCES `itens` (`id`);

ALTER TABLE `pagamento` ADD FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`);

ALTER TABLE `parcelas` ADD FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`id`);
