//
//  grades.swift
//  Etna
//
//  Created by Tomasz on 02/10/2024.
//

import SwiftUI

struct GradesView: View {
    @State private var showModal = false
    @AppStorage("isLogged") private var isLogged: Bool = false
    
    var body: some View {
        if(isLogged){
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
                Text("Here is grades (in my imagination)")
            }.coordinateSpace(name: "pullToRefresh")
        }
    }
}



struct GradesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GradesView()
        }
        .preferredColorScheme(.dark)
    }
}
