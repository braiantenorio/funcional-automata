module DFA where

import Data.List

data DFA = DFA {
    qs      :: [String],
    accept  :: [String]
}

deltaFromTriples :: [(s, c, s)] -> s -> c -> s
deltaFromTriples triples estado_actual coso =  fff (find (== (estado_actual,coso,_)) triples)
    where 
        fff r
        | Just _ = 
        | Maybe _ = 

--fromMaybe (-1) (find (==4) [1,2,3,4])

--evalDFA:: (s -> c -> s) -> DFA s -> [c] -> [s]



