//
//  ContentView.swift
//  PHPicker
//
//  Created by Javier Galera Robles on 1/6/22.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    @State var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .frame(width: 300.0, height: 300.0, alignment: .center)
                    .cornerRadius(30.0)
            } else {
                VStack {
                    Spacer()
                    Text("No image selected")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            
            Spacer()
            
            Button("Select photo") {
                isPresented.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $isPresented) {
            let configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
            PhotoPicker(configuration: configuration) { image in
                selectedImage = image
            }
        }
    }
    
    // Add PHPicker configuration
    var pickerConfiguration: PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.filter = .images
        config.selectionLimit = 10
        return config
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
