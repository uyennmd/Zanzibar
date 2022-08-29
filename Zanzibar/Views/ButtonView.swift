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

struct ButtonView: View {
    var body: some View {
        Capsule()
            .fill(myColor.pink.opacity(0.6))
            .padding(8)
            .frame(width: 230, height:80)
            
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
            .previewLayout(.sizeThatFits)
    }
}
