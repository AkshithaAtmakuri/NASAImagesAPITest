//
//  ImageSaver.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import UIKit

class ImageSaver: NSObject, ImageSaverProtocol {
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}
