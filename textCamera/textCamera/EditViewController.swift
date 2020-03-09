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
    var image: UIImage?
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getPicture.image = image
        // delegateを設定
        textField.delegate = self
    }
    // キーボードのreturnが押された際に呼ばれる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        // キーを閉じる
        textField.resignFirstResponder()
        
        return true
    }
}
