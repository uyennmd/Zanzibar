//
//  ButtonView.swift
//  Zanzibar (iOS)
//
//  Created by Uyen Nguyen Minh Duy on 25/08/2022.
//

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
