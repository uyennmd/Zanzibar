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

import SwiftUI

struct EasyPlay: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var players: [Player]
    @EnvironmentObject var leader : Leader
    @State var roll = Array(repeating: 1, count: 3)
    @State var play = 0
    @State var rollCount = 0
    @State var disableRoll = false
    @State var disableConfirm = true
    @State var endGame = false
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
                VStack {
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
                        rollCount += 1
                        if (rollCount == 1) {
                            disableConfirm = false
                        }
                        if (play == 0 && players[0].roll < 3) {
                            roll = RollDice(player: players[play])
                            simpleScore(player: players[play], dice: roll)
                            players[play].roll += 1
                        } else if (play != 0 && players[play].roll < players[0].roll) {
                            roll = RollDice(player: players[play])
                            simpleScore(player: players[play], dice: roll)
                            players[play].roll += 1
                        }
                        if ((play != 0 && players[play].roll == players[0].roll) || (play == 0 && players[play].roll == 3)) {
                            disableRoll = true
                            rollCount = 0
                            if (play == (players.count - 1)) {
                                players[play].highscore += players[play].score
                                disableConfirm = true
                            }
                        }
                        
                        
                    } label: {
                        ButtonView()
                            .overlay(Text("Roll")
                                .font(.system(size: 30, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(myColor.blue)
                            )
                    } .disabled(disableRoll)
                        .blur(radius: disableRoll ? 30: 0)


                    Spacer()
                    Button {
                        players[play].highscore += players[play].score
                        if (play < players.count) {
                            disableRoll = false
                            play += 1
                        }
                        if (play == (players.count)) {
                            disableConfirm = true
                            disableRoll = true
                            rollCount = 0
                        }
                        
                    } label: {
                        ButtonView()
                            .overlay(Text("Next Player")
                                .font(.system(size: 25, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(myColor.blue)
                            )
                    }.disabled(disableConfirm)
                        .blur(radius: disableConfirm ? 30: 0)
                }.blur(radius: (disableConfirm && disableRoll) ? 30: 0)
                
            }
            if (disableConfirm && disableRoll) {
                Button {
                    players = endEasyRound(players: players)
                    play = 0
                    for player in players {
                        player.roll = 0
                        if (player.chip <= 0) {
                            endGame = true
                        }
                        disableRoll = false
                        disableConfirm = true
                    }
                } label: {
                    ButtonView()
                        .overlay(Text("Next Round")
                            .font(.system(size: 25, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(myColor.blue)
                        )
                }
            }
            if (endGame) {
                ZStack {
                    myColor.blue
                        .ignoresSafeArea(.all)
                    VStack {
                        Spacer()
                        WinView(winner: players[0])
                            .padding(10)
                        Spacer()
                        Button {
                            leader.name = players[0].name
                            leader.score = players[0].highscore
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Capsule()
                                .fill(myColor.pink)
                                .padding(8)
                                .frame(width: 230, height:80)
                                .overlay(Text("Save Result")
                                    .font(.system(size: 25, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                )
                        }
                    }
                }
            }
            
        }
    }
}

//struct EasyPlay_Previews: PreviewProvider {
//    static var previews: some View {
//        EasyPlay(players: createPlayers(numPlayer: 2, numChip: 20))
//    }
//}
