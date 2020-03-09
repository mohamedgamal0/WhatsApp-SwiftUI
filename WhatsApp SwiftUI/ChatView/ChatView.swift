//
//  ChatView.swift
//  WhatsApp SwiftUI
//
//  Created by mohamed gamal on 3/9/20.
//  Copyright © 2020 mohamed gamal. All rights reserved.
//

import SwiftUI
import Firebase

struct ChatView: View {
    
    let db = Firestore.firestore()
    var userToChat : UserModel
    @State var messageToSend = ""
    
    @ObservedObject var chatStore = ChatStore()
    
    var body: some View {
        
        
        VStack {
            
            ScrollView{
                
                ForEach(chatStore.chatArray) { chats in
                    ChatRow(chatMessage: chats, userToChatFromChatView: self.userToChat)
                    
                }
                
                
            }
            HStack{
                TextField("Message here ...",text: $messageToSend).frame(minHeight: 20).padding()
                    .foregroundColor(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.white)
                            // Add the outline
                            .background(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.07, green: 0.55, blue: 0.49), lineWidth: 3)))
                    .frame(width: UIScreen.main.bounds.width - 120 , height: 20)
                
                Button(action: sendMessageToFirebase) {
                    Text("Send")
                }.frame(minHeight:20).padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [.init(red: 0.03, green: 0.37, blue: 0.33), .init(red: 0.15, green: 0.83, blue: 0.40)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
            }
        }
        
    }
    
    func sendMessageToFirebase() {
        
        var ref: DocumentReference? = nil
        
        let myChatDictionary : [String : Any] = ["chatUserFrom" : Auth.auth().currentUser!.uid,"chatUserTo":userToChat.uidFromFirebase,"date":generateDate(),"message":self.messageToSend]
        
        ref = self.db.collection("Chats").addDocument(data: myChatDictionary, completion: { (error) in
            if error != nil {
                
            } else {
                self.messageToSend = ""
            }
        })
    }
    
    func generateDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy_MM_dd_hh_mm_ss"
        return (formatter.string(from: Date()) as NSString) as String
    }
}
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(userToChat: UserModel(id: 0, name: "James", uidFromFirebase: "l343423l"))
    }
}
