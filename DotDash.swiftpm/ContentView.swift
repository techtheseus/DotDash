import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Welcome 🌻")) {
                    NavigationLink(destination: GuideView()) {
                        Label("Guide to Morse", systemImage: "text.book.closed")
                    }
                    NavigationLink(destination: AboutDotDashView()) {
                        Label("About DotDash", systemImage: "info.circle.fill")
                    }
                }
                Section(header: Text("Features 🍀")) {
                    NavigationLink(destination: LiveTranscribeView()) {
                        Label("Live Transcribe", systemImage: "camera.metering.spot")
                    }
                    NavigationLink(destination: EncryptView()) {
                        Label("Encrypt", systemImage: "rectangle.and.pencil.and.ellipsis")
                    }
                    NavigationLink(destination: DecryptView()) {
                        Label("Decrypt", systemImage: "textformat.abc.dottedunderline")
                    }
                }
                Section(header: Text("Notes ❤️")) {
                    NavigationLink(destination: ProspectView()) {
                        Label("Future Prospects", systemImage: "pencil.and.outline")
                    }
                    NavigationLink(destination: AboutMeView()) {
                        Label("About Me", systemImage: "person.badge.shield.checkmark")
                    }
                }
            }
            .modifier(NavigationModifier())
            .navigationTitle("DotDash")
        }
        
    }
}
