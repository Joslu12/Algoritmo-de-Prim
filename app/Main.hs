module Main where

import Lib

-- Imprimimos la gráfica
main :: IO ()
main = print $ show encontrarArbolRecubridorMinimo

type ArbolRecubridorMinimo = [(Integer, Integer, Integer)]

-- Primero creamos una gráfica conexa, no dirigida y cuyas aristas están etiquetadas.
-- verice, vertice, peso del arista
graph = mkGraph False (1,5) 
             [(1,2,12),(1,3,34),(1,5,78),(2,4,55),
              (2,5,32),(3,4,61),(3,5,44),(4,5,93)]

-- Llamamos a la funcion prim para encontrar el árbol
encontrarArbolRecubridorMinimo :: ArbolRecubridorMinimo
encontrarArbolRecubridorMinimo = prim graph