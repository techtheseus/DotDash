import SwiftUI

struct AboutMeView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                VStack{
                    Image("pfp")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.white)
                        .padding(20)
                        .background(Color.offWhite)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                }
                .padding(20)
                Text("Hi! I'm Vaibhav 👋")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
            }
            .padding(20)
            VStack {
                Text("""
                I am a final year undergraduate student studying Computer Science and Engineering from LPU in India. I recently developed an interest in building iOS apps, and I have been honing my skills in this area. I am particularly passionate about creating beautiful user interfaces that are both intuitive and functional. I believe that a well-designed app can make a significant impact on user experience and satisfaction.
                
                In addition to app development, I am also passionate about cybersecurity, particularly cryptography and cyphers(shoutout to one of my favourite movies - The Imitation Game), that's partly what inspired me to build this app. I ranked #6 All India in a Capture The Flag competition conducted by BIT Mersa, and have been exploring different aspects of this field. I believe that a strong understanding of cybersecurity is becoming increasingly important in our digital age, and I am committed to staying up-to-date with the latest developments in this area.
                
                In my free time, I enjoy playing chess, I recently played for my University in the North-Zone Inter-University Chess championship conducted by AIU. I also enjoy experimenting with new programming languages and frameworks. I am always looking for opportunities to learn and grow as a developer, and I am excited to see where my passion for technology will take me in the future.
                """)
                .modifier(TextModifer())
            }
            .modifier(NeumorphicStyleModifier())
            .padding(20)
        }
        .modifier(NavigationModifier())
    }
}
