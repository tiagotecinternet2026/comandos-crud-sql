# Operações de SELECT básico no Microblog

## Consultas básicas

1. Consulte todos os dados de todos os usuários cadastrados.

```sql
SELECT * FROM usuarios;
```

2. Consulte apenas algumas informações dos usuários, como nome e e-mail (ou colunas 3. equivalentes existentes no seu banco).

```sql
SELECT nome, email FROM usuarios;
```

3. Consulte os dados das categorias cadastradas.

```sql
SELECT * FROM categorias;
```

4. Consulte apenas algumas informações das notícias, como título e data de publicação.

```sql
SELECT titulo, data FROM noticias;
```

5. Faça uma consulta utilizando AS (alias, apelido) para alterar o nome de pelo menos duas colunas no resultado.

```sql
SELECT 
    titulo AS noticia, 
    data AS "Publicada em:"
FROM noticias;
```

---

## Filtros com WHERE

6. Consulte somente os usuários de um determinado tipo, de acordo com os dados existentes no seu banco.

```sql
SELECT * FROM usuarios WHERE tipo = 'admin';
```

7. Consulte somente as notícias que estejam marcadas como destaque (ou alguma informação equivalente existente no seu modelo).

```sql
SELECT * FROM noticias WHERE destaque = 'sim';
```

8. Escolha uma categoria existente no seu banco e consulte as notícias pertencentes a ela utilizando seu identificador.

```sql
SELECT * FROM noticias WHERE categoria_id = 6;
```

9. Faça uma consulta utilizando o operador <> para excluir do resultado algum tipo de usuário, categoria ou outro valor existente no seu banco.

```sql
SELECT * FROM usuarios WHERE tipo <> 'admin';

-- Poderiamos usar o operador lógico NOT também:
SELECT * FROM usuarios WHERE NOT tipo = 'admin';
```

---

## Combinando condições

10. Faça uma consulta utilizando AND para estabelecer duas condições simultaneamente.

```sql
SELECT * FROM noticias 
WHERE destaque = 'sim' AND categoria_id = 6;

-- Obs: talvez nenhum resultado apareça simplesmente porque
-- não há notícias que batam com as duas condições. Isso
-- NÃO É um erro.
```

11. Faça outra consulta utilizando OR, na qual um registro possa aparecer se atender a uma condição ou outra.

```sql
SELECT * FROM noticias 
WHERE destaque = 'sim' OR categoria_id = 6;
```

## Pesquisas com LIKE

12. Escolha uma palavra ou parte de uma palavra existente nos dados do seu banco e utilize LIKE para procurar registros que a contenham.

```sql
SELECT * FROM noticias WHERE
    titulo LIKE '%tecnologia%' OR
    resumo LIKE '%tecnologia%' OR
    texto LIKE '%tecnologia%' OR
    imagem LIKE '%tecnologia%';
```

13. Faça uma consulta utilizando LIKE para encontrar registros cujo texto comece com determinada letra ou palavra.

```sql
SELECT * FROM noticias WHERE titulo LIKE 'A%'; 
```

---

## Ordenação

14. Consulte as notícias organizando o resultado da mais recentes para as mais antigas.

```sql
SELECT titulo, data FROM noticias ORDER BY data DESC;
```

15. Escolha uma tabela e faça uma consulta ordenando seus registros em ordem alfabética.

```sql
SELECT nome FROM usuarios ORDER BY nome ASC;
```

## Funções de agregação

16. Utilize COUNT() para descobrir quantos usuários existem cadastrados.

```sql
SELECT COUNT(*) AS total_usuarios FROM usuarios;
```

17. Utilize COUNT() para descobrir quantas notícias existem cadastradas.

```sql
SELECT COUNT(*) AS total_noticias FROM noticias;
```

18. Utilize MIN() e MAX() sobre a data das notícias para descobrir a data da notícia mais antiga e da mais recente.

```sql
SELECT 
    MIN(data) AS noticia_mais_antiga,
    MAX(data) AS noticia_mais_nova
FROM noticias;
```

---

# Desafio

19. Crie uma consulta por conta própria combinando pelo menos três recursos estudados nesta aula.

```sql
SELECT 
    titulo AS noticia,
    data AS publicacao
FROM noticias
    WHERE destaque = 'sim' AND titulo LIKE '%tecnologia%'
ORDER BY data DESC;
```