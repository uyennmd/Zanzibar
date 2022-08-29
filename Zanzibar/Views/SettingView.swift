//
//  SettingView.swift
//  Zanzibar
//
//  Created by Uyen Nguyen Minh Duy on 23/08/2022.
//

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
    let numChip = [20, 40]
    var body: some View {
        ZStack {
            myColor.pink
                .opacity(0.4)
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                HStack{
                    Text("Number of Player:")
                    VStack {
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
                    VStack {
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
