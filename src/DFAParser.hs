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
parseDelta s = map (toTriplas . words) transiciones
  where
    (_, transiciones, _) = parts s
    -- transiciones = map words transiciones_lineas
    toTriplas [estado_act, sim, estado_sig] = (estado_act, sim, estado_sig)

parseExec :: String -> [String]
parseExec s = exec
  where
    (_, _, exec) = parts s

parseDFA :: String -> String -> DFA
parseDFA estados aceptadores = DFA {qs = words estados, accept = words aceptadores}

example =
  "player1 player2 dealer end\n\
  \end\n\
  \player1 Hit player1\n\
  \player1 Stand player2\n\
  \player2 Hit player2\n\
  \player2 Stand dealer\n\
  \dealer Hit dealer\n\
  \dealer Stand end\n\
  \end Hit end\n\
  \end Stand end\n\
  \#\n\
  \Stand\n\
  \Hit\n\
  \Hit\n\
  \Stand\n\
  \Hit\n\
  \Stand"

example_qs = "player1 player2 dealer end"

example_accept = "end"
