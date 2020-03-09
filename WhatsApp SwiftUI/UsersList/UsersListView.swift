//
//  UsersListView.swift
//  WhatsApp SwiftUI
//
//  Created by mohamed gamal on 3/9/20.
//  Copyright © 2020 mohamed gamal. All rights reserved.
//

import SwiftUI
import Firebase

struct UsersListView: View {
    
    @ObservedObject var userStore = UserStore()
    
    var body: some View {
        
        List(userStore.userArray){ users in
            NavigationLink(destination: ChatView(userToChat: users)){
                UsersListRow(image: Image("whatsApp"), text: Text(users.name))
                
            }
            
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}

public struct ListSeparatorStyleNoneModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.onAppear {
            UITableView.appearance().separatorStyle = .none
        }.onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
        }
    }
}

extension View {
    public func listSeparatorStyleNone() -> some View {
        modifier(ListSeparatorStyleNoneModifier())
    }
}
