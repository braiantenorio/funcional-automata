module DFA where

data DFA s = DFA {
    qs      :: [s],
    delta   :: s -> s -> s,
    accept  :: [s]
}

--deltaFromTriples :: [(s, c, s)] -> s -> c -> s
--deltaFromTriples triples =





--evalDFA:: (s -> c -> s) -> DFA s -> [c] -> [s]