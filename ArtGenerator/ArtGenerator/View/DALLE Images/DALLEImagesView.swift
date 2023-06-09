//
//  ContentView.swift
//  ArtGenerator
//
//  Created by Marcin Dytko on 24/05/2023.
//

import SwiftUI

struct DALLEImagesView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if !vm.urls.isEmpty {
                    HStack {
                        ForEach(vm.dallEImages) { dalleImage in
                            if let uiImage = dalleImage.uiImage {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .onTapGesture {
                                        vm.selectedImage = uiImage
                                    }
                            } else {
                                ProgressView()
                            }
                        }
                    }
                }
                if !vm.fetching {
                    if !vm.urls.isEmpty {
                        Text("Select an image")
                        if let selectedImage = vm.selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 256, height: 256)
                        }
                    }
                    if vm.urls.isEmpty {
                        Text("The more descriptive you can be the better")
                        TextField("Image description", text: $vm.prompt, axis: .vertical)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                        
                        Form {
                            Picker("Style", selection: $vm.imageStyle) {
                                ForEach(ImageStyle.allCases, id: \.self) { imageStyle in
                                    Text(imageStyle.rawValue)
                                }
                            }
                            
                            Picker("Medium", selection: $vm.imageMedium) {
                                ForEach(ImageMedium.allCases, id: \.self) { imageMedium in
                                    Text(imageMedium.rawValue)
                                }
                            }
                            
                            Picker("Style", selection: $vm.artist) {
                                ForEach(Artist.allCases, id: \.self) { artist in
                                    Text(artist.rawValue)
                                }
                            }
                            HStack {
                                Spacer()
                                Button("Featch") {
                                    vm.fetchImages()
                                }
                                .disabled(vm.prompt.isEmpty)
                                .buttonStyle(.borderedProminent)
                            }
                            HStack {
                                Spacer()
                                if vm.urls.isEmpty || vm.selectedImage == nil {
                                    Image("Artist")
                                }
                                Spacer()
                            }
                        }
                  
                    } else {
                        Text(vm.description)
                            .padding()
                        Button("Try another") {
                            vm.reset()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    ProgressView()
                }
                if vm.selectedImage == nil && !vm.urls.isEmpty {
                    Image("Artist")
                }
                Spacer()
            }
            .navigationTitle("Art Generation")
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct DALLEImagesView_Previews: PreviewProvider {
    static var previews: some View {
        DALLEImagesView()
    }
}
