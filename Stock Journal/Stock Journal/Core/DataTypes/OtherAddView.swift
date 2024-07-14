import SwiftUI
import AVKit

struct OtherAddView: View {
    @State private var textFieldText: String = ""
    @State private var selectedOption = "None"
    @State private var player: AVPlayer?
    @State private var isVideoAdded = false // Track if a video is added

    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()

            VStack {
                Text("Untitled")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)

                Spacer().frame(height: 100)

                if !isVideoAdded {
                    // Display input field and "Add" button when video is not added
                    TextField("Insert Your Video URL", text: $textFieldText)
                        .padding(.horizontal)
                        .frame(height: 50)
                        .background(Color(.gray))
                        .cornerRadius(10)

                    Button(action: {
                        // Validate the URL and create the player
                        if let videoURL = URL(string: textFieldText) {
                            player = AVPlayer(url: videoURL)
                            player?.play()
                            isVideoAdded = true
                        }
                    }) {
                        Text("Add Video".uppercased())
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color(.blue))
                            .cornerRadius(10)
                    }
                } else {
                    // Display the video player
                    VideoPlayer(player: player!)
                        .frame(height: 200)

                    // Display "Save" button when video is added
                    Button(action: {
                        // Perform the save action
                    }) {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color(.blue))
                            .cornerRadius(10)
                    }
                }

                VStack {
                    Text("Add Tags")
                        .foregroundColor(.white)
                    Picker("Choose an option", selection: $selectedOption) {
                        Text("None").tag("None")
                        Text("Option 2").tag("Option 2")
                        Text("Option 3").tag("Option 3")
                    }
                }
                .frame(width: 200, height: 100)
                .padding(.top, 80)

                Spacer()
            }
            .padding(30)
            .padding(.top, 20)
        }
    }
}

struct OtherAddView_Previews: PreviewProvider {
    static var previews: some View {
        OtherAddView()
    }
}

