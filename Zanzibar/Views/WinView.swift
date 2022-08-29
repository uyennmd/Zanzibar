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

struct WinView: View {
    @State var winner: Player
    var body: some View {
        //A view show when a player reach 0 chip
        RoundedRectangle(cornerRadius: 50)
            .fill(myColor.pink.opacity(0.8))
            .scaledToFit()
            .frame(width: 350)
            .overlay(
                VStack {
                    Spacer()
                    Text("Congratulation")
                        .foregroundColor(Color.red.opacity(0.8))
                        .bold()
                        .font(Font.system(size: 50))
                    Text(winner.name)
                        .foregroundColor(Color.blue.opacity(0.8))
                        .bold()
                        .font(Font.system(size: 55))
                    Spacer()
                    Text("With Highest Score")
                        .foregroundColor(Color.purple.opacity(0.8))
                        .bold()
                        .font(Font.system(size: 30))
                    Text("\(winner.highscore)")
                        .foregroundColor(Color.blue.opacity(0.8))
                        .font(Font.system(size: 35))
                    Spacer()
                }
            )
    }
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView(winner: Player())
            .previewLayout(.sizeThatFits)
    }
}
