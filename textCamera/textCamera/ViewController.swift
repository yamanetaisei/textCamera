//
//  ViewController.swift
//  textCamera
//
//  Created by 山根大生 on 2020/03/06.
//  Copyright © 2020 taisei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let topColor = UIColor(red:0.07, green:0.13, blue:0.26, alpha:1)
        let bottomColor = UIColor(red:0.54, green:0.74, blue:0.74, alpha:1)
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

    @IBAction func goLibrary(_ sender: Any) {
        let ipc = UIImagePickerController()
        ipc.delegate = self
        ipc.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(ipc,animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if info[.originalImage] != nil{
            //選んだ画像を変数に代入
            let image = info[.originalImage] as! UIImage
            //写真フォルダを閉じる
            picker.dismiss(animated: true)
            //遷移
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier: "edit") as! EditViewController
            //next(遷移先)のreceivedImage変数へ選んだ写真を代入
            next.receivedImage = image
            self.present(next, animated: true, completion: nil)
        }
    }
        
    @IBAction func goCamera(_ sender: Any) {
        let camera = UIImagePickerController.SourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(camera){
            let picker = UIImagePickerController()
            picker.sourceType = camera
            picker.delegate = self
            self.present(picker, animated: true)
        }
    }
}
