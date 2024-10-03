//
//  notes.swift
//  Etna
//
//  Created by Tomasz on 02/10/2024.
//

import SwiftUI

struct NotesView: View {
    @State private var showModal = false
    @AppStorage("isLogged") private var isLogged: Bool = false
    
    var body: some View {
        NavigationView {
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
                    Text("Here is notes (in my imagination)")
                }.coordinateSpace(name: "pullToRefresh")
            }
        }
    }
}



struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotesView()
        }
        .preferredColorScheme(.dark)
    }
}
