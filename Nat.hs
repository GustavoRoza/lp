data Nat = Zero | Suc Nat deriving (Show)

-- 1. Constantes
um :: Nat
um = Suc Zero

dois :: Nat
dois = Suc um

tres :: Nat
tres = Suc dois

quatro :: Nat
quatro = Suc tres

-- 2. Conversao
nat2integer :: Nat -> Integer
nat2integer Zero = 0
nat2integer (Suc n) = 1 + nat2integer n

integer2nat :: Integer -> Nat
integer2nat n | n <= 0 = Zero
integer2nat 0 = Zero
integer2nat n = Suc (integer2nat (n - 1))

-- 3. Operacoes Aritmeticas (Recursivas)
natAdd :: Nat -> Nat -> Nat
natAdd n Zero = n
natAdd Zero m = m
natAdd (Suc n) m = Suc (natAdd n m)

natSub :: Nat -> Nat -> Nat
natSub n Zero = n
natSub Zero _ = Zero
natSub (Suc n) (Suc m) = natSub n m

natMul :: Nat -> Nat -> Nat
natMul _ Zero = Zero
natMul Zero _ = Zero
natMul n (Suc Zero) = n
natMul (Suc Zero) m = m
natMul n m = natAdd n (natMul n (natSub m (Suc Zero)))

main :: IO ()
main = do
    print "Testes Nat:"
    print um
    print dois
    print (nat2integer um)
    print (natAdd um dois)
    print (natMul um dois)