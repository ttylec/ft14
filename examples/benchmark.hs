module Main where

import Criterion.Main

import Control.Monad
import Data.IORef
import Data.Random
import Data.Random.Distribution.Uniform
import Data.Vector (Vector, fromList)
import System.Random.MWC (GenIO, uniformVector, createSystemRandom, create)
import qualified System.Random.MWC as MWC
import Statistics.Sample (mean)

import Data.Random.Source.PureMT (newPureMT)
import Data.Random.Source.DevRandom



k = 10000

randomListFu :: RVar (Vector Double)
randomListFu = fromList <$> replicateM k stdUniform

randomListMWC :: GenIO -> IO (Vector Double)
randomListMWC gen = fromList <$> replicateM k (MWC.uniform gen)

main :: IO ()
main = do
  mwc <- createSystemRandom
  puremt <- newPureMT >>= newIORef

  defaultMain
    [ bgroup "MWC vs randomu-fu abstraction"
      [ bench "random-fu"
        $ nfIO (mean <$> sampleFrom mwc randomListFu)
      , bench "mw'"
        $ nfIO (mean <$> randomListMWC mwc)
      ]
    , bgroup "Different sources"
      [ bench "pureMT"
        $ nfIO (mean <$> sampleFrom puremt randomListFu)
      , bench "std"
        $ nfIO (mean <$> sample randomListFu)
      , bench "urandom"
        $ nfIO (mean <$> sampleFrom DevURandom randomListFu)
      ]
    ]
