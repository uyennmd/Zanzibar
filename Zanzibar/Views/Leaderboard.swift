//
//  Leaderboard.swift
//  Zanzibar
//
//  Created by Uyen Nguyen Minh Duy on 28/08/2022.
//

import SwiftUI

struct Leaderboard: View {
    @EnvironmentObject var leader : Leader
    var body: some View {
        VStack {
//            ForEach(leader, id: \.self) {
//                Text($leader.name)
//            }
        }
    }
}

struct Leaderboard_Previews: PreviewProvider {
    static var previews: some View {
        Leaderboard()
    }
}
