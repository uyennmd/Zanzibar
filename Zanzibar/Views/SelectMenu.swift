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

struct SelectMenu: View {
    @Binding var isSelected: Bool
    @State var text: String
    var body: some View {
        ZStack {
            //a button in setting view for select level og game
            Capsule()
                .frame(height: 50)
                .foregroundColor(isSelected ? myColor.pink: myColor.pink.opacity(0.6))
            Text(text)
                .foregroundColor(.white)
        }
    }
}

struct SelectMenu_Previews: PreviewProvider {
    static var previews: some View {
        SelectMenu(isSelected: .constant(false), text: "option")
    }
}
