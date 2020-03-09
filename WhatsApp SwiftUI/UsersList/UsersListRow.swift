//
//  UsersListRow.swift
//  WhatsApp SwiftUI
//
//  Created by mohamed gamal on 3/9/20.
//  Copyright © 2020 mohamed gamal. All rights reserved.
//

import SwiftUI

struct UsersListRow: View {

    var image = Image("whatsApp")
    var text = Text("message")
    
    var body: some View {
        
        HStack {
            image
                .resizable()
                .frame(width: 30, height: 30, alignment: .leading)
            
            text
                .font(.callout)
        }
    }

}

struct UsersListRow_Previews: PreviewProvider {
    static var previews: some View {
        UsersListRow()
    }
}
