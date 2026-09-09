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
