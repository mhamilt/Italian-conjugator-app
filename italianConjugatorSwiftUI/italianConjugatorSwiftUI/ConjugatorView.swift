//
//  ConjugatorView.swift
//  italianConjugatorSwiftUI
//
//  Created by Keith Nagle on 24/04/2025.
//
import SwiftUI

struct ConjugatorView: View {
    
    var dictionary: Dictionary<String, Dictionary<String, String>>?
    
    @State private var searchText = ""
    @State public var infinitive: String = ""
    @State public var gerund: String = ""
    @State public var past: String = ""
    
    @State public var dictionaryEntry : [String:String]?
    
    var nullentry: [String:String] = [
        "INF":"",
        "GER":"",
        "PRS.PTCP.SG":"",
        "PRS.PTCP.PL":"",
        "PST.PTCP.M.SG":"",
        "PST.PTCP.F.SG":"",
        "PST.PTCP.M.PL":"",
        "PST.PTCP.F.PL":"",
        "IMP.2SG":"",
        "IMP.1PL":"",
        "IMP.2PL":"",
        "PRS.IND.1SG":"",
        "PRS.IND.2SG":"",
        "PRS.IND.3SG":"",
        "PRS.IND.1PL":"",
        "PRS.IND.2PL":"",
        "PRS.IND.3PL":"",
        "PRS.SBJV.1SG":"",
        "PRS.SBJV.2SG":"",
        "PRS.SBJV.3SG":"",
        "PRS.SBJV.1PL":"",
        "PRS.SBJV.2PL":"",
        "PRS.SBJV.3PL":"",
        "IPRF.IND.1SG":"",
        "IPRF.IND.2SG":"",
        "IPRF.IND.3SG":"",
        "IPRF.IND.1PL":"",
        "IPRF.IND.2PL":"",
        "IPRF.IND.3PL":"",
        "IPRF.SBJV.1SG":"",
        "IPRF.SBJV.2SG":"",
        "IPRF.SBJV.3SG":"",
        "IPRF.SBJV.1PL":"",
        "IPRF.SBJV.2PL":"",
        "IPRF.SBJV.3PL":"",
        "PRET.IND.1SG":"",
        "PRET.IND.2SG":"",
        "PRET.IND.3SG":"",
        "PRET.IND.1PL":"",
        "PRET.IND.2PL":"",
        "PRET.IND.3PL":"",
        "FUT.IND.1SG":"",
        "FUT.IND.2SG":"",
        "FUT.IND.3SG":"",
        "FUT.IND.1PL":"",
        "FUT.IND.2PL":"",
        "FUT.IND.3PL":"",
        "COND.1SG":"",
        "COND.2SG":"",
        "COND.3SG":"",
        "COND.1PL":"",
        "COND.2PL":"",
        "COND.3PL":"",
        "Order":"",
        "isIrregular":"",
    ]
    
    init(dictionary: Dictionary<String, Dictionary<String, String>>? = nil, searchText: String = "", infinitive: String = "" , gerund: String = "", past: String = "") {
        self.dictionary = dictionary
        self.searchText = searchText
        self.infinitive = infinitive
        self.gerund = gerund
        self.past = past
    }
    
    func setTheTable()
    {
        if((dictionary?.keys.contains(searchText.lowercased())) != nil)
        {
            dictionaryEntry = dictionary![searchText.lowercased()]
            infinitive = dictionaryEntry?["INF"] ?? "-"
            gerund     = dictionaryEntry?["GER"] ?? "-"
            past       = dictionaryEntry?["PST.PTCP.M.SG"] ?? "-"
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                TextField("Scrivi l'infinito", text: $searchText)
                    .disabled(false)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .foregroundColor(.black)
                    .background(.black)
                    .onSubmit {
                        setTheTable();
                    }
                    .onChange(of: searchText) { oldValue, newValue in
                        setTheTable();
                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                
                ConjugationDetails(infinitive: infinitive,
                                   gerund: gerund,
                                   past: past)
                .padding(.horizontal)
                .padding(.vertical)
                
                ConjugationTable(entry: dictionaryEntry ?? nullentry)
                    .padding(.horizontal)
                    .padding(.vertical)
                
            }
        }
        .background(.black)
        .foregroundColor(.white)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct ConjugationDetails: View {
    
    var infinitive: String = ""
    var gerund: String = ""
    var past: String = ""
    
    init(infinitive: String, gerund: String, past: String)
    {
        self.infinitive = infinitive
        self.gerund = gerund
        self.past = past
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("Infinito:").bold()
                Text(infinitive).italic()
            }
            HStack {
                Text("Gerundio:").bold()
                Text(gerund).italic()
            }
            HStack {
                Text("Participio Passato:").bold()
                Text(past).italic()
            }
        }
    }
}

struct ConjugationTable: View {
    
    let tenseCodes = [
        "PRS.IND"   ,
        "IPRF.IND"  ,
        "PRET.IND"  ,
        "FUT.IND"   ,
        "PRS.SBJV"  ,
        "IPRF.SBJV" ,
        "COND"      ,
        "IMP"       ,
    ]
    
    let personCodes = [
        "1SG",
        "2SG",
        "3SG",
        "1PL",
        "2PL",
        "3PL",
    ]
    
    let tenses: [String:String] =    [
        "PRS.IND"   :  "Presente",
        "IPRF.IND"  :  "Imperfetto",
        "PRET.IND"  :  "Remoto",
        "FUT.IND"   :  "Futuro",
        "PRS.SBJV"  :  "Congiuntivo",
        "IPRF.SBJV" :  "Cng Imperf",
        "COND"      :  "Condizionale",
        "IMP"       :  "Imperative",
    ]
    
    let persons =
    [
        "1SG":"io",
        "2SG":"tu",
        "3SG":"lei",
        "1PL":"noi",
        "2PL":"voi",
        "3PL":"loro"
    ]
    
    var entry: [String:String]
    
    init(entry: [String : String]) {
        self.entry = entry
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                GridRow {
                    Text("Persona")
                        .multilineTextAlignment(.trailing)
                        .padding()
                    ForEach(tenseCodes, id: \.self) { tenseCode in
                        Text(tenses[tenseCode] ?? "-")
                            .multilineTextAlignment(.leading)
                            .padding()
                    }
                }
                ForEach(personCodes, id: \.self) {
                    personCode in
                    GridRow {
                        Text(persons[personCode] ?? "-")
                            .multilineTextAlignment(.trailing)
                            .padding()
                        ForEach(tenseCodes, id: \.self) { tenseCode in
                            Text(entry[tenseCode + "." + personCode] ?? "-")
                                .frame(minWidth: 100, minHeight: 40)
                                .multilineTextAlignment(.leading)
                                .padding()
                        }
                    }
                }
            }
            .border(.white)
        }
    }
}
