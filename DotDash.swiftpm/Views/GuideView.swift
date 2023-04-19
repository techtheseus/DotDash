import SwiftUI

struct GuideView: View {
    
    var body: some View {
        ScrollView {
            VStack{
                Image("DotDash-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 600, height: 100)
            }
            .padding(20)
            VStack {
                Text("A Brief Guide to Morse Code")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                Text("""
                    Morse code — Language of Dots and Dashes.
                     Morse code is a communication system that uses a series of dots, dashes, and spaces to represent letters, numbers, and punctuation. It was invented by Samuel Morse and Alfred Vail in the early 1830s and was widely used for telegraph communication until the advent of more advanced technologies.
                    Morse code is not only a historic communication system, but it also serves as an excellent starting point for those interested in cryptography or cyphers. Learning Morse code is a straightforward process, and it can help beginners understand the fundamental concepts of cryptography, including encryption, decryption, and the importance of randomness. By mastering Morse code, one can gain valuable insights into how communication systems work and learn to think critically about the security of data transmission.
                    """)
                .modifier(TextModifer())
            }
            .padding(20)
            VStack {
                Text("⁉️ How Morse Code Works")
                    .modifier(TitleModifer())
                Text("")
                Text("""
                Each letter, number, and punctuation mark in Morse code is represented by a unique combination of dots, dashes, and spaces. For example, the letter A is represented by a dot followed by a dash, while the letter B is represented by a dash followed by three dots. Spaces are used to separate letters and words.
                
                Morse code can be transmitted using a variety of methods, including sound, light, and radio waves. In sound-based Morse code, the dots and dashes are represented by short and long sounds, respectively. In light-based Morse code, the dots and dashes are represented by short and long flashes of light. In radio-based Morse code, the dots and dashes are represented by short and long beeps of radio waves.
                """)
                .modifier(TextModifer())
            }
            .modifier(NeumorphicStyleModifier())
            .padding(20)
            VStack {
                Text("⏳ History and Uses of Morse Code")
                    .modifier(TitleModifer())
                Text("")
                Text("""
                Morse code was first used for long-distance communication via telegraph wires in the 1840s. It quickly became the standard method of communication for telegraph operators, and remained in use until the 1960s when it was largely replaced by newer technologies.
                
                Despite its decline in popularity, Morse code is still used today in a variety of contexts. For example, it is still used by amateur radio operators and is taught as a backup communication method to pilots and other professionals. Morse code has also been used in art and music, with artists and musicians incorporating the dots and dashes into their works.
                """)
                .modifier(TextModifer())
            }
            .modifier(NeumorphicStyleModifier())
            .padding(20)
            VStack {
                Text("🧑‍🏫 Learning Morse Code")
                    .modifier(TitleModifer())
                Text("")
                Text("""
                Learning Morse code is not difficult, but it does require practice and dedication. There are many resources available online for those interested in learning, including apps, websites, and courses. Some people find it helpful to practice with a partner or to use a Morse code key, which allows them to send and receive messages in real time.
                """)
                .modifier(TextModifer())
            }
            .modifier(NeumorphicStyleModifier())
            .padding(20)
            VStack {
                Text("🎬 Conclusion")
                    .modifier(TitleModifer())
                Text("")
                Text("""
                Morse code may no longer be the primary method of communication it once was, but its influence can still be felt in many areas of modern life. Whether you are interested in history, technology, or art, learning Morse code can be a fascinating and rewarding experience.
                """)
                .modifier(TextModifer())
            }
            .modifier(NeumorphicStyleModifier())
            .padding(20)
            Text("")
        }
        .modifier(NavigationModifier())
    }
}
