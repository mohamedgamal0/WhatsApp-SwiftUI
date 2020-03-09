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
    @State var showAuthView = true
    
    var db = Firestore.firestore()
    
    var body: some View {
        
        NavigationView {
            
            if showAuthView{
                
                VStack {
                    
                    Image("whatsApp")
                        .resizable()
                        .frame(width: 130, height: 130)
                        .shadow(radius: 2)
                    
                    VStack(alignment: .leading){
                        Text("User Name")
                            .font(.headline)
                        TextField("User Name", text: $name)
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
                        // firbase Auth
                        Auth.auth().createUser(withEmail: self.email, password: self.password) { (result, error) in
                            
                            if error != nil {
                                print(error?.localizedDescription as Any)
                                //                        self.showAlert = true
                            } else {
                                
                                var ref:DocumentReference? = nil
                                let myDectionary : [String:Any] = ["username":self.name,"useremail:":self.email,"useruidfromfirebase":result!.user.uid]
                                
                                ref = self.db.collection("Users").addDocument(data: myDectionary,completion: {(error) in
                                    
                                    if error != nil {
                                        
                                    }
                                    
                                    
                                    
                                })
                                
                                //userView
                                // show
                                self.showAuthView = false

                            }
                        }
                        
                    }){
                        GradientButton(text: "Sign Up")
                    }
                    .padding()
                    
                    
                }.gesture(TapGesture(count: 1).onEnded({ (_) in
                    
                    UIApplication.shared.endEditing()
                    
                }))
                
                //AUTH VIEW END
            } else {
             
                NavigationView {
                    UsersListView()
                
            }.navigationBarTitle(Text("Chat With Users!"))
                    .navigationBarItems(leading: Button(action: {
                        //log out
                        do {
                            try Auth.auth().signOut()
                        } catch {
                        
                        }
                        self.showAuthView = true
                    }, label: {
                        Text("Log Out")
                    }))
            }
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
