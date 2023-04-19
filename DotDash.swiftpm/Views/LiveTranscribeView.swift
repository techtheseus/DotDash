import SwiftUI
import Subsonic
import Combine

struct LiveTranscribeView: View {
    
    @State private var morseCodeInput = ""
    @State private var decodedMessage = ""
    @State private var didLongPress = false
    @GestureState private var isDetectingLongPress = false
    @StateObject private var dotSound = SubsonicPlayer(sound: "dot.wav")
    @StateObject private var dashSound = SubsonicPlayer(sound: "dash.wav")
    private let morseLogic = MorseLogic()
    @State private var lastTapTime: Date?
    
    
    var body: some View {
        VStack (spacing: 50){
            VStack {
                    MorseCodeInput(morseCodeInput: morseCodeInput)
                    .padding()
                    DecodedMessage(decodedMessage: decodedMessage)
            }
            
            .padding()
            .frame(maxWidth: .infinity)
            
            HStack(spacing: 100) {
                morsePad
                delete
                clear
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(Color.offWhite)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            .padding()
            .frame(maxWidth: .infinity)
        }
        .modifier(NeumorphicStyleModifier())
        .onReceive(Just(morseCodeInput)) { input in
            decodedMessage = morseLogic.decodeMorseCode(input)
        }
    }
    
    var morsePad: some View {
        Button(action: {}) {
            Image(systemName: "exclamationmark.brakesignal")
                .foregroundColor(.blue)
        }
        .simultaneousGesture(LongPressGesture().onEnded { _ in
            dashSound.play()
            processTap("-")
        })
        .simultaneousGesture(TapGesture().onEnded {
            dotSound.play()
            processTap(".")
        })
        .buttonStyle(NeumorphicButton(shape: Circle()))
    }
    
    var delete: some View {
        Button(action: {if !morseCodeInput.isEmpty {
            morseCodeInput.removeLast()
        }}) {
            Image(systemName: "delete.left")
                .foregroundColor(.black)
        }
        .buttonStyle(NeumorphicButton(shape: Circle()))
    }
    
    var clear: some View {
        Button(action: {morseCodeInput = ""}) {
            Image(systemName: "clear")
                .foregroundColor(.red)
        }
        .buttonStyle(NeumorphicButton(shape: Circle()))
    }
    
    func MorseCodeInput(morseCodeInput: String) -> some View {
        Text("Morse Input: ")
            .foregroundColor(.black)
            .fontWeight(.bold) +
        Text("\(morseCodeInput)")
    }
    
    func DecodedMessage(decodedMessage: String) -> some View {
        Text("Decoded Message: ")
            .foregroundColor(.black)
            .fontWeight(.bold) +
        Text("\(decodedMessage)")
    }
    
    func processTap(_ character: String) {
        let currentTime = Date()
        if let lastTapTime = lastTapTime {
            let elapsed = currentTime.timeIntervalSince(lastTapTime)
            if elapsed > 3 {
                morseCodeInput += " "
            }
        }
        lastTapTime = currentTime
        morseCodeInput += character
    }
}
