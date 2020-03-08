//
//  RegistrationView.swift
//  WhatsApp SwiftUI
//
//  Created by mohamed gamal on 3/8/20.
//  Copyright © 2020 mohamed gamal. All rights reserved.
//

import SwiftUI
import Firebase

struct RegistrationView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var name:String = ""
    @State var error: String = ""
    @State var showAlert = true
    
    var body: some View {
        
        VStack {
            
            Image("whatsApp")
                .resizable()
                .frame(width: 130, height: 130)
                .shadow(radius: 2)
            
            VStack(alignment: .leading){
                Text("User Name")
                    .font(.headline)
                TextFiledView(email: name, placeholder: "User Name")
            }
            .padding()
            
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

                TextField("Password", text: $password)
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
                
                Auth.auth().createUser(withEmail: self.email, password: self.password) { (result, error) in
                    
                    
                    if error != nil {
                        
                        print(error?.localizedDescription as Any)
                        
                      
                            
//                    Alert(title: Text("Error"), message: Text(String(error?.localizedDescription ?? "")), dismissButton: Alert.Button.default(Text("Ok")))
                    
                        
                    } else {
                        
                        
                    }
                }
                //
            }) {
                
                GradientButton(text: "Sign Up")
                
            }
            .padding()
            
            
        }.gesture(TapGesture(count: 1).onEnded({ (_) in
            
            UIApplication.shared.endEditing()
           
        }))
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
