# Data Prep & Transformation - Caso de Uso Prático

## Equipe
- Carolina Suelen Attili 10369043
- Davi Santos Messias 10444890
- Aline Couto	10206399
- Cristian Barros	10444616

---

## Sobre o Projeto
Este projeto foi desenvolvido como parte da disciplina **Data Prep & Transformation** no MBA de Engenharia de Dados da Universidade Mackenzie. O objetivo é criar um fluxo completo de preparação e transformação de dados brutos de um e-commerce brasileiro, transformando-os em dados especialistas para análise. Abaixo estão as respostas detalhadas para as perguntas do caso de uso.

---

## Perguntas e Respostas

### **1. Criação do Banco de Dados Transacional**
O banco de dados transacional foi implementado com base nos dados disponíveis no Kaggle ([Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)). Foi utilizado o SQL Server como SGBD, e as tabelas principais foram importadas no esquema transacional conforme os dados originais.

**Estrutura Implementada:**
- Tabelas:
  - `olist_orders`
  - `olist_order_items`
  - `olist_products`
  - `olist_customers`
  - `olist_sellers`
  - Entre outras auxiliares.

O carregamento foi realizado utilizando scripts SQL para criar as tabelas e importar os arquivos CSV disponíveis no Kaggle.

---

### **2. Modelos Star Schema e Wide Table**
Foram implementados dois modelos analíticos diferentes:

#### **Modelo Star Schema**
O Star Schema foi modelado com as seguintes características:
- **Tabelas Dimensionais**:
  - `dim_products`: Contém informações sobre produtos.
  - `dim_customers`: Contém informações sobre clientes.
  - `dim_sellers`: Contém informações sobre vendedores.
- **Tabela Fato**:
  - `fact_orders_star`: Agrega os dados transacionais no grão de ano e mês das vendas.

#### **Modelo Wide Table**
A Wide Table foi modelada unificando todas as dimensões e fatos em uma única tabela ampla, com as colunas relevantes de produtos, clientes, vendedores e pedidos.

**Grão do Modelo**: Ano e mês das vendas.

---

### **3. Fluxo de Transformação dos Dados**

O fluxo de transformação foi implementado utilizando **Python**, com foco em eficiência e automação. Abaixo estão os principais passos:

1. **Carregamento dos Dados Brutos**:
   - Utilizando `pyodbc` para conectar ao banco transacional e carregar tabelas (`olist_orders`, `olist_order_items`, etc.).

2. **Transformação Incremental**:
   - Apenas os dados novos ou alterados desde a última execução são processados. Uma tabela de controle (`sync_control`) foi criada para armazenar a data/hora da última sincronização.
   - Dados incrementais são filtrados com cláusulas `WHERE`.

3. **Criação do Star Schema**:
   - Construção de tabelas dimensionais e agregação dos dados na tabela fato no grão de ano e mês utilizando `pandas`.

4. **Criação da Wide Table**:
   - Junção de tabelas transacionais para formar uma tabela ampla com todas as informações necessárias.

5. **Carregamento nos Bancos Analíticos**:
   - Utilizando `to_sql` do `pandas` e SQLAlchemy para carregar os dados processados nos bancos analíticos (Star Schema e Wide Table).

6. **Automação**:
   - Após o processamento, a tabela de controle é atualizada para permitir a próxima execução incremental.

**Tecnologias Utilizadas**:
- Python (`pandas`, `pyodbc`, `SQLAlchemy`)
- SQL Server (Banco Transacional e Bancos Analíticos)

---

### **4. Abordagem de Tempestividade**

A abordagem escolhida foi **Batch Processing (Processamento em Lote)**. Abaixo estão os motivos para essa escolha:

1. **Volume de Dados**:
   - O conjunto de dados tem aproximadamente 100 mil registros, suficiente para processamento em lote.

2. **Frequência das Atualizações**:
   - Os dados são históricos (2016-2018), e não há necessidade de processamento em tempo real.

3. **Simplicidade e Custo**:
   - A abordagem em lote é mais simples de implementar e mantém os custos baixos em comparação a Micro-Batch ou Stream Processing.

4. **Requisitos Analíticos**:
   - O foco é na análise agregada no grão de ano e mês, que não exige baixa latência.

5. **Escalabilidade**:
   - A abordagem é escalável e pode ser ajustada para volumes maiores no futuro.

---

## Estrutura de Arquivos do Projeto

- **`scripts/`**: Contém os scripts Python para transformação dos dados.
- **`sql/`**: Scripts SQL para criação das tabelas transacionais e analíticas.
- **`README.md`**: Este documento.

---

## Como Executar

### Requisitos
- Python 3.8+
- Bibliotecas Python:
  - `pandas`
  - `pyodbc`
  - `sqlalchemy`
- SQL Server com os dados do Kaggle carregados.

### Passos
1. Clone este repositório.
2. Configure o banco de dados transacional conforme o esquema fornecido.
3. Execute os scripts Python para processar os dados incrementais:
   ```bash
   python transform_data.py
