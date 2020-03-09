//
//  UserStore.swift
//  WhatsApp SwiftUI
//
//  Created by mohamed gamal on 3/9/20.
//  Copyright © 2020 mohamed gamal. All rights reserved.
//


import SwiftUI
import Firebase
import Combine

class UserStore : ObservableObject{
    
    
    let db = Firestore.firestore()
    var userArray : [UserModel] = []
    
    var objectWillChange = PassthroughSubject<Array<Any>, Never>()
    
    
    
    init(){
        
        db.collection("Users").addSnapshotListener { (snapshot, error) in
            if error != nil {
                
            } else {
                
                self.userArray.removeAll(keepingCapacity: false)
                
                for document in snapshot!.documents {
                    
                    if let userUidFromFirebase = document.get("useruidfromfirebase") as? String {
                        
                        if let userName = document.get("username") as? String {
                            let currentIndex = self.userArray.last?.id
                            
                            let createdUser = UserModel(id: (currentIndex ?? -1) + 1, name: userName, uidFromFirebase: userUidFromFirebase)
                            
                            self.userArray.append(createdUser)
                        
                        }
                    }
                }
                self.objectWillChange.send(self.userArray)
            }
        }
        
        
        
        
        
    }
    
    
    
}
