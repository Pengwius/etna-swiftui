//
//  more.swift
//  Etna
//
//  Created by Tomasz on 02/10/2024.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: AttendanceView()) {
                        Label("attendanceButton", systemImage: "chart.bar.doc.horizontal")
                            .accessibility(label: Text("attendanceButton"))
                    }
                    NavigationLink(destination: NotesView()) {
                        Label("notesButton", systemImage: "graduationcap")
                            .accessibility(label: Text("notesButton"))
                    }
                }
                
                Section {
                    NavigationLink(destination: SettingsView()) {
                        Label("settingsButton", systemImage: "gear")
                            .accessibility(label: Text("settingsButton"))
                    }
                    NavigationLink(destination: AboutView()) {
                        Label("aboutButton", systemImage: "info.circle")
                            .accessibility(label: Text("aboutButton"))
                    }
                }
            }
            .navigationBarTitle("moreButton", displayMode: .inline)
        }
    }
}



struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MoreView()
        }
        .preferredColorScheme(.dark)
    }
}
