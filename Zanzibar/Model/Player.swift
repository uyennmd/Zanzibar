//
//  File.swift
//  Zanzibar (iOS)
//
//  Created by Uyen Nguyen Minh Duy on 23/08/2022.
//

import Foundation



class Player:Identifiable {
    var name = "Player"
    var score = 0
    var roll = 0
    var chip = 0

    func Player(name: String, chip: Int) {
        self.name = name
        self.score = 0
        self.roll = 0
        self.chip = chip
    }
    
}

class Setting {
    var player:Int
    var chip:Int
    var level:String
    
    init(player:Int,chip:Int,level:String){
        self.player = player
        self.chip = chip
        self.level = level
    }
}
extension Array {
    public init(count: Int, elementCreator: @autoclosure () -> Element) {
        self = (0 ..< count).map { _ in elementCreator() }
    }
}

func createPlayers(numPlayer: Int, numChip: Int) -> [Player] {
    
    var players = [Player]()
    
    for i in 0...(numPlayer - 1) {
        players.append(Player())
        players[i].name = "Player \(i+1)"
        players[i].chip = numChip
    }
    return players
}
