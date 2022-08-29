//
//  File.swift
//  Zanzibar (iOS)
//
//  Created by Uyen Nguyen Minh Duy on 23/08/2022.
//

import Foundation

let defaults = UserDefaults.standard

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
    @Published var leader = [Player]()
}
