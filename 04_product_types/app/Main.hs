module Main where

{-
data Easy = Bool | Bool Bool

twotwo :: Bool -> Bool
twotwo b = True

-- data Medium = Bool | twotwo
-}

leHead :: String -> Char
leHead s = case s of
    [] -> error "don't ask for head on an empty string"
    (x:_) -> x

leTail :: String -> String
leTail s = case s of
    [] -> error "don't chase tail of an empty string"
    (_:x) -> x

leNull :: String -> Bool
leNull s = case s of
    [] -> True
    _ -> False

leTake :: Int -> String -> String
leTake leCount leStr = case (leCount, leStr) of
    (0, _) -> []
    (_, []) -> []
    (n, s) -> leHead s : leTake (n - 1) (leTail s)

leDrop :: Int -> String -> String
leDrop leCount leStr = case (leCount, leStr) of
    (_, []) -> []
    (0, s) -> s
    (n, s) -> leDrop (n - 1) (leTail s)

main :: IO ()
main = do
    let whereIsMyHead = leHead "hello" 
    putStrLn [whereIsMyHead]

    let wagYourTail = leTail "hello"
    putStrLn wagYourTail

    let takeOnMe = leTake 4 "take on meeeee"
    putStrLn takeOnMe

    let micDrop = leDrop 4 "mic drop"
    putStrLn micDrop
