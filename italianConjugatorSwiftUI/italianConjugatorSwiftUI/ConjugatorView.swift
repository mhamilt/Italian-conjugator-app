//
//  ConjugatorView.swift
//  italianConjugatorSwiftUI
//
//  Created by Keith Nagle on 24/04/2025.
//
import SwiftUI

struct ConjugatorView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Italian Verb Conjugation")
                        .font(.title)
                        .bold()
                        .padding(.top)

                    TextField("Scrive l'infinito", text: $searchText)
                        .disabled(false)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    ConjugationDetails()
                    ConjugationTable()
                }
                .padding()
            }
            .background(Color.black)
            .foregroundColor(.white)
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ConjugationDetails: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Infinito:").bold()
                Text(" ").italic()
            }
            HStack {
                Text("Gerundio:").bold()
                Text(" ").italic()
            }
            HStack {
                Text("Passato:").bold()
                Text(" ").italic()
            }
        }
        .padding(.horizontal)
    }
}

struct ConjugationTable: View {
    let tenses = ["Presente", "Imperfetto", "Remoto", "Futuro", "Congiuntivo", "Cng Imperf", "Condizionale", "Imperative"]
    let persons = ["io", "tu", "lei / lui", "noi", "voi", "loro"]
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .leading, spacing: 0) {
                
                // Header Row
                HStack(spacing: 0) {
                    tableCell("Persona", bold: true)
                    ForEach(tenses, id: \.self) { tense in
                        tableCell(tense, bold: true)
                    }
                }

                // Data Rows
                ForEach(persons, id: \.self) { person in
                    HStack(spacing: 0) {
                        tableCell(person, italic: true)
                        ForEach(tenses.indices, id: \.self) { _ in
                            tableCell("-") // Replace "-" with actual data
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    private func tableCell(_ text: String, bold: Bool = false, italic: Bool = false) -> some View {
        let font: Font = bold ? .headline : (italic ? .body.italic() : .body)

        Text(text)
            .font(font)
            .frame(minWidth: 100, minHeight: 40)
            .multilineTextAlignment(.center)
            .border(Color.white, width: 1)
    }
}
