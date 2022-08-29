//
//  Leaderboard.swift
//  Zanzibar
//
//  Created by Uyen Nguyen Minh Duy on 28/08/2022.
//

import SwiftUI

struct Leaderboard: View {
    @State var leaderboard : [String:Int]
    var body: some View {
        ZStack {
            myColor.blue
                .ignoresSafeArea(.all)
            VStack {
                Text("Leaderboard")
                    .foregroundColor(Color.red)
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                Spacer()
                ForEach(leaderboard.sorted(by: {$0.value > $1.value}), id: \.key) { key, value in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(myColor.pink)
                        .frame(width: 300, height: 50.0)
                        .overlay(
                            HStack {
                                Section(header: Text(key)) {
                                    Spacer()
                                    Text("\(value)")
                                }
                            }.padding(10)
                        )
                }
            }
        }
    }
}
//
struct Leaderboard_Previews: PreviewProvider {
    static var previews: some View {
        Leaderboard(leaderboard: ["Player" : 10])
    }
}
