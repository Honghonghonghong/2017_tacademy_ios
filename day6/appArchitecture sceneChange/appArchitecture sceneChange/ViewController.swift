//
//  ViewController.swift
//  appArchitecture sceneChange
//
//  Created by Tacademy-Mac on 2017. 1. 9..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func showSceneB(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Scene B")
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window!.rootViewController = vc
        }
    }

    @IBAction func showSceneC(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SceneC")
        self.view.window?.rootViewController = vc
    }

}


//// 같은 스토리보드 내 씬으로 전환
//@IBAction func showSceneB(_ sender: Any) {
//    let vc = self.storyboard?.instantiateViewController(withIdentifier: "SceneB")
//    if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
//        appDelegate.window!.rootViewController = vc
//    }
//}
//
////
//// 스토리보드 레퍼런스를 이용해서 분리한 스토리보드에 작성한 씬으로 전환
//@IBAction func showSceneC(_ sender: Any) {
//    let vc = self.storyboard?.instantiateViewController(withIdentifier: "SceneC")
//    self.view.window?.rootViewController = vc
//}

