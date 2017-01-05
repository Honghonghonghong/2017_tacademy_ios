//
//  ViewController.swift
//  gridScene
//
//  Created by Tacademy-Mac on 2017. 1. 5..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, MyCellDelegate {
    var nations : [Dictionary<String,String>]!
    
    func check(name: String) {
        let dialog = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
        
        self.present(dialog, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nations.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! myCell
        
        cell.delegate = self
        
        cell.name = nations[indexPath.item]["NAME"]!
//        cell.btn.setTitle("\(indexPath.row)", for: .normal)
        cell.flagImage.image = UIImage(named: nations[indexPath.item]["IMAGE"]!)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nations = [
            [ "NAME":"Korea", "IMAGE":"Korea.png" ],
            [ "NAME":"Japan", "IMAGE":"Japan.png" ],
            [ "NAME":"Philippines", "IMAGE":"Philippines.png" ],
            [ "NAME":"Thailand", "IMAGE":"Thailand.png" ],
            [ "NAME":"Vietnam", "IMAGE":"Vietnam.png" ],
            [ "NAME":"Denmark", "IMAGE":"Denmark.png" ],
            [ "NAME":"Germany", "IMAGE":"Germany.png" ],
            [ "NAME":"Greece", "IMAGE":"Greece.png" ],
            [ "NAME":"Italy", "IMAGE":"Italy.png" ],
            [ "NAME":"Norway", "IMAGE":"Norway.png" ],
            [ "NAME":"Spain", "IMAGE":"Spain.png" ],
            [ "NAME":"Turkey", "IMAGE":"Turkey.png" ],
            [ "NAME":"United Kingdom", "IMAGE":"United_Kingdom.png" ]
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

