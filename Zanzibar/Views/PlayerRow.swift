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

struct PlayerRow: View {
    @Binding var player: Player
    var body: some View {
        //create a row showing name, score, and number of chips player has
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
