//
//  OnboardingView.swift
//  Etna
//
//  Created by Tomasz on 02/10/2024.
//

import SwiftUI

fileprivate struct InformationDetailView: View {
    var title: LocalizedStringKey = ""
    var subtitle: LocalizedStringKey = ""
    var imageName: String = ""
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageName)
                .font(.system(size: 50))
                .font(.largeTitle)
                .frame(width: 50)
                .foregroundColor(.accentColor)
                .padding()
                .accessibility(hidden: true)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .accessibility(addTraits: .isHeader)
                    .lineLimit(2)
                
                Text(subtitle)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top)
    }
}

struct OnboardingView: View {
    
    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    
    var body: some View {
            VStack() {
                Spacer()
                Image("etna")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 92)
                    .cornerRadius(20)
                    .padding(.bottom)
                
                Text("onboardingTitle")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                    .multilineTextAlignment(.center)
                    .frame(height: 100)
                
                Spacer()
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        InformationDetailView(title: "onboarding1Title", subtitle: "onboarding1Content", imageName: "bell")
                        InformationDetailView(title: "onboarding2Title", subtitle: "onboarding2Content", imageName: "envelope")
                        InformationDetailView(title: "onboarding3Title", subtitle: "onboarding3Content", imageName: "hare")
                    }.multilineTextAlignment(.leading)
                    Spacer()
                }
                Spacer()
                Spacer()
                Button("continueButton") { needsAppOnboarding = false }
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor.opacity(0.1))
                    .cornerRadius(12)
            }.padding()
    }
}

struct EtnaCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingView().previewLayout(.fixed(width: 320, height: 640))
        }
    }
}
