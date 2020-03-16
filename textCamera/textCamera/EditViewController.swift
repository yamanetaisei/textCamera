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
        let size = CGSize(width: self.size.width, height: self.size.height + self.size.height/10)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.red.cgColor)
        context!.fill(CGRect(origin: CGPoint.zero, size: size))
        self.draw(in: CGRect(x: 0, y: self.size.height/10, width: self.size.width, height:self.size.height ))
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        return image
    }
}

class EditViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var getPicture: UIImageView!
    @IBOutlet weak var textField: UITextField!
    // 画像を受け取る変数
    var receivedImage: UIImage?
    var useText: String!
    
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
        useText = textField.text
        //textFieldを空にする
//        textField.text = ""
        // キーを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func createButton(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let next = storyboard.instantiateViewController(withIdentifier: "check")
        self.present(next, animated: true, completion: nil)
    }
    
    func createImage(image :UIImage) ->UIImage{
        let font = UIFont.boldSystemFont(ofSize: 32)
        let textRect = CGRect(x: 5, y: 5, width: image.size.width - 5, height: image.size.height - 5)
        let textStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        let textFontAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.paragraphStyle: textStyle
        ]
        useText.draw(in: textRect, withAttributes: textFontAttributes)
        let newImage = image
        return newImage
    }
}
