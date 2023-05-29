-- Esse comando apaga o banco de dados (caso exista)

DROP DATABASE IF EXISTS uvv;

--Esse comando apaga o schema

DROP SCHEMA IF EXISTS  lojas;


-- Esse comando apaga o usuario (caso exista)

DROP USER IF EXISTS laura;




-- Esse comando cria usuário com senha

CREATE USER laura WITH LOGIN PASSWORD 'computacao@raiz';



-- Esse comando cria o banco de dados

CREATE DATABASE uvv
OWNER laura
TEMPLATE template0
ENCODING 'UTF8'
LC_COLLATE 'pt_BR.UTF-8'
LC_CTYPE 'pt_BR.UTF-8'
ALLOW_CONNECTIONS true;

	  
--Esse comando troca a conexão do usuário Postgres para o banco de dados uvv

\c 'dbname=uvv user=laura password=computacao@raiz';	  
	  
--Agora conectando ao banco de dados uvv, com o usuário laura
	 


-- Esse comando cria o schema

CREATE SCHEMA AUTHORIZATION laura;

--Esse comando define o search path

ALTER USER laura SET SEARCH_PATH TO lojas, "$user", public;


---Esse comando define o search path

SET SEARCH_PATH TO lojas, "$user" , public; 


--Esse comando cria a tabela produtos;
CREATE TABLE  produtos (
                produto_id                 NUMERIC(38)  NOT NULL,
                nome                       VARCHAR(255) NOT NULL,
                preco_unitario             NUMERIC(10,2),
                detalhes BYTEA,
                imagem BYTEA,
                imagem_mime_type           VARCHAR(512),
                imagem_arquivo             VARCHAR(512),
                imagem_charset             VARCHAR(512),
                imagem_ultima_atualizacao  DATE,
                CONSTRAINT produto_id      PRIMARY KEY (produto_id)
);
--Esse comando adiciona comentarios nas colunas da tabela;
COMMENT ON TABLE   produtos                            IS 'tabela de produtos.';
COMMENT ON COLUMN  produtos.produto_id                 IS 'PK da tabela.';
COMMENT ON COLUMN  produtos.nome                       IS 'Inserir aqui o nome do produto.';
COMMENT ON COLUMN  produtos.preco_unitario             IS 'Inserir aqui o preco unitario do produto';
COMMENT ON COLUMN  produtos.detalhes                   IS 'Inserir aqui os detalhes do produto.';
COMMENT ON COLUMN  produtos.imagem                     IS 'Inserir aqui a imagem dos produtos.';
COMMENT ON COLUMN  produtos.imagem_mime_type           IS 'Inserir aqui o mime type da imagem do produto.';
COMMENT ON COLUMN  produtos.imagem_arquivo             IS 'Inserir aqui o arquivo da imagem do produto.';
COMMENT ON COLUMN  produtos.imagem_charset             IS 'Inserir aqui o charset da imagem.';
COMMENT ON COLUMN  produtos.imagem_ultima_atualizacao  IS 'Inserir aqui a imagem da ultima atualizacao.';

--Esse comando cria a tabela lojas;
CREATE TABLE  lojas (
                loja_id                 NUMERIC(38) NOT NULL,
                nome                    VARCHAR(255) NOT NULL,
                endereco_web            VARCHAR(100),
                endereco_fisico         VARCHAR(512),
                latitude                NUMERIC,
                longitude               NUMERIC,
                logo BYTEA,
                logo_mime_type          VARCHAR(512),
                logo_arquivo            VARCHAR(512),
                logo_charset            VARCHAR(512),
                logo_ultima_atualizacao DATE,
                CONSTRAINT loja_id      PRIMARY KEY (loja_id)
);
--Esse comando adiciona comentarios nas colunas da tabela;
COMMENT ON TABLE  lojas                           IS 'tabela da loja';
COMMENT ON COLUMN  lojas.loja_id                  IS 'PK da tabela.';
COMMENT ON COLUMN  lojas.nome                     IS 'Inserir aqui o nome da loja.';
COMMENT ON COLUMN  lojas.endereco_web             IS 'Inserir aqui endereco web da loja.';
COMMENT ON COLUMN  lojas.endereco_fisico          IS 'Inserir aqui o endereco fisico da loja.';
COMMENT ON COLUMN  lojas.latitude                 IS 'Inserir aqui latitude da loja.';
COMMENT ON COLUMN  lojas.longitude                IS 'Inserir aqui a longitude da loja.';
COMMENT ON COLUMN  lojas.logo                     IS 'Inserir aqui a logo da loja.';
COMMENT ON COLUMN  lojas.logo_mime_type           IS 'insira o mime type da logo da loja.';
COMMENT ON COLUMN  lojas.logo_arquivo             IS 'Inserir aqui a logo do arquivo.';
COMMENT ON COLUMN  lojas.logo_charset             IS 'Inserir aqui o charset da logo.';
COMMENT ON COLUMN  lojas.logo_ultima_atualizacao  IS 'Inserir aqui a logo da ultima atualizacao.';

--Esse comando cria a tabela estoques;
CREATE TABLE    estoques (
                estoque_id      NUMERIC(38) NOT NULL,
                loja_id         NUMERIC(38) NOT NULL,
                produto_id      NUMERIC(38) NOT NULL,
                quantidade      NUMERIC(38),
                CONSTRAINT estoque_id PRIMARY KEY (estoque_id)
);
--Esse comando adiciona comentarios nas colunas da tabela;
COMMENT ON TABLE   estoques                   IS 'tabela de estoques.';
COMMENT ON COLUMN  estoques.estoque_id        IS 'PK da tabela.';
COMMENT ON COLUMN  estoques.loja_id           IS 'PK da tabela.';
COMMENT ON COLUMN  estoques.produto_id        IS 'PK da tabela.';
COMMENT ON COLUMN  estoques.quantidade        IS 'Insira aqui a quantidade.';

--Esse comando cria a tabela clientes;
CREATE TABLE  clientes (
                cliente_id      NUMERIC(38) NOT NULL,
                nome            VARCHAR(255) NOT NULL,
                email           VARCHAR(255) NOT NULL,
                telefone1       NUMERIC(20),
                telefone2       NUMERIC(20),
                telefone3       NUMERIC(20),
                CONSTRAINT clientes_id PRIMARY KEY (cliente_id)
);
--Esse comando adiciona comentarios nas colunas da tabela;
COMMENT ON TABLE  clientes                   IS 'tabela clientes.';
COMMENT ON COLUMN  clientes.cliente_id       IS 'PK da tabela';
COMMENT ON COLUMN  clientes.nome             IS 'inserir aqui o nome do cliente.';
COMMENT ON COLUMN  clientes.email            IS 'inserir aqui o email do cliente.';
COMMENT ON COLUMN  clientes.telefone1        IS 'inserir aqui o telefone do cliente.';
COMMENT ON COLUMN  clientes.telefone2        IS 'Inserir aqui um telefone adicional opcional.';
COMMENT ON COLUMN  clientes.telefone3        IS 'Inserir aqui um telefone adicional opcional.';

--Esse comando cria a tabela envios;
CREATE TABLE  envios (
                envio_id             NUMERIC(38) NOT NULL,
                loja_id              NUMERIC(38) NOT NULL,
                cliente_id           NUMERIC(38) NOT NULL,
                endereco_entrega     VARCHAR(512) NOT NULL,
                status VARCHAR(15)   NOT NULL,
                CONSTRAINT envio_id PRIMARY KEY (envio_id)
);
--Esse comando adiciona comentarios nas colunas da tabela;
COMMENT ON TABLE  envios                     IS 'tabela envios.';
COMMENT ON COLUMN  envios.loja_id            IS 'PK da tabela.';
COMMENT ON COLUMN  envios.cliente_id         IS 'PK da tabela';
COMMENT ON COLUMN  envios.endereco_entrega   IS 'Inserir aqui o endereco da entrega.';
COMMENT ON COLUMN  envios.status             IS 'Inserir aqui status da entrega.';

--Esse comando cria a tabela pedidos;
CREATE TABLE  pedidos (
                pedido_id                NUMERIC(38) NOT NULL,
                data_hora                TIMESTAMP NOT NULL,
                cliente_id               NUMERIC(38) NOT NULL,
                status                   VARCHAR(15) NOT NULL,
                loja_id NUMERIC(38)      NOT NULL,
                CONSTRAINT pedido_id PRIMARY KEY (pedido_id)
);
--Esse comando adiciona comentarios nas colunas da tabela;
COMMENT ON TABLE  pedidos                  IS 'tabela dos pedidos';
COMMENT ON COLUMN  pedidos.pedido_id       IS 'PK da tabela.';
COMMENT ON COLUMN  pedidos.data_hora       IS 'Inserir aqui a data e hora do pedido.';
COMMENT ON COLUMN  pedidos.cliente_id      IS 'PK da tabela';
COMMENT ON COLUMN  pedidos.status          IS 'Inserir aqui o status do pedido.';
COMMENT ON COLUMN  pedidos.loja_id         IS 'PK da tabela.';

--Esse comando cria a tabela pedidos_itens;
CREATE TABLE pedidos_itens (
                produto_id NUMERIC(38) NOT NULL,
                pedido_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38),
                CONSTRAINT id_pedido PRIMARY KEY (produto_id, pedido_id)
);
COMMENT ON TABLE pedidos_itens IS 'tabela de itens dos pedidos';
COMMENT ON COLUMN pedidos_itens.produto_id IS 'PK da tabela';
COMMENT ON COLUMN pedidos_itens.pedido_id IS 'PK da tabela';
COMMENT ON COLUMN pedidos_itens.numero_da_linha IS 'Inserir aqui o numero da linha dos itens do pedido';
COMMENT ON COLUMN pedidos_itens.preco_unitario IS 'Inserir aqui o preco dos itens';
COMMENT ON COLUMN pedidos_itens.envio_id IS 'id do envio';


ALTER TABLE      pedidos_itens 
ADD CONSTRAINT   produtos_pedidos_itens_fk
FOREIGN KEY      (produto_id)
REFERENCES       produtos (produto_id)
ON DELETE        NO ACTION
ON UPDATE        NO ACTION
NOT DEFERRABLE;


ALTER TABLE     estoques 
ADD CONSTRAINT  produtos_estoques_fk
FOREIGN KEY     (produto_id)
REFERENCES      produtos (produto_id)
ON DELETE       NO ACTION
ON UPDATE       NO ACTION
NOT DEFERRABLE;

ALTER TABLE     pedidos 
ADD CONSTRAINT  lojas_pedidos_fk
FOREIGN KEY     (loja_id)
REFERENCES      lojas (loja_id)
ON DELETE       NO ACTION
ON UPDATE       NO ACTION
NOT DEFERRABLE;

ALTER TABLE     envios 
ADD CONSTRAINT  lojas_envios_fk
FOREIGN KEY     (loja_id)
REFERENCES      lojas (loja_id)
ON DELETE       NO ACTION
ON UPDATE       NO ACTION
NOT DEFERRABLE; 

ALTER TABLE     estoques 
ADD CONSTRAINT  lojas_estoques_fk
FOREIGN KEY     (loja_id)
REFERENCES      lojas (loja_id)
ON DELETE       NO ACTION
ON UPDATE       NO ACTION
NOT DEFERRABLE; 


---- Estes comandos adicionam as constraints obrigatorias


ALTER TABLE produtos
ADD CONSTRAINT preco_uni
CHECK (preco_unitario>0);

            
        
ALTER TABLE lojas
ADD CONSTRAINT enderecos_l
CHECK ((endereco_web IS NOT NULL AND endereco_fisico IS NULL) OR (endereco_web IS NULL AND endereco_fisico IS NOT NULL));



ALTER TABLE pedidos
ADD CONSTRAINT status_pedidos
CHECK (status IN ('CANCELADO', 'COMPLETO', 'ABERTO', 'PAGO', 'REEMBOLSADO', 'ENVIADO'));



ALTER TABLE envios
ADD CONSTRAINT status_envio
CHECK (status IN ('CRIADO', 'ENVIADO', 'TRANSITO', 'ENTREGUE'));
