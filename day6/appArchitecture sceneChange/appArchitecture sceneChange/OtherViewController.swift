//
//  OtherViewController.swift
//  appArchitecture sceneChange
//
//  Created by Tacademy-Mac on 2017. 1. 9..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {

    @IBAction func showSceneA(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SceneA")
        self.view.window?.rootViewController = vc
    }

}
