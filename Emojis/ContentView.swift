import SwiftUI

enum Emoji: String, CaseIterable, Identifiable {
    case poop = "💩"
    case ogre = "👹"
    case mask = "😷"
    case devil = "😈"
    case rocket = "🚀"

    var id: String { self.rawValue }

    var description: String {
        switch self {
        case .poop: return "Just having a bad day!"
        case .ogre: return "Feeling monstrous"
        case .mask: return "Stay safe, wear a mask"
        case .devil: return "A little mischievous"
        case .rocket: return "To the moon!"
        }
    }
}

struct ContentView: View {
    @State private var selection: Emoji = .rocket
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        NavigationView {
            VStack {
                Toggle(isOn: $isDarkMode, label: {
                    Text("Enable Dark Mode")
                })
                .padding()

                Text(selection.rawValue)
                    .font(.system(size: 150))

                Text(selection.description)
                    .font(.title)
                    .padding()

                Picker("Select Emoji", selection: $selection) {
                    ForEach(Emoji.allCases) { emoji in
                        Text(emoji.rawValue).tag(emoji)
                    }
                }
                .pickerStyle(.segmented)
            }
            .navigationTitle("Emoji Picker!")
            .padding()
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
