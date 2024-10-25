module DFA where

import Data.List
import Data.Maybe

data DFA = DFA { 
    qs :: [String],
    accept :: [String],
    transiciones :: [(String,String,String)]
  }

deltaFromTriples :: (Eq c, Eq s) => [(s, c, s)] -> s -> c -> s
deltaFromTriples triples estado_actual coso =
  case find (\(inicial, c', final) -> inicial == estado_actual && c' == coso) triples of
    Just (_, _, toState) -> toState
    Nothing -> estado_actual

-- fromMaybe (-1) (find (==4) [1,2,3,4])

-- evalDFA:: (s -> c -> s) -> DFA s -> [c] -> [s]

procesar :: DFA -> [String] -> [String]
procesar dfa syms = scanl delta q0 syms
  where 
    delta = deltaFromTriples (transiciones dfa)
    q0 = head (qs dfa)