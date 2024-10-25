module Main where

  import System.IO
  import DFA
  import DFAParser

  main :: IO ()
  main = do
    -- Deshabilita el buffer de la entrada/salida.
    hSetBuffering stdout NoBuffering
    hSetBuffering stdin NoBuffering

    -- Obtiene de forma lazy toda la entrada.
    input <- getContents

    -- Define los parámetros del DFA
    let (dfap,transiciones,_) = parts input
        dfa = parseDFA (head dfap) (last dfap) (parseDelta input)
        --delta = deltaFromTriples $ parseDelta input
        exec = parseExec input

    -- Ejecuta el DFA e imprime cada uno de los elementos en una línea diferente.
    mapM_ putStrLn $ procesar dfa exec
