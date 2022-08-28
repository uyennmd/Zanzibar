//
//  PlayerRow.swift
//  Zanzibar (iOS)
//
//  Created by Uyen Nguyen Minh Duy on 28/08/2022.
//

import SwiftUI

struct PlayerRow: View {
    @Binding var player: Player
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(myColor.blue)
            .frame(height: 50.0)
            .overlay(
                HStack {
                    Text("\(player.name)")
                    Spacer()
                    Text("\(player.score)")
                    Spacer()
                    Text("\(player.chip)")
                    
                }.padding(10)
                
            )
            .padding(10)
    }
}

struct PlayerRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRow(player: .constant(Player()))
            .previewLayout(.sizeThatFits)
    }
}
