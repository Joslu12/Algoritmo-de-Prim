module Lib where

import Data.List
import Data.Array
 
makeGraph direction vertices es =
    accumArray (\xs x -> x:xs) [] vertices
               ([(x1,(x2,w)) | (x1,x2,w) <- es] ++
               if direction then []
               else [(x2,(x1,w)) | (x1,x2,w) <- es, x1 /= x2])

prim g = prim' [n] ns []
    where (n:ns) = nodes g
          es = edgesU g
          prim' t [] mst = mst
          prim' t r mst = let e@(c,u',v') = minimum
                                             [(c,u,v) | (u,v,c) <- es, 
                                                         u `elem` t, 
                                                         v `elem` r]
                          in  prim' (v':t) (delete v' r) (e:mst)
 
edgesU g = [(v1,v2,w) | v1 <- nodes g, (v2,w) <- g!v1, v1 < v2]
nodes g = indices g