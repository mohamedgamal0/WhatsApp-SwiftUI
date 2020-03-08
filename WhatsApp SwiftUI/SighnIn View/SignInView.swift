//
//  SignInView.swift
//  WhatsApp SwiftUI
//
//  Created by mohamed gamal on 3/8/20.
//  Copyright © 2020 mohamed gamal. All rights reserved.
//

import SwiftUI
import Firebase

struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    
    
    var body: some View {
        
        
        VStack {
            Spacer().frame( height: 150)
            Image("whatsApp")
                .resizable()
                .frame(width: 130, height: 130)
                .shadow(radius: 2)
                 
            VStack(alignment: .leading){
                Text("Username")
                    .font(.headline)
                TextFiledView(email: email)
                
            }.padding()
            VStack(alignment: .leading){
                Text("Password")
                    .font(.headline)
                TextFiledView(email: email)
                
            }
            .padding()
            
            
            Button(action: {
                //
                
              
            }) {
                
                GradientButton(text: "Sign In")
                
            }
            .padding()
            
            HStack {
                
                Text("don't have an account?")
                    .font(.caption)
                Button(action: {
                    //action
                }) {
                    
                    Text("Register!")
                        .font(.caption)
                }
                
            }
            Spacer()
            
        } .gesture(TapGesture(count: 1).onEnded({ (_) in
            
            UIApplication.shared.endEditing()
           
        }))
    }
}

struct SighnInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
