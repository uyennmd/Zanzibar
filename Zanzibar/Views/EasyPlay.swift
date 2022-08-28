//
//  EasyPlay.swift
//  Zanzibar (iOS)
//
//  Created by Uyen Nguyen Minh Duy on 25/08/2022.
//

import SwiftUI

struct EasyPlay: View {
    @Binding var setting: Setting
    @Binding var players: [Player]
    var body: some View {
        ZStack{
            myColor.pink
                .opacity(0.4)
                .ignoresSafeArea(.all)
        }
    }
}

struct EasyPlay_Previews: PreviewProvider {
    static var previews: some View {
        EasyPlay(setting: .constant(Setting(player: 2, chip: 20, level: "easy")), players: .constant(createPlayers(numPlayer: 2, numChip: 20)))
    }
}
