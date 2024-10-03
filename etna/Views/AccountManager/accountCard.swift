//
//  accountCard.swift
//  Etna
//
//  Created by Tomasz on 02/10/2024.
//

import SwiftUI

struct AccountCardView: View {
    @Environment(\.presentationMode) var presentation
    @State private var username: String = ""
    @State private var showAlert = false
    @State private var displayStudents: Array<String> = Array()
    @State private var selectedStudent: String = ""
    @State private var studentSchool = ""
    
    let id: String
    
    private func saveNewUsername(newUsername: String) {
    }
    
    private func alert() {
        let alert = UIAlertController(title: "Zmiana nazwy", message: "Tu wpisz swoją nową nazwę konta", preferredStyle: .alert)
        alert.addTextField() { textField in
            textField.placeholder = username
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
        alert.addAction(UIAlertAction(title: "Save", style: .default) { _ in let textField = alert.textFields![0]
                            let newUsername = "\(textField.text ?? "\(username)")"
                            saveNewUsername(newUsername: newUsername)})
        showAlert(alert: alert)
    }

    func showAlert(alert: UIAlertController) {
        if let controller = topMostViewController() {
            controller.present(alert, animated: true)
        }
    }

    private func keyWindow() -> UIWindow? {
        return UIApplication.shared.connectedScenes
        .filter {$0.activationState == .foregroundActive}
        .compactMap {$0 as? UIWindowScene}
        .first?.windows.filter {$0.isKeyWindow}.first
    }

    private func topMostViewController() -> UIViewController? {
        guard let rootController = keyWindow()?.rootViewController else {
            return nil
        }
        return topMostViewController(for: rootController)
    }

    private func topMostViewController(for controller: UIViewController) -> UIViewController {
        if let presentedController = controller.presentedViewController {
            return topMostViewController(for: presentedController)
        } else if let navigationController = controller as? UINavigationController {
            guard let topController = navigationController.topViewController else {
                return navigationController
            }
            return topMostViewController(for: topController)
        } else if let tabController = controller as? UITabBarController {
            guard let topController = tabController.selectedViewController else {
                return tabController
            }
            return topMostViewController(for: topController)
        }
        return controller
    }
    
    init() {
        self.id = "0"
    }
    
    private func getActualStudentName() -> String {
        return "Jan Kowalski"
    }
    
    private func getStudents() -> Array<String> {
        var i: Int = 0
        var displayStudentsFunc: Array<String> = ["Test1", "Test2"]
        return displayStudentsFunc
    }
    
    private func getAccount() {
    }
    
    private func getUsername() {
    }
    
    private func getSchoolName() -> String {
        return "Szkoła Podstawowa nr 2137"
    }
    
    private func done() {
        presentation.wrappedValue.dismiss()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    let pencilSymbol = Image(systemName: "pencil")
                    Button("\(pencilSymbol)") { alert() }
                        .font(.system(size: 25))
                        .padding()
                        .multilineTextAlignment(.trailing)
                }
                Spacer()
                Image(systemName: "person.circle")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 92)
                    .foregroundColor(.accentColor)
                    .padding(.bottom)
                Text("\(username)")
                    .font(.title)
                Spacer()
                Text(self.studentSchool)
                    .fontWeight(.light)
                
                
                Form {
                    Section(header: Text("Aktualny uczeń")) {
                        HStack {
                            Text("\(selectedStudent)")
                            Spacer()
                            Picker(selection: $selectedStudent, label: Image(systemName:"pencil")) {
                                ForEach(displayStudents, id: \.self) { student in
                                    Text(student)
                                }
                            }.pickerStyle(MenuPickerStyle())
                        }
                    }
                    
                    Section {
                        NavigationLink(destination: PersonalInfoView()) {
                            Label("Dane osobowe", systemImage: "person")
                                .accessibility(label: Text("Dane osobowe"))
                        }
                        NavigationLink(destination: ResidenceInfoView()) {
                            Label("Dane adresowe", systemImage: "house")
                                .accessibility(label: Text("Dane adresowe"))
                        }
                        NavigationLink(destination: ContactView()) {
                            Label("Kontakt", systemImage: "phone")
                                .accessibility(label: Text("Kontakt"))
                        }
                        NavigationLink(destination: FamilyView()) {
                            Label("Rodzina", systemImage: "person.2")
                                .accessibility(label: Text("Rodzina"))
                        }
                    }
                }
                
                Spacer()
                Button("Done") { done() }
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor.opacity(0.1))
                    .cornerRadius(12)
            }.padding()
            .onAppear {
                getAccount()
                getUsername()
                self.displayStudents = getStudents()
                self.studentSchool = getSchoolName()
                self.selectedStudent = getActualStudentName()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}



struct AccountCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AccountCardView()
        }
        .preferredColorScheme(.dark)
    }
}
