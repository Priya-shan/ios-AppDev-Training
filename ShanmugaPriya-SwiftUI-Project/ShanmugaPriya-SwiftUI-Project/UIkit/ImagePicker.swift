//
//  ImagePicker.swift
//  YaswanthSwiftUIProject
//
//  Created by Yaswanth on 18/10/23.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    @Binding var selectedImage : UIImage
    @Binding var imagePath : String
    var sourceType : UIImagePickerController.SourceType = .photoLibrary
    
    @Environment(\.presentationMode) var presentationMode
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
        var parent : ImagePicker
        init(_ parent : ImagePicker) {
            self.parent = parent
        }
        
        override func didChangeValue(forKey key: String) {
            parent.presentationMode.wrappedValue.dismiss()
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[.originalImage] as? UIImage{
                parent.selectedImage = image;
            }
            if let imagePath = info[.imageURL] as? NSURL{
                parent.imagePath = imagePath.absoluteString!
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
