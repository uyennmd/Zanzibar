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

struct HowToPlay: View {
    var body: some View {
        ZStack {
            myColor.blue
                .opacity(0.4)
                .ignoresSafeArea(.all)
            ScrollView {//use scroll view for the tutorial
                VStack{
                    Text("Zanzibar Dice Game Rules")
                        .foregroundColor(.pink)
                        .bold()
                        .font(.system(size: 30))
                    Text(zanzibar)
                    Text("How do you score?")
                        .foregroundColor(.pink)
                        .bold()
                        .font(.system(size: 30))
                    Text(rule)
                    Text("How do you win?")
                        .foregroundColor(.pink)
                        .bold()
                        .font(.system(size: 30))
                    Text("The first player to get rid of all of their chips wins.")
                    Text("Simpler Scoring")
                        .foregroundColor(.pink)
                        .bold()
                        .font(.system(size: 30))
                    Text(simple)
                    Text("Hard Scoring")
                        .foregroundColor(.pink)
                        .bold()
                        .font(.system(size: 30))
                    Text(hard)
                }.padding(10)
            }
        }
    }
}

struct HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlay()
    }
}
