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
            picker.dismiss(animated: true)
            let storyboard: UIStoryboard = self.storyboard!
            let second = storyboard.instantiateViewController(withIdentifier: "edit")
            self.present(second, animated: true, completion: nil)
        }
    }
}

