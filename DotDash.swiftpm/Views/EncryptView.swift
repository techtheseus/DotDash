import SwiftUI
import Combine
import UIKit
import Subsonic

struct EncryptView: View {
    
    @State private var plainText = ""
    @State private var morseText = ""
    let morseLogic = MorseLogic()

    @StateObject private var dotSound = SubsonicPlayer(sound: "dot.wav")
    @StateObject private var dashSound = SubsonicPlayer(sound: "dash.wav")
    
    func playSoundForMorseText() async throws {
        for char in morseText {
            if char == "." {
                 dotSound.play()
            } else if char == "-" {
                 dashSound.play()
            }
            try await Task.sleep(nanoseconds: 500_000_000)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Enter your message:")
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .padding()
                HStack {
                    Image(systemName: "textformat.abc.dottedunderline")
                    TextField("", text: $plainText)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.offWhite)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            }
            
            NeumorphicAsyncButton(
                action: {
                    try await Task.sleep(nanoseconds: 3 * 1_000_000_000)
                    morseText = morseLogic.encodePlainText(plainText)
                    return "done"
                },
                text: "Encrypt",
                icon: "lock"
            )
            .padding()
            HStack {
                Text("Encrypted Message:")
                    .fontWeight(.bold)
                    .padding()
                Text("\(morseText)")
                    .padding()
                    .foregroundColor(.gray)
            }
            .padding()
            HStack(spacing: 100) {
                Button("Copy", action: {
                    let pasteboard = UIPasteboard.general
                    pasteboard.string = morseText
                })
                .buttonStyle(NeumorphicButton(shape: RoundedRectangle(cornerRadius: 50)))
                .foregroundColor(.blue)
                Button(action: {Task.detached { try await playSoundForMorseText() }}) {
                    HStack{
                        Text("Listen")
                        Image(systemName: "speaker.badge.exclamationmark")
                            .foregroundColor(.red)
                    }
                }
                .buttonStyle(NeumorphicButton(shape: RoundedRectangle(cornerRadius: 10)))
                
                
            }
        }
        .modifier(NeumorphicStyleModifier())
    }
}
