# Flux Formal Grammar (EBNF)
The syntax of the Flux compiler is strictly functional and typed, optimizing for deterministic causal traces over open-ended generative structures.

```ebnf
<Program>          ::= { <Statement> }
<Statement>        ::= <TypeDecl> | <FunctionDecl> | <VariableDecl> | <ExpressionStmt>

<TypeDecl>         ::= "type" <Identifier> "=" "{" <TypeFields> "}"
<TypeFields>       ::= <FieldDecl> { "," <FieldDecl> }
<FieldDecl>        ::= <Identifier> ":" <Type>

<FunctionDecl>     ::= "fn" <Identifier> "(" [ <ParamList> ] ")" ":" <Type> "{" { <BodyStmt> } "}"
<ParamList>        ::= <ParamDecl> { "," <ParamDecl> }
<ParamDecl>        ::= <Identifier> ":" <Type>

<BodyStmt>         ::= <VariableDecl> | <ConstraintStmt> | <ReturnStmt> | <ExpressionStmt>
<ConstraintStmt>   ::= "assert" <Expression> ";" | "satisfy" "(" <Expression> ")" ";"

<VariableDecl>     ::= "let" <Identifier> "=" <Expression> ";"
<ReturnStmt>       ::= "return" <Expression> ";"

<Type>             ::= "int" | "bool" | "string" | <Identifier>

<Expression>       ::= <LogicalOr>
<LogicalOr>        ::= <LogicalAnd> { "||" <LogicalAnd> }
<LogicalAnd>       ::= <Equality> { "&&" <Equality> }
<Equality>         ::= <Relational> { ("==" | "!=") <Relational> }
<Relational>       ::= <Additive> { ("<" | "<=" | ">" | ">=") <Additive> }
<Additive>         ::= <Multiplicative> { ("+" | "-") <Multiplicative> }
<Multiplicative>   ::= <Unary> { ("*" | "/") <Unary> }
<Unary>            ::= ("!" | "-") <Unary> | <Primary>

<Primary>          ::= <Identifier> | <Literal> | <StructInit> | <FunctionCall> | "(" <Expression> ")"
<StructInit>       ::= <Identifier> "{" <FieldInitList> "}"
<FieldInitList>    ::= <FieldInit> { "," <FieldInit> }
<FieldInit>        ::= <Identifier> ":" <Expression>

<Literal>          ::= <Integer> | <Boolean> | <StringLiteral>
```
