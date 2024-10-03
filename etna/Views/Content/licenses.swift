//
//  licenses.swift
//  Etna
//
//  Created by Tomasz on 02/10/2024.
//

import SwiftUI

struct LicensesView: View {
    
    
    let SwiftUIEKtensionsURL: URL? = URL(string: "https://github.com/EnesKaraosman/SwiftUIEKtensions")!
    
    let entaSwiftUIURL: URL? = URL(string: "https://github.com/pengwius/etna-swiftui")!
    let etnaSwiftUILicence: String = """
    ## Warunki użycia w celach niekomercyjnych:
    - Zamieszczenie creditsów w aplikacji wraz z linkiem do repozytorium
    - Projekt można dowolnie modyfikować
    - Można rozpowszechniać zmodyfikowane wersje tylko nieodpłatnie
    - Zmodyfikowane wersje mogą być zarówno open-source, jak i closed-source

    ## Warunki użycia w celach komercyjnych:
    Indywidualnie do ustalenia. W celu ustalenia warunków użycia w celach komercyjnych można się skontaktować przez:

    - Telegram (preferowane): [@pengwius](https://t.me/pengwius)
    - Matrix: @pengwius:matrix.org
    - E-mail: pengwius@proton.me
    """
    
    
    var body: some View {
        List {
            //Etna SwiftUI
            DisclosureGroup("Etna SwiftUI") {
                Text(etnaSwiftUILicence)
                    .font(.system(.body, design: .monospaced))
                    .onTapGesture {
                        guard let url = SwiftUIEKtensionsURL else { return }
                        UIApplication.shared.open(url)
                    }
            }
            .padding(.vertical)
            
            // SwiftUIEKtensions
            DisclosureGroup("SwiftUIEKtensions") {
                Text("noLicence")
                    .font(.system(.body, design: .monospaced))
                    .onTapGesture {
                        guard let url = SwiftUIEKtensionsURL else { return }
                        UIApplication.shared.open(url)
                    }
            }
            .padding(.vertical)
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(Text("Libraries"))
    }
}

struct LicensesView_Previews: PreviewProvider {
    static var previews: some View {
        LicensesView()
    }
}
