//
//  NormalPlay.swift
//  Zanzibar (iOS)
//
//  Created by Uyen Nguyen Minh Duy on 25/08/2022.
//

import SwiftUI

struct NormalPlay: View {
    @Binding var setting: Setting
    @State var players: [Player]
    @State var leader = createPlayers(numPlayer: 10, numChip: 20)
    @State var roll = Array(repeating: 1, count: 3)
    @State var play = 0
    @State var disableRoll = false
    @State var disableConfirm = false
    @State var changeView = false
    
    var body: some View {
        ZStack {
            myColor.pink
                .opacity(0.4)
                .ignoresSafeArea(.all)
            VStack {
                ForEach($players) { player in
                    PlayerRow(player: player)
                }
                Spacer()
                HStack{
                    Spacer()
                    ForEach(0...roll.count-1, id: \.self) {dice in
                        Image("\(roll[dice])")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Spacer()
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
                        disableRoll = true
                    }
                } label: {
                    Text("Roll")
                } .disabled(disableRoll)

                Spacer()
//                Text(resetLeaderboard(lead:leader,player:players[0])[0].name)
                Button {
                    if (play < players.count) {
                        disableRoll = false
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
    
}

//struct NormalPlay_Previews: PreviewProvider {
//    static var previews: some View {
//        NormalPlay(setting: .constant(Setting(player: 2, chip: 20, level: "easy")))
//    }
//}
