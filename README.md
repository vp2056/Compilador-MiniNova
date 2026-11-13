# MiniNova

Linguagem de programação autoral desenvolvida para o **Projeto A3 de Compiladores** (UC Teoria da Computação e Compiladores). Os arquivos-fonte utilizam a extensão **`.mn`** e o analisador léxico/sintático é gerado utilizando o **JavaCC** com integração **Maven**.

---

## 1. Apresentação da Linguagem

O **MiniNova** é uma linguagem imperativa estruturada com tipagem declarada e uma sintaxe limpa inspirada em linguagens modernas. 

### Principais Recursos Implementados:
* **Variáveis e Tipos:** Suporte a dados numéricos (`int`, `float`), textuais (`string`) e lógicos (`bool`), além de valores nulos (`none`).
* **Atribuição e Declaração:** Flexibilidade na declaração de variáveis (`val tipo id = valor;` ou `val id;`).
* **Controle de Fluxo:** Estruturas condicionais (`if`, `elif`, `else`) e laços de repetição (`for`).
* **Entrada e Saída:** Comandos dedicados para leitura interativa via console (`out`) e escrita formatada de múltiplos argumentos (`print`).
* **Expressões Completas:** Operadores aritméticos (`+`, `-`, `*`, `/`, `%`, potências com `**`), relacionais (`==`, `!=`, `<`, `<=`, `>`, `>=`) e lógicos (`and`, `or`).

---

## 2. Especificação Léxica

| Categoria | Tokens / Expressões Regulares |
|---|---|
| **Palavras reservadas** | `val`, `print`, `out`, `if`, `elif`, `else`, `for`, `and`, `or`, `int`, `float`, `string`, `bool`, `true`, `false`, `none` |
| **Operadores aritméticos** | `**`, `+`, `-`, `*`, `/`, `%` |
| **Operadores relacionais** | `==`, `!=`, `<`, `<=`, `>`, `>=` |
| **Operadores lógicos** | `and`, `or` |
| **Símbolos e Atribuição** | `=`, `;`, `{`, `}`, `,`, `(`, `)` |
| **Literais Inteiros** | `[0-9]+` |
| **Literais Reais** | `[0-9]+ "." [0-9]+` |
| **Literais de String** | `"` (qualquer caractere exceto `"` e quebra de linha)* `"` |
| **Identificadores** | `[a-zA-Z_][a-zA-Z0-9_]*` |
| **Descartados (SKIP)** | Espaços, tabulações, quebras de linha (`\r`, `\n`) e comentários de linha (`./` até o fim da linha) |

---

## 3. Especificação Formal da Gramática (EBNF)

```ebnf
programa     ::= ( comando )* <EOF>
bloco        ::= "{" ( comando )* "}"
comando      ::= declaracao | atribuicao | chamada | leitura | escrita | condicional | para
declaracao   ::= "val" ( tipo ID | ID [ tipo ] ) [ "=" expressao ] ";"
tipo         ::= "int" | "float" | "string" | "bool"
atribuicao   ::= ID "=" expressao ";"
chamada      ::= ID [ listaArgumentos ] ";"
listaArgumentos ::= expressao ( expressao )*
leitura      ::= "out" ID ";"
escrita      ::= "print" expressao ( "," expressao )* ";"
condicional  ::= "if" expressao bloco ( "elif" expressao bloco )* ( "else" bloco )?
para         ::= "for" ID expressao bloco
expressao    ::= ou
ou           ::= e ( "or" e )*
e            ::= relacional ( "and" relacional )*
relacional   ::= aditiva [ opRel aditiva ]
opRel        ::= "==" | "!=" | "<" | "<=" | ">" | ">="
aditiva      ::= mult ( ( "+" | "-" ) mult )*
mult         ::= unario ( ( "*" | "/" | "%" ) unario )*
unario       ::= "-" unario | potencia
potencia     ::= fator ( "**" unario )?
fator        ::= NUM_INT | NUM_FLOAT | STRING_LIT | "true" | "false" | "none" | "(" expressao ")" | ID
```

---

## 4. Instruções de Compilação e Execução

### Pré-requisitos
* Java JDK 21 ou superior instalado (conforme `maven.compiler.source/target` do `pom.xml`).
* Maven instalado e configurado no PATH.

### Comandos Maven

1. **Compilar o projeto (Gera os arquivos JavaCC e compila as classes):**
   ```bash
   mvn compile
   ```

2. **Executar o compilador interativamente via console:**
   ```bash
   mvn exec:java -Dexec.mainClass="MiniNova"
   ```

3. **Executar passando um arquivo de código-fonte `.mn`:**
   ```bash
   mvn exec:java -Dexec.mainClass="MiniNova" -Dexec.args="caminho/para/arquivo.mn"
   ```
4. **Executar o script Linux e Windows**
   ```
   ./linux.sh src/exemplos/validos/calc.mn
   
   ./windows.bat src/exemplos/validos/calc.mn
   ```

---

## 5. Estrutura de Testes

O repositório contém diretórios dedicados com exemplos de código:
* `src/exemplos/validos/`: Programas sintática e semanticamente corretos para validação.
* `src/exemplos/invalidos/`: Códigos propositalmente errados para testar o tratamento de exceções léxicas e sintáticas.

---

## 6. Matriz de Responsabilidade

| Integrante | Módulos e Responsabilidades Desenvolvidas |
|---|---|
| **Victor Pedro** | Especificação léxica (`SKIP`, `TOKEN`), tratamento de identificadores, literais e comentários `./`. |
|                  | Implementação das regras sintáticas de expressões aritméticas, relacionais, lógicas e precedência (`**`). |
|                  | Estruturas de controle de fluxo (`if/elif/else`, `for`) e rotinas de E/S (`print`/`out`). |
