import SwiftUI
import Subsonic

struct NeumorphicStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .NeumorphicStyle()
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.offWhite)
            .ignoresSafeArea()
    }
}

struct NavigationModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.offWhite)
    }
}

extension View {
    func NeumorphicStyle() -> some View {
        self.padding(30)
            .frame(maxWidth: .infinity)
            .background(Color.offWhite)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
    }
}

struct TitleModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TextModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .font(.title)
            .font(.body)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct NeumorphicButton<S: Shape>: ButtonStyle {
    var shape: S
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(15)
            .background(Background(isPressed: configuration.isPressed, shape: shape))
    }
}
struct Background<S: Shape>: View {
    var isPressed: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isPressed {
                shape
                    .fill(Color.offWhite)
                    .overlay(
                        shape
                            .stroke(Color.gray, lineWidth: 3)
                            .blur(radius: 4)
                            .offset(x: 2, y: 2)
                            .mask(shape.fill(LinearGradient(Color.black, Color.clear)))
                    )
                    .overlay(
                        shape
                            .stroke(Color.white, lineWidth: 3)
                            .blur(radius: 4)
                            .offset(x: -2, y: -2)
                            .mask(shape.fill(LinearGradient(Color.clear, Color.black)))
                    )
            } else {
                shape
                    .fill(Color.offWhite)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            }
        }
    }
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct NeumorphicAsyncButton: View {
    var action: () async throws -> String
    
    var text: String
    var icon: String
    
    @State private var isPerformingTask = false
    @State private var isCompleted = false
    
    var body: some View {
        Button(
            action: {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.5)) {
                    isPerformingTask = true
                }
                Task {
                    let state = try await action()
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.5)) {
                        isPerformingTask = false
                        isCompleted = true
                    }
                    print(state)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.5)) {
                            isCompleted = false
                        }
                    }
                }
            },
            label: {
                HStack(spacing: 20) {
                    if !isPerformingTask && !isCompleted {
                        Text(text.uppercased())
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                    if isPerformingTask && !isCompleted{
                        DotProgressView()
                    }
                }
                .foregroundColor(isCompleted ? Color.pink : Color.gray)
                .opacity(isPerformingTask ? 0.5 : 1)
                .padding(.horizontal, isCompleted && !isPerformingTask ? 0 : 15)
            }
        )
        .buttonStyle(NeumorphicButton(shape: RoundedRectangle(cornerRadius: 20)))
        .disabled(isPerformingTask || isCompleted)
    }
}

struct Dot: View {
    var y: CGFloat
    
    var body: some View {
        Circle()
            .frame(width: 8, height: 8, alignment: .center)
            .opacity(y == 0 ? 0.1 : 1)
            .offset(y: y)
            .foregroundColor(.gray)
    }
}

struct DotProgressView: View {
    @State private var y: CGFloat = 0
    
    var body: some View {
        HStack{
            Dot(y: y)
                .animation(.easeInOut(duration: 0.5).repeatForever().delay(0), value: y)
            Dot(y: y)
                .animation(.easeInOut(duration: 0.5).repeatForever().delay(0.2), value: y)
            Dot(y: y)
                .animation(.easeInOut(duration: 0.5).repeatForever().delay(0.4), value: y)
        }
        .onAppear{y = -10}
    }
}
