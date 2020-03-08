//
//  TextFiledView.swift
//  WhatsApp SwiftUI
//
//  Created by mohamed gamal on 3/8/20.
//  Copyright © 2020 mohamed gamal. All rights reserved.
//

import SwiftUI

struct TextFiledView: View {
    
    @State var email: String = ""
    @State var placeholder:String = ""
    var body: some View {
        
        TextField(placeholder, text: $email)
            .padding().frame(height: 50)
            .foregroundColor(.black)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.white)
                    // Add the outline
                    .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.07, green: 0.55, blue: 0.49), lineWidth: 3)))
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 41)
        
        
    }
}

struct TextFiledView_Previews: PreviewProvider {
    static var previews: some View {
        TextFiledView()
    }
}
