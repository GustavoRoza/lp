{- 
- tipos são com letras maiusculas
- último valor no cabeçalho de uma função indica o retorno da mesma
- sqrt  = retorna a raiz quadrada
- abs = retorna o valor absoluto
- div = retorna o inteiro de uma divisao
- mod = retorna o resto da divisao 
- Tipos basicos: Int, Float, Double, Bool, Char, String
- Listas: [Int], [Char], etc. Homogêneas
- Tuplas: (Int, Bool), (Float, String, Int) Heterogêneas
- Funções: first-class (podem ser passadas como argumento)
- foldr = dobra da direita para esquerda
- foldl = dobra da esquerda para a direita
- map = aplica uma função a cada elemento da lista (map f [1,2,3] -> [f 1, f 2, f 3])
- filter = filtra elementos com base em uma condição (filter even [1,2,3] -> [2])
- odd = retorna True se o número for ímpar (oposto de even)
- even = retorna True se o número for par
- . = composição de funções (f . g x = f (g x), lê da direita para esquerda)
- if/then/else = condicional (else é obrigatório)
- guards = | condição = valor (otherwise = caso padrão)
- let/in = declarações locais
- where = declarações locais após a definição
- Recursão: sem loops, usar recursão com guards
- Pattern matching: desestruturar listas, tuplas, etc.
- Funções puras: sem efeitos colaterais
- IO: ações que interagem com o mundo externo
- Type classes: Eq, Ord, Show, Read, Num, Floating
- Polimorfismo: tipos com variáveis (a, b, etc.)
- data = define um novo tipo com construtores (data Animal = Cachorro | Gato)
- type = cria um sinônimo de tipo (type Nome = String)
- deriving = gera automaticamente instâncias de type classes (deriving Show, Eq)

-}    


polinomio :: Int -> Int 
polinomio x = x*x + 10*x + 2

matematica :: Float -> Float -> Float
matematica var va2 = (var * 2) + va2

area :: Float -> Float
area raio = raio*raio*pi 

hipotenua :: Float -> Float -> Float
hipotenua catO catA = sqrt(catA*catA + catO*catO) 

diff :: Float -> Float -> Float
diff r1 r2 = abs((area r1) - (area r2))  

-- condicionais 
maior :: Int -> Int -> Int
maior a b = if a >= b
    then a
    else b

fatorial :: Int -> Int -- guardas
fatorial n 
    | n == 0 = 1
    | n > 0 = n * (fatorial(n-1))

maiorg :: Int -> Int -> Int -- guardas
maiorg a b 
    | a > b = a
    | a < b = b
    | otherwise = 0

ispar :: Int -> Bool 
ispar num = if mod num 2 == 0 
    then True 
    else False

absoluto :: Int -> Bool
absoluto x = if x >= 0 
    then True   
    else False

areaDeNegativo :: Int -> IO () 
areaDeNegativo number   
    | absoluto (number) = print (area (fromIntegral number))
    | otherwise = print "nao vou calcular area de negativo"

{- main :: IO ()
main = print (foldl (\acc x -> acc - x) 0 [1,2,3,4]) -}




-- resolucao da prova do semestre passado
-- 1
fordeErre :: Int
fordeErre = foldr (\acc x -> acc - x) 0 [1,2,3,4]
{- -2 -}

fordeEle :: Int
fordeEle = foldl (\acc x -> acc - x) 0 [1,2,3,4]
{- -10 -}

-- 2
somaComprimentos :: [Int] -> Int
somaComprimentos xs = 
    let f x = if null x
            then 0
            else length x + f (tail x)
    in f xs

{- 
Exemplo com [1,2,3]:
f [1,2,3]
= length [1,2,3] + f [2,3]
= 3 + (length [2,3] + f [3])
= 3 + (2 + (length [3] + f []))
= 3 + (2 + (1 + 0))
= 6
 -}

-- 3
exemplo :: [Int] -> Int
exemplo xs = case xs of
    (x:y:zs) -> x + y + length zs
    _ -> 0

{- caso xs seja [1,2,3] o resultado será 4 -}

-- 4 
sumaDaLista :: Float
sumaDaLista = sum (map (sqrt . (+1)) [3,8,15])

{- Resultado: 9 -}

-- 5
somaUmAosImpares :: [Int] -> [Int]
somaUmAosImpares xs =
    let f = map (+1) . filter odd
        in f xs

{- para uma lista [1,2,3,4,5] o resultdo é [2,4,6] -} 

-- 6
type Produto = String
type Quantidade = Int
type Preco = Double

data StatusPedido = Aberto | Pago | Cancelado
    deriving (Show, Eq)

type Item = (Produto, Quantidade, Preco)
type Pedido = ([Item], StatusPedido)
type Sistema = [Pedido]

-- 6a
valorPedido :: Pedido -> Double
valorPedido (itens, _) = sum (map subtotal itens)
    where 
        subtotal (_, quantidade, preco) = fromIntegral quantidade * preco

{- valorPedido ([("Arroz", 2, 10.5), ("Feijão", 1, 8.0)], Aberto)
 Resultado 29.0 -}

 --6b
listaPedidosPagos :: Sistema -> [Pedido]
listaPedidosPagos = filter (\(_, status) -> status == Pago)

{- Exemplo:
sistema = [ ([("Arroz", 2, 10.5)], Aberto)
          , ([("Feijao", 1, 8.0)], Pago)
          , ([("Leite", 3, 5.0)], Pago) ]

listaPedidosPagos sistema
Resultado: [([("Feijão",1,8.0)],Pago),([("Leite",3,5.0)],Pago)] -}

--6c
totalVendas :: Sistema -> Double
totalVendas sis = sum (map valorPedido (filter (\(_, status) -> status == Pago) sis))

sistemaTeste :: Sistema
sistemaTeste =
  [ ([("Arroz", 2, 10.5), ("Feijao", 1, 8.0)], Aberto)
  , ([("Leite", 3, 5.0)], Pago)
  , ([("Cafe", 1, 12.0)], Pago)
  , ([("Acucar", 4, 2.5)], Cancelado)
  ]

{- totalVendas sistemaTeste
 Resultado: 27.0 (Leite 15.0 + Cafe 12.0; Aberto e Cancelado ignorados) -}


--6e
aplicaDesconto :: Double -> Pedido -> Pedido
aplicaDesconto d (itens, Aberto) = (map (\(p,q,pr) -> (p,q,pr*(1-d))) itens, Aberto)
aplicaDesconto _ pedido = pedido

{- aplicaDesconto 0.1 ([("Arroz", 2, 10.0)], Aberto)
 Resultado: ([("Arroz",2,9.0)],Aberto)

 aplicaDesconto 0.1 ([("Leite", 1, 5.0)], Pago)
 Resultado: ([("Leite",1,5.0)],Pago) -- inalterado -}
