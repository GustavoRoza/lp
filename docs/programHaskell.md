# programHaskell.hs

## Descrição
Arquivo de estudos de Haskell com funções matemáticas, condicionais, recursão e resolução da prova do semestre passado.

## Mudanças
- Adicionada `totalVendas :: Sistema -> Double` (questão 6c): soma os valores dos pedidos com status `Pago`.
- Adicionado `sistemaTeste :: Sistema` com exemplo cobrindo os 3 status (Aberto, Pago, Cancelado).
- Implementada `aplicaDesconto :: Double -> Pedido -> Pedido` (questão 6e): aplica desconto percentual fracionado (ex: 0.1 = 10%) apenas em pedidos `Aberto`.

## Arquivos afetados
- `programHaskell.hs`

## Decisões
- `totalVendas` duplica o `filter` de `listaPedidosPagos` em vez de reusá-lo (poderia ser refatorado para `sum (map valorPedido (listaPedidosPagos sis))`).
- `aplicaDesconto` recebe percentual fracionado (0.1 = 10%), não inteiro.
- `aplicaDesconto` usa pattern matching: 1ª cláusula para `Aberto`, 2ª retorna o pedido inalterado.

## Teste
```haskell
totalVendas sistemaTeste
-- Esperado: 27.0 (Leite 15.0 + Cafe 12.0)

aplicaDesconto 0.1 ([("Arroz", 2, 10.0)], Aberto)
-- Esperado: ([("Arroz",2,9.0)],Aberto)

aplicaDesconto 0.1 ([("Leite", 1, 5.0)], Pago)
-- Esperado: ([("Leite",1,5.0)],Pago)
```

## Bugs conhecidos / Melhorias futuras
- `main` está comentado — compilação com `ghc` falha por falta de `main` (o arquivo é usado principalmente no GHCi).
- Reusar `listaPedidosPagos` em `totalVendas` para evitar duplicação.
