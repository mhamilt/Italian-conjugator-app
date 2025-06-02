//
//  ContentView.swift
//  italianConjugatorSwiftUI
//
//  Created by Keith Nagle on 24/04/2025.
//

import SwiftUI

struct ContentView: View {
    
    var dictionary: Dictionary<String, Dictionary<String, String>>?
    
    init(dictionary:Dictionary<String, Dictionary<String, String>>?) {
        self.dictionary = dictionary
    }
    
    @Environment(\.horizontalSizeClass) var sizeCategory
    
    var body: some View {
        return VStack {
            ConjugatorView(dictionary:dictionary)
        }
        .background(.black)
        .padding()
    }
}
