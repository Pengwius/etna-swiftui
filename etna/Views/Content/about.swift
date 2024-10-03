//
//  about.swift
//  Etna
//
//  Created by Tomasz on 02/10/2024.
//

import Foundation
import SwiftUI
import UIKit
import Combine
import MessageUI
import SwiftUIEKtensions

struct AboutView: View {
    @State private var result: Result<MFMailComposeResult, Error>? = nil
    @State private var isShowingMailView = false
    
    var body: some View {
        Form {
            Section {
                DisclosureGroup("appVersion") {
                    Text("appVersionContent")
                        .font(.system(.body, design: .monospaced))
                }
                
                DisclosureGroup("contributors") {
                    HStack {
                        AsyncImage(url: URL(string: "https://avatars.githubusercontent.com/u/55411338?s=460&v=4")!,
                                       placeholder: { Image(systemName: "circle.dashed") },
                                       image: { Image(uiImage: $0).resizable() })
                            .frame(width: 38, height: 38)
                        Link("Pengwius", destination: URL(string: "https://github.com/pengwius")!)
                            .foregroundColor(Color("customControlColor"))
                    }
                }
                
                NavigationLink(destination: LicensesView()) {
                    Text("licensesButton")
                }
            }
            
            Section {
                Button(action: {
                            if MFMailComposeViewController.canSendMail() {
                                self.isShowingMailView.toggle()
                            } else {
                                print("Can't send emails from this device")
                            }
                            if result != nil {
                                print("Result: \(String(describing: result))")
                            }
                        }) {
                            HStack {
                                Text("reportBug")
                                    .foregroundColor(Color("customControlColor"))
                            }
                        }
                        // .disabled(!MFMailComposeViewController.canSendMail())
                    }
                    .sheet(isPresented: $isShowingMailView) {
                        MailView(result: $result) { composer in
                            composer.setSubject("")
                            composer.setToRecipients(["pengwius@proton.me"])
                        }
                    }
                
                Link("Github", destination: URL(string: "https://github.com/pengwius/etna-swiftui")!)
                    .foregroundColor(Color("customControlColor"))
        }
    }
}



struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AboutView()
        }
        .preferredColorScheme(.dark)
    }
}
