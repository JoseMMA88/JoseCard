//
//  ContentView.swift
//  JoseCard
//
//  Created by Jose Manuel Malagón Alba on 16/7/24.
//

import SwiftUI
import PhotosUI
import ImagePlayground

struct ContentView: View {
    
    // MARK: - Properties
    @Environment(\.supportsImagePlayground) var supportImagePlayground
    @State private var imageGenerationConcept = ""
    @State private var isShowingImagePlayground: Bool = false
    
    @State private var avatarImage: Image?
    @State private var photosPickerItem: PhotosPickerItem?
    
    var body: some View {
        ZStack {
            Color(red: 0, green: 124/255, blue: 237/255)
                .ignoresSafeArea(.all)
            VStack {
                PhotosPicker(selection: $photosPickerItem,
                             matching: .not(.screenshots)) {
                    (avatarImage ?? Image("jose"))
                        .resizable()
                        .foregroundStyle(.mint)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color(.white), lineWidth: 5))
                }
                
                Text("Jose Manuel Malagón")
                    .font(Font.custom("Pacifico-Regular", size: 28))
                    .bold()
                    .foregroundColor(.white)
                
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                
                Divider()
                
                InfoView(imageName: "phone.fill",
                         infoTextString: "+34 680 532 032")
                
                InfoView(imageName: "envelope.fill",
                         infoTextString: "contact@josemalagon.es")
                
                if supportImagePlayground {
                    TextField("Enter avatar description", text: $imageGenerationConcept)
                        .font(.title3.bold())
                        .padding()
                        .background(.quaternary,
                                    in: .rect(cornerRadius: 16, style: .continuous))
                    
                    Button("Generate Image", systemImage: "sparkles") {
                        isShowingImagePlayground = true
                    }
                    .padding()
                    .foregroundStyle(.mint)
                    .fontWeight(.bold)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(.mint, lineWidth: 3)
                    )
                }
                
            }
            .onChange(of: photosPickerItem) {
                Task {
                    if let photosPickerItem,
                       let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: data) {
                            avatarImage = Image(uiImage: image)
                        }
                    }
                }
            }
            .imagePlaygroundSheet(isPresented: $isShowingImagePlayground,
                                  concept: imageGenerationConcept,
                                  sourceImage: avatarImage) { url in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        avatarImage = Image(uiImage: image)
                    }
                }
            } onCancellation: {
                imageGenerationConcept = ""
            }
        }
    }
}

#Preview {
    ContentView()
}
