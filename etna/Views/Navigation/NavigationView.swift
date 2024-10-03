//
//  NavigationView.swift
//  Etna
//
//  Created by Tomasz on 02/10/2024.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        TabView() {
            NavigationView {
                DashboardView()
                    .navigationBarItems(trailing: NavigationLink(destination: AccountManagerView()) {
                        Image(systemName: "person.circle")
                    })
                        }
                .tabItem {
                Label("dashboardButton", systemImage: "rectangle.on.rectangle")
                    .accessibility(label: Text("dashboardButton"))
            }
            
            NavigationView {
                GradesView()
                    .navigationBarItems(trailing: NavigationLink(destination: AccountManagerView()) {
                        Image(systemName: "person.circle")
                    })
                        }
                .tabItem {
                Label("gradesButton", systemImage: "rosette")
                    .accessibility(label: Text("gradesButton"))
            }

            NavigationView {
                CalendarView()
                    .navigationBarItems(trailing: NavigationLink(destination: AccountManagerView()) {
                        Image(systemName: "person.circle")
                    })
                        }
                .tabItem {
                Label("calendarButton", systemImage: "calendar")
                    .accessibility(label: Text("calendarButton"))
            }
            
            NavigationView {
                MessagesView()
                    .navigationBarItems(trailing: NavigationLink(destination: AccountManagerView()) {
                        Image(systemName: "person.circle")
                    })
                        }
                .tabItem {
                Label("messagesButton", systemImage: "envelope")
                    .accessibility(label: Text("messagesButton"))
            }
            
            MoreView()
            .tabItem {
                Label("moreButton", systemImage: "ellipsis.circle")
                    .accessibility(label: Text("moreButton"))
            }
        }
    }
}


struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationBarView()
        }
        .preferredColorScheme(.dark)
    }
}
