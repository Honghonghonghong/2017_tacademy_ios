//
//  ViewController.swift
//  network syncAndAsync
//
//  Created by Tacademy-Mac on 2017. 1. 11..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var queue = OperationQueue()
    
    let urlStr = "http://upload.wikimedia.org/wikipedia/commons/4/4d/Klimt_-_Der_Kuss.jpeg"

    @IBAction func handleSync(_ sender: Any) {
        imageView.image = nil
        
        if let url = URL(string: urlStr) {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                self.imageView.image = image
            }
            catch let err {
                print(err)
            }
        }
    }
    
    class ImageDownloadThread: Thread {
        var imageView: UIImageView
        var url: URL
        init (url: URL, imageView: UIImageView) {
            self.url = url
            self.imageView = imageView
        }
        
        override func main() {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                
                self.performSelector(onMainThread: #selector(showImage(image:)), with: image, waitUntilDone: false)
            }
            catch let error {
                print(error)
            }
        }
        
        func showImage(image: UIImage) {
            self.imageView.image = image
        }
    }
    @IBAction func handleTread(_ sender: Any) {
        imageView.image = nil
        guard let url = URL(string: urlStr) else {
            return
        }
        
        let thread = ImageDownloadThread(url: url, imageView: imageView)
        thread.start()
    }
    
    @IBAction func handleOperation(_ sender: Any) {
        imageView.image = nil
        guard let url = URL(string: urlStr) else {
            return
        }
        
        queue.addOperation {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                
                OperationQueue.main.addOperation {
                    self.imageView.image = image
                }
                
            }
            catch let error {
                print(error)
            }
        }
    }
    
    @IBAction func handleTask(_ sender: Any) {
        imageView.image = nil
        
        guard let url = URL(string: urlStr) else {
            return
        }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) {
            (data: Data?, responds: URLResponse?, error: Error?) in
            if error != nil {
                print(error!)
                return
            }
            OperationQueue.main.addOperation {
                let image = UIImage(data: data!)
                self.imageView.image = image
            }
        }
        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


