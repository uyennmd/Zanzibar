//
//  MenuView.swift
//  Zanzibar (iOS)
//
//  Created by Uyen Nguyen Minh Duy on 25/08/2022.
//

import SwiftUI

struct MenuView: View {
    @StateObject var setting = Setting()
    @State var leaderboard : [[String:String]] = UserDefaults.standard.object(forKey: "Leader") as? [[String:String]] ?? [[ : ]]
    @StateObject var leader = Leader()
    @State private var showingMyHighScore = false
    @State var active = false
    var body: some View {
        NavigationView {
            ZStack {
                myColor.pink
                    .opacity(0.4)
                    .ignoresSafeArea(.all)
                VStack{
                    Image("zanzibar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                        .onAppear(perform:{playSound(sound: "blink", type: "mp3")})
                    Spacer()
                    NavigationLink {
                        LevelView(setting: setting)
                    } label: {
                        ButtonView()
                            .overlay(Text("Play")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.blue.opacity(0.7)))
                    }
                    NavigationLink {
                        SettingView(setting: setting)
                    } label: {
                        ButtonView()                            .overlay(Text("Setting")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.blue.opacity(0.7)))
                    }
                    Button {
                        leaderboard = resetLeaderboard(lead: leaderboard, player: leader)
                        UserDefaults.standard.set(leaderboard, forKey: "Leader")
                        showingMyHighScore.toggle()
                        playSound(sound: "highscore", type: "mp3")
                    } label: {
                        ButtonView()
                            .overlay(Text("Leaderboard")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.blue.opacity(0.7)))
                            
                    }.sheet(isPresented: $showingMyHighScore) {
                        Leaderboard(leaderboard: leaderboard)
                    }
                    NavigationLink {
                        HowToPlay()
                    } label: {
                        ButtonView()
                            .overlay(Text("How to Play")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.blue.opacity(0.7)))
                    }
                    Spacer()
                }
                
            }
        }.environmentObject(leader)
        
    }
}
//
//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}
