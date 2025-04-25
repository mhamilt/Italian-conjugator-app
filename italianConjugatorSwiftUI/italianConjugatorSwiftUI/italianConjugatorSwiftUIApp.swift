//
//  italianConjugatorSwiftUIApp.swift
//  italianConjugatorSwiftUI
//
//  Created by Keith Nagle on 24/04/2025.
//

import SwiftUI

@main
struct italianConjugatorSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(dictionary: getVerbDictionaryFromJsonFile())
        }
    }
    
    func getVerbDictionaryFromJsonFile() -> Dictionary<String, Dictionary<String, String>>? {

        guard let fileUrl = Bundle.main.url(forResource: "verbs", withExtension: "json") else {
            print("File could not be located at the given url")
            return nil
        }

        do {
            let data = try Data(contentsOf: fileUrl)
            
            // Decode data to a Dictionary<String, Any> object
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, Dictionary<String, String>> else {
                print("Could not cast JSON content as a Dictionary<String, Any>")
                return nil
            }
            
            return dictionary;
            
        } catch {
            print("Error: \(error)")
            return nil;
        }
    }
}
