# Comandos CRUD para o Microblog

## INSERT na tabela usuários

```sql
INSERT INTO usuarios(nome, email, senha, tipo) 
VALUES('Ana Silva', 'ana@email', '123abc', 'admin');

INSERT INTO usuarios(nome, email, senha, tipo) 
VALUES('Bruno Souza', 'bruno@email', 'abc456', 'admin');

INSERT INTO usuarios(nome, email, senha, tipo) 
VALUES('Carla Mendes', 'carla@email.com', '789xyz', 'editor');
```

## INSERT na tabela categorias
```sql
INSERT INTO categorias(nome) VALUES('Tecnologia'), ('Educação'), ('Entretenimento');
```


## INSERT na tabela noticias

```sql
INSERT INTO noticias(titulo, resumo, texto, imagem, destaque, usuario_id, categoria_id)
VALUES(
    'Corinthians está mau pra caramba',
    'O time caiu muito após a copa do mundo',
    'Não sei mais o que escrever sobre isso tudo e etc e tal e bla bla',
    'corinthians.jpg',
    'nao',
    3,
    3
);

INSERT INTO noticias(titulo, resumo, texto, imagem, destaque, usuario_id, categoria_id)
VALUES(
    'Senac prepara novos títulos para 2027',
    'Em 2027 diversos títulos com bolsas de estudos serão lançados',
    'Um texto qualquer sobre esta notícia de cursos do Senac com bolsas para 2027 e etc',
    'cursos.png',
    'sim',
    1,
    2
), (
    'Visual Studio Code com IA aprimorada',
    'As atualizações recentes do VSCode trouxeram melhorias para o Copilot',
    'Usar o VSCode ficou mais fácil pois etc e tal e bla bla bla e etc e sei la etc',
    'vscode.jpg',
    'sim',
    2,
    1
), (
    'Novo filme do Homem Aranha estreia nesta quinta',
    'Miranha é o cara',
    'Vai no cinema? Eu não... tá caro e tá frio demais... vou baixar na internet',
    'miranha.jpg',
    'nao',
    1,
    3
);
```

---

## UPDATE

```sql
-- 1. Alterar o nome de um dos usuários cadastrados.
UPDATE usuarios SET nome = 'Fulano da Silva' WHERE id = 1;

-- 2. Alterar o tipo de um usuário de editor para admin.
UPDATE usuarios SET tipo = 'admin' WHERE id = 3;

-- 3. Alterar o nome de uma categoria.
UPDATE categorias SET nome = 'Diversão' WHERE id = 3;

-- 4. Alterar o título de uma notícia.
UPDATE noticias SET titulo = 'Senac antecipa novos cursos' WHERE id = 2;

-- 5. Alterar uma notícia que esteja com destaque = 'nao' para destaque = 'sim'.
UPDATE noticias SET destaque = 'sim' WHERE id = 1;


-- 6. Alterar a categoria de uma notícia.`
UPDATE noticias SET categoria_id = 1 WHERE id = 1;
```

## DELETE

```sql
-- 1. Excluir uma das notícias cadastradas.
DELETE FROM noticias WHERE id = 4;

-- 2. Excluir uma categoria que não esteja sendo utilizada por nenhuma notícia.
DELETE FROM categorias WHERE id = 3;

-- 3. Excluir um usuário que não esteja associado a nenhuma notícia.
DELETE FROM usuarios WHERE id = 3;

-- Obs: neste exemplo foi possível excluir mesmo havendo notícias deste usuários, pois na modelagem física deixamos configurado o relacionamento entre as tabelas (noticias e usuarios) para que ao excluir uma notícia, o campo usuario_id automaticamente fosse setado para null
```
