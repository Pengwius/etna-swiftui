//
//  accountManager.swift
//  Etna
//
//  Created by Tomasz on 02/10/2024.
//

import SwiftUI

struct AccountManagerView: View {
    @State private var showLoginModal = false
    @State private var showEditAccountModal = false
    @AppStorage("isLogged") private var isLogged: Bool = false
    @State private var accounts: [String] = [""]
    @State private var actualId: String = "0"
    @State private var showingDeleteAlert = false
    @State private var deletingAccount = "0"
    
    private func getStudentsNames() -> [String] {
        var allAccountsArray: [String] = []
        print(allAccountsArray)
        
        return allAccountsArray
    }
    
    private func addAccount() {
        self.showLoginModal = true
    }
    
    private func openEditAccount(id: String) {
        self.showEditAccountModal = true
    }
    
    
    private func setActualAccount(id: String) {
    }
    
    private func deleteAccount() {
    }
    
    private func getUsername() -> String {
        return "Test"
    }
    
    var body: some View {
        if(isLogged == true) {
            VStack {
                Form {
                    Section(header: Text("chooseAccount")
                                .font(.title)) {
                        ForEach(accounts, id: \.self) { student in
                            HStack {
                                let studentEmail = "jan@kowalski.com"
                                
                                Button("\(studentEmail)") { setActualAccount(id: student) }
                                    .foregroundColor(Color("customControlColor"))
                                    .aspectRatio(contentMode: .fit)
                                if("\(actualId)" == "\(student)") {
                                    Image(systemName: "checkmark.circle")
                                        .foregroundColor(.green)
                                }
                                Spacer()
                                let cardImage = Image(uiImage: UIImage(systemName: "ellipsis")!)
                                    .renderingMode(.template)
                                
                                Button("\(cardImage)") { openEditAccount(id: student) }
                                    .foregroundColor(Color("customControlColor"))
                                    .padding(.horizontal)
                                    .sheet(isPresented: $showEditAccountModal, onDismiss: {
                                        }) {
                                            AccountCardView()
                                        }
                                
                                let trashImage = Image(uiImage: UIImage(systemName: "trash")!)
                                    .renderingMode(.template)
                                
                                Button("\(trashImage)") {
                                    showingDeleteAlert = true
                                    deletingAccount = student
                                }
                            }.buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
            }.onAppear {
            }
            .alert(isPresented: $showingDeleteAlert) {
                Alert(title: Text("Do you want to delete this account?"),
                      message: Text("You cannot undo this action"),
                      primaryButton: .destructive(Text("Delete"), action: deleteAccount),
                      secondaryButton: .cancel(Text("Cancel")))
                    }
        } else {
            Spacer()
            Text("No accounts added")
        }
        Spacer()
        Button("addAccount") {addAccount()}
            .font(.headline)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor.opacity(0.1))
            .cornerRadius(12)
            .buttonStyle(BorderlessButtonStyle())
            .padding()
            .sheet(isPresented: $showLoginModal, onDismiss: {
                }) {
                    LoginView()
                }
    }
}


struct AccountManagerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AccountManagerView()
        }
        .preferredColorScheme(.dark)
    }
}
