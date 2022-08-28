//
//  HardPlay.swift
//  Zanzibar (iOS)
//
//  Created by Uyen Nguyen Minh Duy on 25/08/2022.
//

import SwiftUI

struct HardPlay: View {
    @Binding var setting: Setting
    @Binding var players: [Player]
    var body: some View {
        Image("1")
    }
}

struct HardPlay_Previews: PreviewProvider {
    static var previews: some View {
        HardPlay(setting: .constant(Setting(player: 2, chip: 20, level: "easy")), players: .constant(createPlayers(numPlayer: 2, numChip: 20)))
    }
}
