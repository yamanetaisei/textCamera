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
    }

    @IBAction func goLibrary(_ sender: Any) {
        let ipc = UIImagePickerController()
        ipc.delegate = self
        ipc.sourceType = UIImagePickerController.SourceType.photoLibrary
        //編集を可能にする
        ipc.allowsEditing = true
        self.present(ipc,animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if info[.originalImage] != nil{
            //選んだ画像を変数に代入
            let image = info[.editedImage] as! UIImage
            //写真フォルダを閉じる
            picker.dismiss(animated: true)
            //遷移
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier: "edit") as! EditViewController
            //next(遷移先)のいimage変数へ選んだ写真を代入
            next.image = image
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
