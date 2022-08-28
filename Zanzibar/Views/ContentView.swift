//
//  ContentView.swift
//  Shared
//
//  Created by Uyen Nguyen Minh Duy on 23/08/2022.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State var setting:Setting
    var players = createPlayers(numPlayer: 2, numChip: 0)
    @State var leader = createPlayers(numPlayer: 2, numChip: 0)

    init() {
        let localSetting = Setting(player: 6, chip:20, level:"normal")
        self.setting = localSetting
        players = createPlayers(numPlayer: localSetting.player, numChip: localSetting.chip)
        leader = createPlayers(numPlayer: localSetting.player, numChip: localSetting.chip)
    }
    @State var roll = Array(repeating: 0, count: 3)
    @State var play = 0
    @State var disable = false
    @State var disableConfirm = false
    @State var changeView = false
    
    var body: some View {
        
        VStack {
            Spacer()
            ForEach(players) { player in
                Text(player.name)
//                Text("\(player.chip)")
                Text("\(player.score)")
                
            }
            Text("\(players.count)")
            Spacer()
            HStack{
                ForEach(0...roll.count-1, id: \.self) {dice in
                    Text("\(roll[dice])")
                }
            }
            Button {
                if (play == 0 && players[0].roll < 3) {
                    roll = RollDice(player: players[play])
                    Score(player: players[play], dice: roll)
                    players[play].roll += 1
                } else if (play != 0 && players[play].roll < players[0].roll) {
                    roll = RollDice(player: players[play])
                    Score(player: players[play], dice: roll)
                    players[play].roll += 1
                }
                if ((play != 0 && players[play].roll == players[0].roll) || (play == 0 && players[play].roll == 3)) {
                    disable = true
                }
                if (disableConfirm && play == (players.count-1)) {
                    leader = endRound(players: players)
                }
            } label: {
                Text("Roll")
            } .disabled(disable)

            Spacer()
            Text(leader[0].name)
            Button {
                if (play < players.count) {
                    disable = false
                    play += 1
                }
                if (play == (players.count - 1)) {
                    disableConfirm = true
                }
                
            } label: {
                Text("Confirm")
            }.disabled(disableConfirm)
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
