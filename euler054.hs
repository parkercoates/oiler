{-# LANGUAGE TupleSections #-}

import Data.Function (on)
import Data.List (sortBy)
import qualified Data.Map as M
import Data.Tuple (swap)


data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace
   deriving (Enum, Eq, Ord)


data Suit = Clubs | Diamonds | Hearts | Spades
   deriving (Eq)


data Card = Card Rank Suit

getRank (Card r _) = r
getSuit (Card _ s) = s


data HandType = HighCard | OnePair | TwoPair | ThreeOfAKind | Straight | Flush | FullHouse | FourOfAKind | StraightFlush
   deriving (Eq, Ord)


data Hand = Hand HandType [Rank]
   deriving (Eq, Ord)


cardFromString [r, s] = Card (rankFromChar r) (suitFromChar s)
   where rankFromChar '2' = Two
         rankFromChar '3' = Three
         rankFromChar '4' = Four
         rankFromChar '5' = Five
         rankFromChar '6' = Six
         rankFromChar '7' = Seven
         rankFromChar '8' = Eight
         rankFromChar '9' = Nine
         rankFromChar 'T' = Ten
         rankFromChar 'J' = Jack
         rankFromChar 'Q' = Queen
         rankFromChar 'K' = King
         rankFromChar 'A' = Ace
         suitFromChar 'C' = Clubs
         suitFromChar 'D' = Diamonds
         suitFromChar 'H' = Hearts
         suitFromChar 'S' = Spades

handsFromLine = mapTuple2 handFromCards . splitAt 5 . map cardFromString . words
   where mapTuple2 f (a, b) = (f a, f b)


handFromCards cards = Hand handType ranks
   where handType = determineHandType (isFlush cards) (isStraight ranks) rcs
         ranks = concatMap (uncurry . flip $ replicate) rcs
         rcs = sortBy (flip compare `on` swap) . rankCounts $ cards

         rankCounts = M.toList . M.fromListWith (+) . map ((,1) . getRank)

         isFlush (c:cs) = all ((getSuit c ==) . getSuit) cs

         isStraight ranks = and $ zipWith precedes (tail ranks) ranks
            where precedes Ace _ = False
                  precedes x   y = succ x == y

         determineHandType True True _               = StraightFlush
         determineHandType _    _    ((_,4):_)       = FourOfAKind
         determineHandType _    _    ((_,3):(_,2):_) = FullHouse
         determineHandType True _    _               = Flush
         determineHandType _    True _               = Straight
         determineHandType _    _    ((_,3):_)       = ThreeOfAKind
         determineHandType _    _    ((_,2):(_,2):_) = TwoPair
         determineHandType _    _    ((_,2):_)       = OnePair
         determineHandType _    _    _               = HighCard


main = do handData <- readFile "euler054.data"
          print . length . filter (uncurry (>) . handsFromLine) . lines $ handData
