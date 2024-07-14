import SwiftUI
import AVKit
import AVFoundation

struct BookAddView: View {
    @State private var selectedOption = "None"
    @State private var selectedVideoURL: URL?
    @State private var isVideoPickerPresented = false
    @State private var startTime: Double = 0.0
    @State private var endTime: Double = 0.0

    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()

            VStack {
                Text("Untitled")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)

                Spacer().frame(height: 200)

                if let selectedVideoURL = selectedVideoURL {
                    VideoPlayerView(videoURL: selectedVideoURL, startTime: $startTime, endTime: $endTime)
                        .frame(height: 200)
                } else {
                    Button(action: {
                        // Show video picker when the "Select Video" button is tapped
                        isVideoPickerPresented = true
                    }) {
                        Text("Select Video")
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
        .sheet(isPresented: $isVideoPickerPresented) {
            VideoPicker(selectedVideoURL: $selectedVideoURL, isVideoPickerPresented: $isVideoPickerPresented)
        }
    }
}

struct VideoPlayerView: View {
    let videoURL: URL
    @Binding var startTime: Double
    @Binding var endTime: Double

    var body: some View {
        VStack {
            VideoPlayer(player: createPlayer())
                .onAppear {
                    // Initialize the player when the view appears
                    // You can set the player properties here
                }
            HStack {
                Text("Start Time: \(formatTime(startTime))")
                Text("End Time: \(formatTime(endTime))")
            }
            Slider(value: $startTime, in: 0...endTime, onEditingChanged: { _ in
                updatePlayer()
            })
            Slider(value: $endTime, in: startTime...Double.greatestFiniteMagnitude, onEditingChanged: { _ in
                updatePlayer()
            })
        }
    }

    private func formatTime(_ time: Double) -> String {
        return String(format: "%.2f", time)
    }

    private func createPlayer() -> AVPlayer {
        let player = AVPlayer(url: videoURL)

        let playerItem = player.currentItem
        playerItem?.forwardPlaybackEndTime = CMTime(seconds: endTime, preferredTimescale: 600)
        playerItem?.reversePlaybackEndTime = CMTime(seconds: startTime, preferredTimescale: 600)

        return player
    }

    private func updatePlayer() {
        // Update the player based on the startTime and endTime
    }
}

struct VideoPicker: UIViewControllerRepresentable {
    @Binding var selectedVideoURL: URL?
    @Binding var isVideoPickerPresented: Bool

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: VideoPicker

        init(_ parent: VideoPicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let videoURL = info[.mediaURL] as? URL {
                parent.selectedVideoURL = videoURL
            }
            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.mediaTypes = ["public.movie"]
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

