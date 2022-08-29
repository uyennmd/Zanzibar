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

struct LevelView: View {
    @ObservedObject var setting: Setting
    @State var players = [Player]()
    
    var body: some View {
        //View to redirect to correct view in setting 
        if (setting.level == "easy") {
            EasyPlay(players: createPlayers(numPlayer: setting.player, numChip: setting.chip))
        } else if (setting.level == "normal") {
            NormalPlay(players: createPlayers(numPlayer: setting.player, numChip: setting.chip))
        } else if (setting.level == "hard") {
            HardPlay(players: createPlayers(numPlayer: setting.player, numChip: setting.chip))
        }
    }
}

//struct LevelView_Previews: PreviewProvider {
//    static var previews: some View {
//        LevelView(setting: .constant(Setting(player: 2, chip: 20, level: "normal")))
//    }
//}
