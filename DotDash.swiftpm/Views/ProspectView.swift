import SwiftUI

struct ProspectView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Future Prospects of DotDash")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                Text("""
                    DotDash has a lot of potential to become one of the most, if not THE most used Morse code app out there. With the features planned for future updates, the app is expected to see great optimisation in code and offer better usability. Some potential future prospects for the app include: 
                    """)
                .modifier(TextModifer())
            }
            .padding(20)
            VStack {
                Text("Augumented 3D Modeled Telegraph Key 🤯")
                    .modifier(TitleModifer())
                    .padding()
                Text("""
                With RealityKit the app can let users place a 3D model of a telegraph key device and let them virtually tap the key to produce input to make it a more fun and interactive experience.
                """)
                .modifier(TextModifer())
            }
            .modifier(NeumorphicStyleModifier())
            .padding(20)
            VStack {
                Text("Magic with CoreML 🤖")
                    .modifier(TitleModifer())
                    .padding()
                Text("""
                The app can use CoreML to recognise different signal inputs with varying frequencies provided by the user to produce faster and better results over time. It can also include a Live Transcribe feature that uses devices camera to recognise Light based morse-code signals and decode it in real-time.
                """)
                .modifier(TextModifer())
            }
            .modifier(NeumorphicStyleModifier())
            .padding(20)
            VStack {
                Text("Multiplayer Mode 👯‍♀️")
                    .modifier(TitleModifer())
                    .padding()
                Text("""
                The app could introduce a multiplayer mode where users can communicate with each other using Morse code. This could be a unique and exciting feature that could let more people try the app.
                """)
                .modifier(TextModifer())
            }
            .modifier(NeumorphicStyleModifier())
            .padding(20)
            VStack {
                Text("""
                Overall, the DotDash has a promising future, and its success will depend on its ability to innovate and provide a unique value proposition to its users.
                """)
                .modifier(TextModifer())
                .padding()
            }
            
        }
        .modifier(NavigationModifier())
    }
}
