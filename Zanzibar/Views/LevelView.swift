//
//  LevelView.swift
//  Zanzibar (iOS)
//
//  Created by Uyen Nguyen Minh Duy on 25/08/2022.
//

import SwiftUI

struct LevelView: View {
    @ObservedObject var setting: Setting
    @State var players = [Player]()
    
    var body: some View {
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
