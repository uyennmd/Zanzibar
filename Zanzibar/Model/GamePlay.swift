//
//  GamePlay.swift
//  Zanzibar (iOS)
//
//  Created by Uyen Nguyen Minh Duy on 23/08/2022.
//

import Foundation
import UIKit

func RandomDice ()-> Int {
    let number = [1, 2, 3, 4, 5, 6]
    return number.randomElement()!
}

func RollDice(player: Player) -> [Int] {
    //get the player rolls dice
    var dice = [Int]()
    for _ in 0...2 {
        dice.append(RandomDice())
    }
    return dice
}

func simpleScore(player: Player, dice: [Int]) {
    var score = 0
    if (dice.contains(4) && dice.contains(5) && dice.contains(6)) {
        score = 1000
    } else if (dice[0] == 1 && dice[1] == 1 && dice[2] == 1) {
        score = 900
    } else if (dice[0] == 2 && dice[1] == 2 && dice[2] == 2) {
        score = 800
    } else if (dice[0] == 3 && dice[1] == 3 && dice[2] == 3) {
        score = 700
    } else if (dice[0] == 4 && dice[1] == 4 && dice[2] == 4) {
        score = 600
    } else if (dice[0] == 5 && dice[1] == 5 && dice[2] == 5) {
        score = 500
    } else if (dice[0] == 6 && dice[1] == 6 && dice[2] == 6) {
        score = 400
    } else if (dice.contains(1) && dice.contains(2) && dice.contains(3)) {
        score = 300
    } else {
        for num in dice {
            switch num {
            case 1:
                score += 1
            case 2:
                score += 2
            case 3:
                score += 3
            case 4:
                score += 4
            case 5:
                score += 5
            case 6:
                score += 6
            default:
                score += 0
            }
        }
    }
    player.score = score
}

func Score(player: Player, dice: [Int]) {
    var score = 0
    if (dice.contains(4) && dice.contains(5) && dice.contains(6)) {
        score = 1000
    } else if (dice[0] == 1 && dice[1] == 1 && dice[2] == 1) {
        score = 900
    } else if (dice[0] == 2 && dice[1] == 2 && dice[2] == 2) {
        score = 800
    } else if (dice[0] == 3 && dice[1] == 3 && dice[2] == 3) {
        score = 700
    } else if (dice[0] == 4 && dice[1] == 4 && dice[2] == 4) {
        score = 600
    } else if (dice[0] == 5 && dice[1] == 5 && dice[2] == 5) {
        score = 500
    } else if (dice[0] == 6 && dice[1] == 6 && dice[2] == 6) {
        score = 400
    } else if (dice.contains(1) && dice.contains(2) && dice.contains(3)) {
        score = 300
    } else {
        for num in dice {
            switch num {
            case 1:
                score += 100
            case 2:
                score += 2
            case 3:
                score += 3
            case 4:
                score += 4
            case 5:
                score += 5
            case 6:
                score += 60
            default:
                score += 0
            }
        }
    }
    player.score = score
}

func endRound (players: [Player]) -> [Player] {
    let sortPlayers = players.sorted {
        $0.score > $1.score
    }
    calcChip(players: sortPlayers)
    return sortPlayers
}

func endHardRound (players: [Player]) -> [Player] {
    let sortPlayers = players.sorted {
        $0.score > $1.score
    }
    calcChipHard(players: sortPlayers)
    return sortPlayers
}

func calcChipHard(players: [Player]){
    var chip = 0
    let length = players.count - 1
    let score = players[0].score
    var i = 0
    for player in players {
        if (player.score != score) {
            break
        }
        i += 1
    }
    if (i == length + 1) {
        
    } else {
        for i in 0...length {
            if (players[i].score == 1000) {
                chip += 4
            } else if (players[i].score == 900 && players[i].score == 800 && players[i].score == 700 && players[i].score == 600 && players[i].score == 500 && players[i].score == 400) {
                
                chip = 3
            } else if (players[i].score == 300) {
                chip = 2
            } else {
                chip = 1
            }
            players[i].chip -= chip
            if (i == length) {
                players[i].chip += (chip * 3)
            }
            
        }
    }
}

func calcChip(players: [Player]){
    var minusChip = 0
    let length = players.count - 1
    let score = players[0].score
    var i = 0
    for player in players {
        if (player.score != score) {
            break
        }
        i += 1
    }
    if (i == length + 1) {
        
    } else if (players[0].score == 1000) {
        minusChip = 4
    } else if (players[0].score == 900 && players[0].score == 800 && players[0].score == 700 && players[0].score == 600 && players[0].score == 500 && players[0].score == 400) {
        
        minusChip = 3
    } else if (players[0].score == 300) {
        minusChip = 2
    } else {
        minusChip = 1
    }
    for i in 0...length {
        players[i].chip -= minusChip
        if (i == length) {
            players[i].chip += (minusChip * 3)
        }
        
    }
}




func resetLeaderboard(lead: [String:Int], player: Leader) -> [String:Int] {
    var count = 0
    var sortLead = lead
    sortLead[player.name] = player.score
    for (name, _) in sortLead.sorted(by: {$0.value > $1.value}) {
        count += 1
        if (count == 11) {
            sortLead[name] = nil
        }
    }
    return sortLead
}
