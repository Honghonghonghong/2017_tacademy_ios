//
//  ViewController.swift
//  cameraAndPhoto picker
//
//  Created by Tacademy-Mac on 2017. 1. 12..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit
import Photos

class PhtoCell: UICollectionViewCell {
    @IBOutlet weak var photoImage: UIImageView!
}

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBAction func showImagePicker(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        self.show(imagePicker, sender: nil)
    }
    
    var images = [UIImage]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PHOTO_CELL", for: indexPath) as! PhtoCell
        cell.photoImage.image = images[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    @IBAction func showPhoto(_ sender: UIBarButtonItem) {
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized:
            self.listAllImages()
        case .denied:
            let alert = UIAlertController(title: "앨범 접근을 허용해주세요", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(action)
            self.show(alert, sender: nil)
        case .notDetermined:
            print("NotDetermined - 권한 요청")
            PHPhotoLibrary.requestAuthorization({ (status : PHAuthorizationStatus) -> Void in
                print("사용자가 접근 권한 결정함 : \(status)")
                if status == .authorized {
                    self.listAllImages()
                }
        })
        case .restricted:
            let alert = UIAlertController(title: "접근 불가능", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(action)
            self.show(alert, sender: nil)
        }
    }
    func listAllImages() {
        images.removeAll()
        print(images.count)
        
        let option = PHFetchOptions()
        option.fetchLimit = 100
        let fetchResult: PHFetchResult<PHAsset> = PHAsset.fetchAssets(with: .image, options: option)
        
        if let firstAsset = fetchResult.firstObject {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            let creationDate = firstAsset.creationDate!
            let createDate = formatter.string(from: creationDate)
            print("First Image Created at \(createDate)")
            
        }
        
        let manger = PHImageManager.default()
        
        fetchResult.enumerateObjects({ (asset :PHAsset, index: Int, stop: UnsafeMutablePointer<ObjCBool>) in
            let size = CGSize(width: 100, height: 100)
            
            manger.requestImage(for: asset, targetSize: size, contentMode: .aspectFit, options: nil, resultHandler: { (image: UIImage?, info: [AnyHashable : Any]?) in
                self.images.append(image!)
                
                if fetchResult.count == self.images.count {
                    print("add all images")
                    OperationQueue.main.addOperation {
                        self.collectionView.reloadData()
                    }
                }
            })
        })
        
    }
    
}


//
//    func showAlbumList() {
//        let result : PHFetchResult<PHCollection> = PHAssetCollection.fetchTopLevelUserCollections(with: nil)
//        if let fetchedCollection = result as? PHFetchResult<PHAssetCollection> {
//            fetchedCollection.enumerateObjects({ (collection : PHAssetCollection, index : Int, stop : UnsafeMutablePointer<ObjCBool>) in
//                print(collection.localizedTitle)
//            })
//        }
//    }
//}
//
