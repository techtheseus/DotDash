import SwiftUI
import Combine
import UIKit
import Subsonic

struct DecryptView: View {
    
    @State private var morseCodeInput = ""
    @State private var decodedMessage = ""
    private let morseLogic = MorseLogic()
    
     @State private var isNextButtonTapped = false
    
    var body: some View {
        VStack(spacing: 50)  {
            VStack{
                HStack {
                    Text("Enter morse code:")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        .padding()
                    HStack {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                        TextField("", text: $morseCodeInput)
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
                        try await Task.sleep(nanoseconds: 3 * 1_000_000_000)  // Three seconds
                        decodedMessage = morseLogic.decodeMorseCode(morseCodeInput)
                        return "done"
                    },
                    text: "Decrypt",
                    icon: "doc.text.magnifyingglass"
                )
                .padding()
                HStack {
                    Text("Decrypted Message:")
                        .fontWeight(.bold)
                        .padding()
                    Text("\(decodedMessage)")
                        .padding()
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.offWhite)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            
            NavigationLink(
                destination: ProspectView(),
                isActive: $isNextButtonTapped,
                label: { EmptyView() }
            )
            .hidden()
            
            Button(action: {
                isNextButtonTapped = true
            }) {
                HStack{
                    Text("Next")
                    Image(systemName: "arrowshape.right")
                        .foregroundColor(.green)
                }
            }
            .buttonStyle(NeumorphicButton(shape: RoundedRectangle(cornerRadius: 10)))
        }
        .modifier(NeumorphicStyleModifier())
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
}
