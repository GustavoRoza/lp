{- 
- tipos são com letras maiusculas
- último valor no cabeçalho de uma função indica o retorno da mesma
- sqrt  = retorna a raiz quadrada
- abs = retorna o valor absoluto
- div = retorna o inteiro de uma divisao
- mod = retorna o resto da divisao 
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
