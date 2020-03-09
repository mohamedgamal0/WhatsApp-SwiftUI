//
//  GradientButton.swift
//  WhatsApp SwiftUI
//
//  Created by mohamed gamal on 3/8/20.
//  Copyright © 2020 mohamed gamal. All rights reserved.
//

import SwiftUI

struct GradientButton: View {
    
    @State var text: String = ""
    
    var body: some View {
        
        Text(self.text)
            .frame(width: UIScreen.main.bounds.width * 0.6, height: 21)
            
            
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [.init(red: 0.03, green: 0.37, blue: 0.33), .init(red: 0.15, green: 0.83, blue: 0.40)]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            

    }
}

struct GradientButton_Previews: PreviewProvider {
    static var previews: some View {
        GradientButton()
    }
}
