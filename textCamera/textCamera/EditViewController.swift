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
        let size = CGSize(width: self.size.width, height: self.size.height + 30)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.red.cgColor)
        context!.fill(CGRect(origin: CGPoint.zero, size: size))
        self.draw(in: CGRect(x: 0, y: 30, width: self.size.width, height:self.size.height ))
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        return image
    }
}

class EditViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var getPicture: UIImageView!
    @IBOutlet weak var textField: UITextField!
    // 画像を受け取る変数
    var receivedImage: UIImage?
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getPicture.image = receivedImage?.composite(image: receivedImage!)
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
