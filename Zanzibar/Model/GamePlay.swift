/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Minh Duy Uyen
  ID: s3819342
  Created  date: 23/08/2022
  Last modified: 29/08/2022
  Acknowledgement: Acknowledge the resources that you use here. 
*/

import Foundation
import UIKit

//Function for random the number of dice face
func RandomDice ()-> Int {
    let number = [1, 2, 3, 4, 5, 6]
    return number.randomElement()!
}

//Function to create an array of 3 dice in a roll
func RollDice(player: Player) -> [Int] {
    //get the player rolls dice
    var dice = [Int]()
    for _ in 0...2 {
        dice.append(RandomDice())
    }
    return dice
}


//Function to calculate score in easy mode 
func simpleScore(player: Player, dice: [Int]) {
    var score = 0
    if (dice.contains(4) && dice.contains(5) && dice.contains(6)) {
        score = 14
    } else if (dice[0] == 1 && dice[1] == 1 && dice[2] == 1) {
        score = 13
    } else if (dice[0] == 2 && dice[1] == 2 && dice[2] == 2) {
        score = 12
    } else if (dice[0] == 3 && dice[1] == 3 && dice[2] == 3) {
        score = 11
    } else if (dice[0] == 4 && dice[1] == 4 && dice[2] == 4) {
        score = 10
    } else if (dice[0] == 5 && dice[1] == 5 && dice[2] == 5) {
        score = 9
    } else if (dice[0] == 6 && dice[1] == 6 && dice[2] == 6) {
        score = 8
    } else if (dice.contains(1) && dice.contains(2) && dice.contains(3)) {
        score = 7
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

//Function to calculate score in normal and hard mode
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

//function to sort the array of all players in descending order of score 
func endNormalRound (players: [Player]) -> [Player] {
    let sortPlayers = players.sorted {
        $0.score > $1.score
    }
    calcChipNormal(players: sortPlayers)
    return sortPlayers
}
//function to sort the array of all players in descending order of score 
func endEasyRound (players: [Player]) -> [Player] {
    let sortPlayers = players.sorted {
        $0.score > $1.score
    }
    calcChipEasy(players: sortPlayers)
    return sortPlayers
}
//function to sort the array of all players in descending order of score 
func endHardRound (players: [Player]) -> [Player] {
    let sortPlayers = players.sorted {
        $0.score > $1.score
    }
    calcChipHard(players: sortPlayers)
    return sortPlayers
}

//function to  calculate chip in hard mode
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
                players[i].chip -= 4
            } else if (players[i].score == 900 && players[i].score == 800 && players[i].score == 700 && players[i].score == 600 && players[i].score == 500 && players[i].score == 400) {
                players[i].chip -= 3
                chip += 3
            } else if (players[i].score == 300) {
                chip += 2
                players[i].chip -= 2
            } else {
                chip += 1
                players[i].chip -= 1
            }
            
            if (i == length) {
                players[i].chip += chip
            }
            
        }
    }
}

//function to calculate chip in normal mode
func calcChipNormal(players: [Player]){
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
//function to calculate chip in easy mode
func calcChipEasy(players: [Player]){
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
        
    } else if (players[0].score == 14) {
        minusChip = 4
    } else if (players[0].score == 13 && players[0].score == 12 && players[0].score == 11 && players[0].score == 10 && players[0].score == 9 && players[0].score == 8) {
        
        minusChip = 3
    } else if (players[0].score == 7) {
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

//function to reset the leaderboard
func resetLeaderboard(lead: [[String:String]], player: Leader) -> [[String:String]] {
    
    var sortLead = lead
    if (player.score != 0) {
        sortLead.append(["name" : player.name, "score" : String(player.score)])
        sortLead = sortLead.sorted{
            guard let s1 = $0["score"], let s2 = $1["score"] else {
              return false
            }
            return s1 > s2
          }
        if (lead.count == 11) {
            sortLead.remove(at: 10)
        }
    }
    return sortLead
}


