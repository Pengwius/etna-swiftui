//
//  chooseStudent.swift
//  Etna
//
//  Created by Tomasz on 02/10/2024.
//

import Foundation
import SwiftUI

struct ChooseStudentView: View {
    @Environment(\.presentationMode) var presentation
    @AppStorage("isLogged") private var isLogged: Bool = false
    
    var displayStudents: Array<String> = Array()
    
    @State private var selectedStudent: String = ""
    
    init() {
        var i: Int = 0
        while true {

            displayStudents.append("Jan Kowalski")
            break
            i += 1
        }
    }
    
    
    private func saveStudent() {
        var i: Int = 0
        
        while true {
            let student = "Jan Kowalski"
            if(student == selectedStudent) {
                //saving student
                let id = 2137
                break
            }
            i += 1
        }
        isLogged = true
        presentation.wrappedValue.dismiss()
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("selectStudent")
                .font(.title)
                .padding(.top)
            Picker(selection: $selectedStudent, label: Text("selectStudent")) {
                ForEach(displayStudents, id: \.self) { student in
                    Text(student)
                }
            }
            Spacer()
            Button("registerButton") {saveStudent()}
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.accentColor.opacity(0.1))
                .cornerRadius(12)
            
        }.padding()
    }
}



struct ChooseStudentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChooseStudentView()
        }
        .preferredColorScheme(.dark)
    }
}
