import Data.List (sortBy)
import Data.Ord (comparing)

-- Define a type alias for points to enhance readability
type Point = (Float, Float)

-- Compute squared Euclidean distance from the origin
squaredDistance :: Point -> Float
squaredDistance (x, y) = x * x + y * y

-- Returns the k closest points to the origin based on squared Euclidean distance
kClosestPointsToOrigin :: Int -> [Point] -> [Point]
kClosestPointsToOrigin k points
  | k > length points = points  -- Return all points if k exceeds the list length
  | otherwise = take k sortedByDistance
  where
    sortedByDistance = sortBy (comparing squaredDistance) points

-- Main function to demonstrate usage
main :: IO ()
main = do
  let points = [(1.0, 3.0), (3.0, 4.0), (2.0, -1.0), (5.0, 1.0), (0.0, 2.0)]
  let k = 3
  print $ kClosestPointsToOrigin k points