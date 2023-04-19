import SwiftUI
import Foundation 

final class MorseLogic: ObservableObject {
    
    func decodeMorseCode(_ morseCodeInput: String) -> String {
        let characters = morseCodeInput.split(separator: " ")
        var decodedString = ""
        
        for character in characters {
            if let letter = decodeMorseCodeDictionary[String(character)] {
                decodedString += letter
            } else {
                decodedString += " "
            }
        }
        
        return decodedString
    }
    
    func encodePlainText(_ plaintext: String) -> String {  
        var encodedString = ""
        
        for character in plaintext.lowercased() {
            if let morseCode = encodeMorseCodeDictionary[String(character)] {
                encodedString += morseCode + " "
            }
        }
       
        return encodedString
    }
}


