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
                    Image("zanzibar") //the logo image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                        .onAppear(perform:{playSound(sound: "blink", type: "mp3")})
                    Spacer()
                    NavigationLink {//button to play view
                        LevelView(setting: setting)
                    } label: {
                        ButtonView()
                            .overlay(Text("Play")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.blue.opacity(0.7)))
                    }
                    NavigationLink { //button to setting for changing setting
                        SettingView(setting: setting)
                    } label: {
                        ButtonView()                            
                            .overlay(Text("Setting")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.blue.opacity(0.7)))
                    }
                    Button { // button to reset leaderboard and open the leaderboard sheet
                        leaderboard = resetLeaderboard(lead: leaderboard, player: leader)
                        UserDefaults.standard.set(leaderboard, forKey: "Leader")
                        showingMyHighScore.toggle()
                        playSound(sound: "highscore", type: "mp3")//play sound when open
                    } label: {
                        ButtonView()
                            .overlay(Text("Leaderboard")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.blue.opacity(0.7)))
                            
                    }.sheet(isPresented: $showingMyHighScore) {
                        Leaderboard(leaderboard: leaderboard)
                    }
                    NavigationLink {//button to tutorial plage
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
