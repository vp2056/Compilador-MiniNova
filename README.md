# MiniNova

Linguagem de programação autoral criada para o Projeto A3 de Compiladores (UC Teoria da Computação e Compiladores).
Arquivos-fonte usam a extensão **`.mn`**. O analisador léxico e sintático é gerado com **JavaCC** (Java).

## 1. Apresentação da linguagem

MiniNova é uma linguagem imperativa estruturada, com tipagem declarada, blocos delimitados por chaves e sintaxe inspirada em Python e Rust.
Possui suporte a variáveis (`val`), atribuição, estruturas condicionais (`if/elif/else`), laços de repetição (`while`, `for`), comandos de entrada (`out`) e saída (`print`), além de expressões aritméticas, relacionais e lógicas completas com precedência de operadores.

## 2. Especificação léxica

| Categoria | Tokens |
|---|---|
| Palavras reservadas | `val fn print out if elif else for while and or int float string bool true false None` |
| Operadores aritméticos | `+ - * / % **` |
| Operadores relacionais | `== != < > <= >=` |
| Operadores lógicos | `and or` |
| Atribuição / símbolos | `= ; { }`  |
| Inteiro | `[0-9]+` |
| Real | `[0-9]+ "." [0-9]+` |
| String | `"` (qualquer caractere exceto `"` e quebra de linha)* `"` |
| Identificador | `[a-zA-Z_][a-zA-Z0-9_]*` |
| Descartados | espaço, tab, quebra de linha e comentário `./` até o fim da linha |

## 3. Gramática (EBNF)

```

programa ::= ( declaracao | funcao )* <EOF>
funcao ::= "fn" ID [ listaParametros ] bloco
listaParametros ::= ID ( ID )*
bloco ::= "{" ( comando )* "}"

Comandos e Estruturas de Controle

comando ::= declaracao | atribuicao | chamada | leitura | escrita | condicional | enquanto | para
declaracao ::= "val" ID [ "=" ] tipo [ "=" expressao ] ";"
tipo ::= "int" | "float" | "string" | "bool"
atribuicao ::= ID "=" expressao ";"
chamada ::= ID [ listaArgumentos ] ";"
listaArgumentos ::= expressao ( expressao )*
leitura ::= "out" ID ";"
escrita ::= "print" expressao ( expressao )* ";"
condicional ::= "if" expressao bloco ( "elif" expressao bloco )* [ "else" bloco ]
enquanto ::= "while" expressao bloco
para ::= "for" ID expressao bloco

Hierarquia de Expressões

expressao ::= ou
ou ::= e ( "or" e )*
e ::= relacional ( "and" relacional )*
relacional ::= aditiva [ opRel aditiva ]
opRel ::= "== " | "!=" | "<=" | ">=" | "<" | ">"
aditiva ::= mult ( ( "+" | "-" ) mult )*
mult ::= unario ( ( "*" | "/" | "%" ) unario )*
unario ::= "-" unario | potencia
potencia ::= fator [ "**" unario ]
fator ::= NUM_INT | NUM_FLOAT | STRING_LIT | "true" | "false" | "None" | ID | "(" expressao ")"


```
## 4. Compilação e execução
``` 
Requisitos: JDK 8+ 

Windows:

Linux: 

mvn compile

mvn exec:java -Dexec.mainClass="MiniNova"

mvn exec:java -Dexec.mainClass="MiniNova" -Dexec.args="/home/victor/projetos-dev/java/Compilador-MiniNova/src/exemplos/validos/calc.mn"                              
```

Códigos de saída: `0` aceito, `2` erro sintático, `3` erro léxico.

## 5. Testes
- `exemplos/validos/`: `calc.mn`
- `exemplos/invalidos/`:  `sintaxe_incorreta.mn `

## 6. Matriz de Responsabilidade

| Integrante | Responsabilidades e módulos desenvolvidos |
|---|---|
| victor Pedro | Especificação léxica (SKIP, TOKEN), comentários, identificadores e literais |
| victor Pedro  | Expressões aritméticas, relacionais e lógicas, precedência e `**` |
| victor Pedro  | Declaração, atribuição, `if/elif/else`, `while/for`, `print`/`out`, `fn` |
