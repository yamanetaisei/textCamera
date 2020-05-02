//
//  EditViewController.swift
//  textCamera
//
//  Created by 山根大生 on 2020/03/06.
//  Copyright © 2020 taisei. All rights reserved.
//

import Foundation
import UIKit


class EditViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var getPicture: UIImageView!
    @IBOutlet weak var textField: UITextField!
    // 画像を受け取る変数
    var receivedImage: UIImage?
    var useText: String!
    var baseImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let topColor = UIColor(hex: "#64b3f4")
               let bottomColor = UIColor(hex: "#c2e59c")
               let gradientColors: [CGColor] = [topColor!.cgColor, bottomColor!.cgColor]
               let gradientLayer: CAGradientLayer = CAGradientLayer()
               gradientLayer.colors = gradientColors
               gradientLayer.frame = self.view.bounds
               self.view.layer.insertSublayer(gradientLayer, at: 0)
        // Do any additional setup after loading the view.
        textField.placeholder = "表示したい文字を入力してください"
        baseImage = composite(image: receivedImage!)
        getPicture.image = baseImage
        // delegateを設定
        textField.delegate = self
    }
    // キーボードのreturnが押された際に呼ばれる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        // キーを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func createButton(_ sender: Any) {
        useText = textField.text
        //テキストフィールドに文字が入ってる？
        if useText != nil{//YES
                let sendImage = createImage(image: baseImage!)
                let storyboard: UIStoryboard = self.storyboard!
                let next = storyboard.instantiateViewController(withIdentifier: "check") as! CheckViewController
                next.receivedPerfectImage = sendImage
                self.present(next, animated: true, completion: nil)
        }//NO
    }
    //imageにcontextを合成してくれるメソッド
    func composite(image: UIImage)-> UIImage{
        let size = CGSize(width: image.size.width, height: image.size.height + image.size.height/10)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.white.cgColor)
        context!.fill(CGRect(origin: CGPoint.zero, size: size))
        image.draw(in: CGRect(x: 0, y: image.size.height/10, width: image.size.width, height:image.size.height ))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    // imageにテキストを合成してくれるメソッド
    func createImage(image :UIImage) ->UIImage{
        //文字のサイズ
        let size = CGSize(width: (baseImage?.size.width)!, height: (baseImage?.size.height)!)
        //contextのサイズを指定
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        //contextを生成 & 変数代入
        let context = UIGraphicsGetCurrentContext()
        context!.fill(CGRect(origin: CGPoint.zero, size: size))
        image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        //文字サイズ
        let font = UIFont.boldSystemFont(ofSize:  image.size.height/20)
        let textRect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height/11)
        let textStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        let textFontAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.paragraphStyle: textStyle
        ]
        useText.draw(in: textRect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
