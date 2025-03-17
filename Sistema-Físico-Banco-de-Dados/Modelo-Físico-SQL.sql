-- Tabela para armazenar as agências
CREATE TABLE Agencia (
    id_agencia INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL
);

-- Tabela para armazenar os clientes
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200)
);

-- Tabela para armazenar as contas
CREATE TABLE Conta (
    id_conta INT PRIMARY KEY AUTO_INCREMENT,
    saldo DECIMAL(15,2) NOT NULL,
    data_ultimo_acesso DATE,
    tipo_conta ENUM('poupanca', 'corrente') NOT NULL
);

-- Tabela específica para contas poupança
CREATE TABLE Conta_Poupanca (
    id_conta INT PRIMARY KEY,
    taxa_juros DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (id_conta) REFERENCES Conta(id_conta)
);

-- Tabela específica para contas correntes
CREATE TABLE Conta_Corrente (
    id_conta INT PRIMARY KEY,
    saques_registrados INT NOT NULL,
    FOREIGN KEY (id_conta) REFERENCES Conta(id_conta)
);

-- Relacionamento entre clientes e contas 
CREATE TABLE Cliente_Conta (
    id_cliente INT,
    id_conta INT,
    PRIMARY KEY (id_cliente, id_conta),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_conta) REFERENCES Conta(id_conta)
);
