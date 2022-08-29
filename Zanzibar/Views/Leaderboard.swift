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
                //show the name and score of leaderboard array
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
