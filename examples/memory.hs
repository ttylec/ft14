module Main where

import System.Environment
import Control.Monad
import Data.Random

inCircle :: Double -> Double -> Double
inCircle x y | x^2 + y^2 <= 1 = 1
             | otherwise = 0

point = inCircle <$> stdUniform <*> stdUniform

areaMC :: [Bool] -> Double
areaMC ps = let l = fromIntegral . length
            in l (filter id ps) / l ps

areaMC' :: [Double] -> Double
areaMC' ps = sum ps

-- piMC :: Int -> IO Double
-- piMC n = (*4) . areaMC' <$> sample (replicateM n point)

piMC :: Int -> IO Double
piMC n = (*4) . areaMC' <$> sample (replicateM n point)

piMC' :: Int -> RVar Double
piMC' n = (*4) . areaMC' <$> replicateM n point

main = do
  (ns:_) <- getArgs
  let n = read ns :: Int
  p <- piMC n
  -- p <- sample $ piMC' n
  print p
