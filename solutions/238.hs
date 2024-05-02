import Data.List (scanl', scanr)


productExceptSelf :: Num a => [a] -> [a]
productExceptSelf nums = result
    where
        forward = scanl' (*) 1 nums
        backward = scanr (*) 1 nums
        result = zipWith (*) (tail backward) (init forward)


main :: IO ()
main = do
    let nums = [1, 2, 3, 4]
    print $ productExceptSelf nums
