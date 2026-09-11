# SQL SELECT - Exemplos de consultas ao banco Fly By Night

O comando `SELECT` é usado para **consultar dados armazenados nas tabelas do banco de dados**.

## SELECT básico: consultar todos os dados de uma tabela:

```sql
SELECT * FROM produtos;
```

## SELECT para apenas determinadas colunas

```sql
SELECT nome, preco FROM produtos;
```

## Alterando o nome de exibição das colunas

Usamos o comando `AS` para criar um **apelido (alias)**.

```sql
SELECT 
    nome AS produto, 
    preco AS "Preço em R$" 
FROM produtos;
```

## Filtrando registros com WHERE

O `WHERE` permite determinar **quais registros devem aparecer** no resultado. Na prática, são condições para execução do `SELECT`.

### Comparação de igualdade

```sql
SELECT * FROM produtos WHERE quantidade = 0;
```

### Comparação de maior

```sql
SELECT nome, preco FROM produtos WHERE preco > 1000;
```

### Comparação de menor ou igual

```sql
SELECT nome, preco FROM produtos WHERE preco <= 100;
```

### Comparação de diferença

Normalmente se usa o operador `<>` em vez do `!=`.

```sql
SELECT * FROM produtos WHERE fornecedor_id <> 1;
```

---

## Combinando condições

Usamos o `WHERE` e operadores lógicos e relacionais.

### Operador AND (E)

Exibir os produtos que custem menos de 500 e quantidade acima de 20.

```sql
SELECT nome, preco, quantidade FROM produtos
WHERE preco < 500 AND quantidade > 20;
```

### Operador OR (OU)

Exibir os produtos que custem mais de 3000 ou com quantidade zerada.

```sql
SELECT nome, preco, quantidade FROM produtos
WHERE preco > 3000 OR quantidade = 0;
```

### Operador NOT (NÃO)

Exibir os produtos que **não possuem preço acima de 1000**.

```sql
SELECT nome, preco FROM produtos WHERE NOT preco > 1000;
```

**Obs.:** o uso do `NOT` não é obrigatório, desde que você consiga o mesmo resultado usando uma lógica diferente, como no exemplo: 
`SELECT nome, preco FROM produtos WHERE preco <= 1000;`

### BETWEEN

Exibir produtos com preço **entre 100 e 500**.

```sql
SELECT nome, preco FROM produtos
WHERE preco BETWEEN 100 AND 500;
```

### IN

Exibir produtos que tenha o fornecedor ID 1, 4 ou 8.

```sql
SELECT * FROM produtos
WHERE fornecedor_id IN (1, 4, 8); -- lista de valores
```

Sem usar o `IN`, teríamos que fazer a lógica com múltimplos `OR`:

```sql
SELECT * FROM produtos 
WHERE 
    fornecedor_id = 1 OR 
    fornecedor_id = 4 OR 
    fornecedor_id = 8;
```

### LIKE

`LIKE` é usado principalmente para realizar pesquisas em textos. Junto com o caractere `%` permite fazer buscas baseadas em partes de uma string.

Exemplo: procurar produtos que tenham a palavra **Gamer** em qualquer posição do nome.

```sql
SELECT nome, preco FROM produtos
WHERE nome LIKE '%Gamer%';
```

## DISTINCT

Elimina valores repetidos do resultado da consulta.

```sql
SELECT DISTINCT fornecedor_id FROM produtos
```

## ORDENAÇÃO (ou CLASSIFICAÇÃO)

Usamos o `ORDER BY` para organizar os registros do resultado.

### Ordem crescente (padrão)

Exemplos: do menor para o maior, ou de A-Z, ou do mais antigo para mais recente.

```sql
SELECT nome, preco FROM produtos
ORDER BY preco ASC; 
-- nem precisa colocar o ASC, pois é padrão
```

### Ordem decrescente

Exemplos: do maior para o menor, ou de Z-A, ou do mais recente para o mais antigo.

```sql
SELECT nome, preco FROM produtos
ORDER BY preco DESC; 
```

### Ordenando por mais de uma coluna

```sql
SELECT nome, preco FROM produtos
ORDER BY preco DESC, nome ASC;
```

## Funções de agregação

Funções de agregação realizam cálculos ou processos em registros de um resultado.

Entre as principais:

- `COUNT()` -> conta registros
- `SUM()` -> soma valores
- `AVG()` -> calcula a média de valores
- `MIN()` -> encontra o menor valor
- `MAX()` -> encontra o maior valor
- `ROUND()` -> arredonda valores e define casas decimais

### COUNT

Contando quantos registros existem na tabela produtos:

```sql
SELECT COUNT(*) AS total FROM produtos;
```

### SUM

Somar a quantidade de todos os produtos da tabela:

```sql
SELECT SUM(quantidade) AS "Quantidade Total" FROM produtos;
```

### AVG

Calcular a média dos preços dos produtos:

```sql
SELECT AVG(preco) AS "Média dos Preços" FROM produtos;
```

### MIN

Retornar o menor preço existente:

```sql
SELECT MIN(preco) AS menor_preco FROM produtos;
```

### MAX

Retornar o maior preço existente:

```sql
SELECT MAX(preco) AS maior_preco FROM produtos;
```

### Combinando agregações

```sql
SELECT 
    COUNT(*) AS quantidade_produtos,
    MIN(preco) AS menor_preco,
    MAX(preco) AS maior_preco,
    ROUND (AVG(preco), 2) AS preco_medio
FROM produtos;
```

**Atenção:** não coloque espaço entre o nome da função e os parênteses!

## Recursos de agrupamento

`GROUP BY` reúne registros que possuem um determinado valor em comum.

### Contando produtos por fornecedor

```sql
SELECT fornecedor_id, COUNT(*) AS total_produto
FROM produtos GROUP BY fornecedor_id;
```

### Determinando a média de preços por fornecedor

```sql
SELECT fornecedor_id, ROUND(AVG(preco), 2) AS preco_medio
FROM produtos GROUP BY fornecedor_id;
```

### HAVING

`HAVING` permite filtrar os grupos criados pelo `GROUP BY`.

**Obs:** para usar o HAVING **precisa ter** GROUP BY.

Exemplo: mostrar somente os fornecedores que possuem pelo menos dois produtos cadastrados.

```sql
SELECT fornecedor_id, COUNT(*) AS total_produtos
FROM produtos GROUP BY fornecedor_id
HAVING total_produtos >= 2;
```

### Combinando WHERE, GROUP BY, HAVING e ORDER BY

Objetivos:

1. Considera produtos com quantidade maior que zero
2. Agrupa por fornecedor
3. Calcula a quantidade e preço médio de cada grupo
4. Mantém apenas fornecedores com pelo menos dois produtos
5. Ordena os grupos pelo preço médio

```sql
SELECT 
    fornecedor_id, 
    COUNT(*) AS total_produtos, 
    ROUND(AVG(preco), 2) AS preco_medio
FROM produtos
    WHERE quantidade > 0
    GROUP BY fornecedor_id
    HAVING total_produtos >= 2
    ORDER BY preco_medio DESC;
```

**Obs:** ao combinar estes recursos, a ordem deve ser:

1. WHERE
2. GROUP BY/HAVING
3. ORDER BY

---

## JOIN (JUNÇÃO)

Até agora consultamos principalmente dados existentes em **uma única tabela**.

Porém, nosso banco possui informações relacionadas **entre várias tabelas.**

Por exemplo:

- `produtos` possui `fornecedor_id`
- `fornecedores` possui o nome dos fornecedores

O `JOIN` permite **combinar informações de tabelas relacionadas** na consulta com `SELECT`.

### INNER JOIN entre produtos e fornecedores

Exibir nome dos fornecedores de cada produto:

```sql
SELECT 
    -- tabela.coluna AS apelido
    -- especialmente para colunas com o mesmo nome
    produtos.nome AS produto, 
    produtos.preco, 
    fornecedores.nome AS fornecedor
FROM produtos

-- Fazendo a junção (JOIN) entre as tabelas
-- Neste caso, produtos com fornecedores
INNER JOIN fornecedores

-- Definindo a condição de CRUZAMENTO entre as tabelas
    ON produtos.fornecedor_id = fornecedores.id;
```

### Apelidos (alias) para tabelas

Podemos usar apelidos para tornar consultas maiores mais compactas.

```sql
SELECT
    p.nome AS produto,
    p.preco,
    f.nome AS fornecedor
FROM produtos AS p
INNER JOIN fornecedores AS f
    ON p.fornecedor_id = f.id;
```
Neste exemplo:
    - `p` representa a tabela `produtos`;
    - `f` representa a tabela `fornecedores`;

**Dica:** versão ainda mais compacta omitindo o `AS`:

```sql
SELECT
    p.nome produto,
    p.preco,
    f.nome fornecedor
FROM produtos p
INNER JOIN fornecedores f
    ON p.fornecedor_id = f.id;
```    

