//
//  EasyPlay.swift
//  Zanzibar (iOS)
//
//  Created by Uyen Nguyen Minh Duy on 25/08/2022.
//

import SwiftUI

struct EasyPlay: View {
    @State var players: [Player]
    var body: some View {
        ZStack{
            myColor.pink
                .opacity(0.4)
                .ignoresSafeArea(.all)
        }
    }
}

//struct EasyPlay_Previews: PreviewProvider {
//    static var previews: some View {
//        EasyPlay(players: createPlayers(numPlayer: 2, numChip: 20))
//    }
//}
