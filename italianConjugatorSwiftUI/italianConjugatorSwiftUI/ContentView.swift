//
//  ContentView.swift
//  italianConjugatorSwiftUI
//
//  Created by Keith Nagle on 24/04/2025.
//

import SwiftUI

struct ContentView: View {
    var mainText = "Hello";
    var dictionary: Dictionary<String, Dictionary<String, String>>?
    init(mainText: String = "Hello", dictionary:Dictionary<String, Dictionary<String, String>>?) {
        
        self.dictionary = dictionary
        self.mainText = (self.dictionary?["andare"]?["IPRF.IND.3PL"] ?? "nothing").capitalized;
    }
    
    var body: some View {
        return VStack {
//            Image(systemName: "magnifyingglass")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
            ConjugatorView()
        }
        .padding()
    }
}
