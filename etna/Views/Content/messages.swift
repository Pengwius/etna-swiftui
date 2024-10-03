//
//  messages.swift
//  Etna
//
//  Created by Tomasz on 02/10/2024.
//

import SwiftUI

struct MessagesView: View {
    @State private var showModal = false
    @AppStorage("isLogged") private var isLogged: Bool = false
    
    var body: some View {
        if(isLogged == false){
            VStack {
                Text("notLoggedIn")
                Button("logIn") {self.showModal = true}
                    .sheet(isPresented: $showModal, onDismiss: {
                                print(self.showModal)
                            }) {
                                LoginView()
                            }
            }.padding()
        } else {
            ScrollView {
                PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                        print("Refreshing..")
                    }
                Text("Here is messages (in my imagination)")
            }.coordinateSpace(name: "pullToRefresh")
        }
    }
}



struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MessagesView()
        }
        .preferredColorScheme(.dark)
    }
}
