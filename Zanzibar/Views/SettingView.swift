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

struct SettingView: View {
    @ObservedObject var setting: Setting
    @State private var isNormal = false
    @State private var isHard = false
    @State private var isEasy = false
    @State private var normal = true
    @State private var hard = true
    @State private var easy = true
    let numPlayer = [2, 3, 4, 5, 6]
    let numChip = [1, 2, 3, 4, 5, 10, 20]
    var body: some View {
        ZStack {
            myColor.pink
                .opacity(0.4)
                .ignoresSafeArea(.all)
                .onAppear(perform: {
                    playSound(sound: "bet-chip", type: "mp3") //play sound when view appear
                })
            VStack {
                Spacer()
                HStack{
                    Text("Number of Player:")
                    VStack {
                        //create a menu pf number of player for user to choose
                        Picker("Select number of player:", selection: $setting.player) {
                            ForEach(numPlayer, id: \.self) {
                                Text("\($0)")
                                    .foregroundColor(Color.red)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                }
                Text("Level:")
                //create a selective button to choose which level of game. when a level is chosen, another one will be unselected
                if (setting.level == "easy") {
                    HStack {
                        SelectMenu(isSelected: $easy, text: "Easy")
                            .onTapGesture {
                                isEasy.toggle()
                                if isEasy {
                                    setting.level = "easy"
                                    isHard = false
                                    isNormal = false
                                    easy = isEasy
                                    normal = isNormal
                                    hard = isHard
                                }
                            }
                        SelectMenu(isSelected: $isNormal, text: "Normal")
                            .onTapGesture {
                                isNormal.toggle()
                                if isNormal {
                                    setting.level = "normal"
                                    isHard = false
                                    isEasy = false
                                    easy = isEasy
                                    normal = isNormal
                                    hard = isHard
                                }
                            }
                        SelectMenu(isSelected: $isHard, text: "Hard")
                            .onTapGesture {
                                isHard.toggle()
                                if isHard {
                                    setting.level = "hard"
                                    isEasy = false
                                    isNormal = false
                                    easy = isEasy
                                    normal = isNormal
                                    hard = isHard
                                }
                            }
                    }.padding(10)
                } else if (setting.level == "normal") {
                    HStack {
                        SelectMenu(isSelected: $isEasy, text: "Easy")
                            .onTapGesture {
                                isEasy.toggle()
                                if isEasy {
                                    setting.level = "easy"
                                    isHard = false
                                    isNormal = false
                                    easy = isEasy
                                    normal = isNormal
                                    hard = isHard
                                }
                            }
                        SelectMenu(isSelected: $normal, text: "Normal")
                            .onTapGesture {
                                normal.toggle()
                                isNormal.toggle()
                                if isNormal {
                                    normal = true
                                    setting.level = "normal"
                                    isHard = false
                                    isEasy = false
                                    easy = isEasy
                                    normal = isNormal
                                    hard = isHard
                                }
                            }
                        SelectMenu(isSelected: $isHard, text: "Hard")
                            .onTapGesture {
                                hard.toggle()
                                isHard.toggle()
                                if isHard {
                                    hard = true
                                    setting.level = "hard"
                                    isEasy = false
                                    isNormal = false
                                    easy = isEasy
                                    normal = isNormal
                                    hard = isHard
                                }
                            }
                    }.padding(10)
                } else if (setting.level == "hard") {
                    HStack {
                        SelectMenu(isSelected: $isEasy, text: "Easy")
                            .onTapGesture {
                                isEasy.toggle()
                                if isEasy {
                                    setting.level = "easy"
                                    isHard = false
                                    isNormal = false
                                    easy = isEasy
                                    normal = isNormal
                                    hard = isHard
                                }
                            }
                        SelectMenu(isSelected: $isNormal, text: "Normal")
                            .onTapGesture {
                                isNormal.toggle()
                                if isNormal {
                                    setting.level = "normal"
                                    isHard = false
                                    isEasy = false
                                    easy = isEasy
                                    normal = isNormal
                                    hard = isHard
                                }
                            }
                        SelectMenu(isSelected: $hard, text: "Hard")
                            .onTapGesture {
                                isHard.toggle()
                                if isHard {
                                    setting.level = "hard"
                                    isEasy = false
                                    isNormal = false
                                    easy = isEasy
                                    normal = isNormal
                                    hard = isHard
                                }
                            }
                    }.padding(10)
                }
                HStack{
                    Text("Number of Chip:")
                    VStack {//create a menu pf number of chip for user to choose
                        Picker("Select number of chip:", selection: $setting.chip) {
                            ForEach(numChip, id: \.self) {
                                Text("\($0)")
                                    .foregroundColor(Color.red)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                }
                
                Spacer()
                
                
            }
            
        }
    }
}

//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingView(setting: .constant(Setting(player: 2, chip: 20, level: "normal")), level: .constant("normal"))
//    }
//}
