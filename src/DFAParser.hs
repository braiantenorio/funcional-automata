module DFAParser where

import DFA

parts :: String -> ([String], [String], [String])
parts s = (dfa, transiciones, ejecucion)
  where
    lineas = lines s
    (definicion, eje_input) = break (== "#") lineas
    dfa = take 2 definicion
    transiciones = drop 2 definicion
    ejecucion = tail eje_input

parseDelta :: String -> [(String, String, String)]
parseDelta s = map toTriplas transiciones
  where
    (_, transiciones_lineas, _) = parts s
    transiciones = map words transiciones_lineas
    toTriplas [estado_actual, simbolo, estado_siguiente] = (estado_actual, simbolo, estado_siguiente)

parseExec :: String -> [String]
parseExec s = exec
  where
    (_, _, exec) = parts s
    
{-
parseDFA :: String -> DFA String
parseDFA s = DFA qs delta accept
  where
    (dfa, _, _) = parts s
    qs = words (head dfa)         
    accept = words (dfa !! 1)   
    --delta = parseDelta s 
-}