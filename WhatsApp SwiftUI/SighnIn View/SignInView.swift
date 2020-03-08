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
    @State var showAuthView = true
    
    var body: some View {
        
        NavigationView {
            
            if showAuthView{
                
                VStack {
                    Spacer().frame( height: 150)
                    Image("whatsApp")
                        .resizable()
                        .frame(width: 130, height: 130)
                        .shadow(radius: 2)
                    
                    VStack(alignment: .leading){
                        Text("Email")
                            .font(.headline)
                        TextField("Email", text: $email)
                            .padding().frame(height: 50)
                            .foregroundColor(.black)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.white)
                                    // Add the outline
                                    .background(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(red: 0.07, green: 0.55, blue: 0.49), lineWidth: 3)))
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: 41)
                        
                    }.padding()
                    
                    VStack(alignment: .leading){
                        Text("Password")
                            .font(.headline)
                        
                        SecureField("Password", text: $password)
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
                    .padding()
                    
                    
                    Button(action: {
                        //
                        
                        Auth.auth().signIn(withEmail: self.email, password: self.password) { (result, error) in
                            if error != nil {
                                
                                print(error?.localizedDescription as Any)
                                
                            } else {
                                
                                // show
                                self.showAuthView = false
                            }
                        }
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
                //AUTH VIEW END
            } else {
                
                Text("ddd")
            }
        }
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
