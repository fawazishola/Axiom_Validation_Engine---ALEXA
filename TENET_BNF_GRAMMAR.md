# Tenet Formal Grammar (EBNF)
Tenet's syntax is built specifically for symbolic evaluation and constraint satisfiability. It utilizes a declarative structure prioritizing logical assertions over procedural steps.

```ebnf
<Program>          ::= { <Statement> }
<Statement>        ::= <VariableDecl> | <ConstraintDecl> | <BlockStmt> | <ExecutionTrigger> | <GameDecl> | <PrintStmt>

<VariableDecl>     ::= "var" <Identifier> ":" <Type> ";"
                     | "var" <Identifier> "=" <Expression> ";"
<Type>             ::= "int" | "bool"

<ConstraintDecl>   ::= "assert" "(" <LogicalExpr> ")" ";"

<BlockStmt>        ::= "attempt" "{" { <Assignment> } "}"
<Assignment>       ::= <Identifier> "=" <Expression> ";"

<ExecutionTrigger> ::= "check_satisfiability" "(" ")" ";"
                     | "solve" <Identifier> ";"

<GameDecl>         ::= "game" <Identifier> "{" <PlayersDecl> <StrategiesDecl> { <PayoffDecl> } "}"
<PlayersDecl>      ::= "players" <Identifier> { "," <Identifier> }
<StrategiesDecl>   ::= "strategies" <Identifier> { "," <Identifier> }
<PayoffDecl>       ::= "payoff" <Identifier> "{" { <PayoffEntry> } "}"
<PayoffEntry>      ::= "(" <Identifier> "," <Identifier> ")" ":" <Integer>

<PrintStmt>        ::= "print" <StringLiteral> ";"

<LogicalExpr>      ::= <LogicalTerm> { "OR" <LogicalTerm> }
<LogicalTerm>      ::= <LogicalFactor> { "AND" <LogicalFactor> }
<LogicalFactor>    ::= "NOT" <LogicalFactor> | "(" <LogicalExpr> ")" | <Comparison> | <Identifier> | <Boolean>

<Comparison>       ::= <MathExpr> <Operator> <MathExpr>
<Operator>         ::= "==" | "!=" | "<" | "<=" | ">" | ">="

<MathExpr>         ::= <MathTerm> { ("+" | "-") <MathTerm> }
<MathTerm>         ::= <MathFactor> { ("*" | "/") <MathFactor> }
<MathFactor>       ::= <Identifier> | <Integer> | "(" <MathExpr> ")"
```
