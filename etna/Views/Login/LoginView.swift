//
//  LoginView.swift
//  Etna
//
//  Created by Tomasz on 02/10/2024.
//

import SwiftUI

enum AvailableEndpoints: String, CaseIterable {
    case etna = "Etna"
    case szkolny = "Szkolny"
    case ocenowo = "Ocenowo"
}

open class Navigation: ObservableObject {
    let window: UIWindow

    public init(window: UIWindow) {
        self.window = window
    }
}

struct LoginView: View {
    @State public var username: String = ""
    @State public var password: String = ""
    @State public var selectedEndpoint: String = "etna"
    
    @State public var clicked: Bool = false
    @State public var buttonValue = String(format: NSLocalizedString("loginButton", comment: "loginButton"))
    @State public var loginStatus: String = ""
    @State public var willMoveToNextScreen = false
    @State public var success = false
    @State public var showingAlert = false
    
    public let cellHeight: CGFloat = 55
    public let cornerRadius: CGFloat = 12
    public let cellBackground: Color = Color(UIColor.systemGray5).opacity(0.5)
    
    public let nullColor: Color = Color.accentColor.opacity(0.4)
    
    private func login() {
        clicked = true
        if(username != "" && password != "") {
            buttonValue = String(format: NSLocalizedString("invalidData", comment: "loginButton"))
            success = true
        } else {
            print("success")
            success = true
        }
    }
    
    private func setColor(input: String) -> Color {
        if(clicked == true){
            switch(input) {
            case "username":
                if (username == "") {
                    return nullColor
                } else {
                    return cellBackground
                }
                
            case "password":
                if (password == "") {
                    return nullColor
                } else {
                    return cellBackground
                }
                
            default:
                return cellBackground
            }
        } else {
            return cellBackground
        }
    }
//    
    var body: some View {
//        if(true == true) {
//            ChooseStudentView()
//        }
//        else
//        {
            VStack {
                Spacer()
                    Image("etna")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 92)
                        .cornerRadius(20)
                        .padding(.bottom)
                    
                    Text("loginTitle")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                
                Spacer()
                
                TextField("username", text: $username)
                    .autocapitalization(.none)
                    .font(Font.body.weight(Font.Weight.medium))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .frame(height: cellHeight)
                    .background(cellBackground)
                    .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(setColor(input: "username"), lineWidth: 2)
                        )
                
                TextField("password", text: $password)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .font(Font.body.weight(Font.Weight.medium))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .frame(height: cellHeight)
                    .background(cellBackground)
                    .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(setColor(input: "password"), lineWidth: 2)
                        )
                
                Picker("selectEregister", selection: $selectedEndpoint) {
                    Text("Etna")
                        .foregroundColor(.blue)
                        .tag("etna")
                    Text("Szkolny")
                        .foregroundColor(.blue)
                        .tag("szkolny")
                    Text("Ocenowo")
                        .foregroundColor(.blue)
                        .tag("ocenowo")
                }
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .font(Font.body.weight(Font.Weight.medium))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: cellHeight)
                .background(cellBackground)
                .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(cellBackground, lineWidth: 2)
                    )
                
                Spacer()
                Spacer()
                
                Button(buttonValue) {login()}
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .frame(height: cellHeight)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor.opacity(0.1))
                    .cornerRadius(cornerRadius)
                
            }.padding()
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("accountRegistered"), message: Text("accountRegisteredContent"), dismissButton: .default(Text("OK")))}
                Spacer()
            
//        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
        }
        .preferredColorScheme(.dark)
    }
}
