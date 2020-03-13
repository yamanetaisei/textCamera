//
//  EditViewController.swift
//  textCamera
//
//  Created by 山根大生 on 2020/03/06.
//  Copyright © 2020 taisei. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    //写真とテロップを合成する
    func composite(image :UIImage) -> UIImage?{
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        let rect = CGRect(x: 0,y: 0,width: image.size.width,height: image.size.height)
        image.draw(in: rect)
         let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

class EditViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var getPicture: UIImageView!
    @IBOutlet weak var textField: UITextField!
    // 画像を受け取る変数
    var image: UIImage?
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getPicture.image = image
        // delegateを設定
        textField.delegate = self
    }
    // キーボードのreturnが押された際に呼ばれる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        // textへ入力した文字列を代入する
        text = textField.text
        //textFieldを空にする
        textField.text = ""
        // キーを閉じる
        textField.resignFirstResponder()
        return true
    }
}
