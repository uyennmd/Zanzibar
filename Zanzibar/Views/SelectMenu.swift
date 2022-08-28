//
//  SelectMenu.swift
//  Zanzibar (iOS)
//
//  Created by Uyen Nguyen Minh Duy on 25/08/2022.
//

import SwiftUI

struct SelectMenu: View {
    @Binding var isSelected: Bool
    @State var text: String
    var body: some View {
        ZStack {
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
