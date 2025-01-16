CREATE DATABASE NEXTPLAY
GO

USE NEXTPLAY 
GO

CREATE TABLE CLIENTES(
	ID_CLIENTE INT PRIMARY KEY,
	NOME_CLIENTE VARCHAR(50),
	EMAIL VARCHAR(100),
	UF CHAR(2),
	PRIMEIRA_COMPRA DATE,
	QTD_COMPRAS INT
);
GO

CREATE TABLE ESTOQUE_PRODUTOS(
	ID_PRODUTO INT PRIMARY KEY,
	NOME_PRODUTO VARCHAR(50),
	CATEGORIA VARCHAR(50),
	QTD_ESTOQUE INT,
	PRECO_CUSTO MONEY,
	PRECO_VENDA MONEY,
	ATUALIZADO_EM DATE
)
GO

CREATE TABLE CAMPANHAS(
	ID_PROMOCAO INT PRIMARY KEY,
	NOME_PROMOCAO VARCHAR(100),
	DESCRICAO VARCHAR(300),
	DATA_INICIO DATE,
	DATA_FIM DATE,
	DESCONTO INT,
	CATEGORIAS VARCHAR(50)
)
GO



CREATE TABLE VENDAS_ONLINE(
	ID_VENDA INT PRIMARY KEY,
	ID_PRODUTO INT FOREIGN KEY REFERENCES ESTOQUE_PRODUTOS(ID_PRODUTO),
	ID_CLIENTE INT FOREIGN KEY REFERENCES CLIENTES(ID_CLIENTE),
	CATEGORIA VARCHAR(50),
	QTD_VENDIDA INT,
	PRECO_UNITARIO MONEY,
	VALOR_TOTAL MONEY,
	DATA_VENDA DATE,
	FORMA_PAGAMENTO VARCHAR(50),
	ORIGEM_VENDA VARCHAR(100)
)
GO

-- aonde vai ficar os registros de vendas realizas em períodos de campanhas
CREATE TABLE LOG_VENDAS_ONLINE(
	ID_VENDA INT PRIMARY KEY,
	ID_PRODUTO INT FOREIGN KEY REFERENCES ESTOQUE_PRODUTOS(ID_PRODUTO),
	ID_CLIENTE INT FOREIGN KEY REFERENCES CLIENTES(ID_CLIENTE),
	CATEGORIA VARCHAR(50),
	QTD_VENDIDA INT,
	PRECO_UNITARIO MONEY,
	VALOR_TOTAL MONEY,
	DATA_VENDA DATE,
	FORMA_PAGAMENTO VARCHAR(50),
	ORIGEM_VENDA VARCHAR(100)
)
GO


CREATE TABLE VENDAS_FISICA(
	ID_VENDA INT PRIMARY KEY,
	ID_PRODUTO INT FOREIGN KEY REFERENCES ESTOQUE_PRODUTOS(ID_PRODUTO),
	CATEGORIA VARCHAR(50),
	QTD_VENDIDA INT,
	PRECO_UNITARIO MONEY,
	VALOR_TOTAL MONEY,
	DATA_VENDA DATE,
	FORMA_PAGAMENTO VARCHAR(50)
)
GO
