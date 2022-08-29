//
//  Leaderboard.swift
//  Zanzibar
//
//  Created by Uyen Nguyen Minh Duy on 28/08/2022.
//

import SwiftUI

struct Leaderboard: View {
    @State var leaderboard : [[String:String]]
    var body: some View {
        ZStack {
            myColor.blue
                .ignoresSafeArea(.all)
            VStack {
                Text("Leaderboard")
                    .foregroundColor(Color.red)
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                ForEach(leaderboard, id: \.self) { leader in
                    if ((leader["name"]) != nil) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(myColor.pink)
                        .frame(width: 300, height: 50.0)
                        .overlay(
                            HStack {
                                Text(leader["name"]!)
                                Spacer()
                                Text(leader["score"]!)
                            }.padding(10)
                        )
                    }
                }
                Spacer()
            }
        }
    }
}
//
struct Leaderboard_Previews: PreviewProvider {
    static var previews: some View {
        Leaderboard(leaderboard: [["name" : "Player", "score": "10"]])
    }
}
