//
//  File.swift
//  Zanzibar (iOS)
//
//  Created by Uyen Nguyen Minh Duy on 23/08/2022.
//

import Foundation

let zanzibar = """
The first player may roll the dice up to three times in an attempt to get as high a score as possible.
(See How do you score? below.) They may stop rolling after the first or second roll if they wish.

The other players, in turn, then try to roll a higher score in the same number or fewer rolls than the first player.

Once all players have had a turn, the player with the lowest score receives a number of chips from the other players.
The number of chips they receive depends on the hand of the player who rolled the highest score. The loser receives:

    - 1 chip if the highest score is a points total
    - 2 chips if the highest score is 1,2,3
    - 3 chips if the highest score is three-of-a-kind
    - 4 chips if the highest score is 4,5,6 (Zanzibar)
The winner of the previous round rolls first in the next round.

Players continue playing rounds until one player has no chips remaining.
"""

let rule = """
The highest ranking combinations are shown in descending order:

    - 4,5,6 - Zanzibar
    - 1,1,1
    - 2,2,2
    - 3,3,3
    - 4,4,4
    - 5,5,5
    - 6,6,6
    - 1,2,3
All other combinations rank as a sum of the three dice added together:

    - 1 = 100 points
    - 6 = 60 points
    - 2 = 2 points
    - 3 = 3 points
    - 4 = 4 points
    - 5 = 5 points

"""

let simple = """
This variant is the same as regular Zanzibar except the sum of combinations are only their face value.
Ones and sixes are only worth 1 point and 6 points respectively instead of 100 points and 60 points.
"""

let hard = """
This variant is the same as regular Zanzibar except the losing player receives a number of chips from each other player based on each player's score instead of just the winner's score. In the Round Example above, Player 4 would receive three chips from Player 1 (for having a three-of-a-kind), two chips from Player 2, four chips from Player 3, and one chip from Player 5.
"""


class Player:Identifiable {
    var name = "Player"
    var score = 0
    var roll = 0
    var chip = 0
    var highscore = 0

    func Player(name: String, chip: Int) {
        self.name = name
        self.score = 0
        self.roll = 0
        self.chip = chip
    }
    
}

class Setting: ObservableObject {
    @Published var player = 2
    @Published var chip = 20
    @Published var level = "normal"
}
//extension Array {
//    public init(count: Int, elementCreator: @autoclosure () -> Element) {
//        self = (0 ..< count).map { _ in elementCreator() }
//    }
//}

func createPlayers(numPlayer: Int, numChip: Int) -> [Player] {
    
    var players = [Player]()
    
    for i in 0...(numPlayer - 1) {
        players.append(Player())
        players[i].name = "Player \(i+1)"
        players[i].chip = numChip
    }
    return players
}

class Leader: ObservableObject {
    @Published var name = "Player"
    @Published var score = 0
}
