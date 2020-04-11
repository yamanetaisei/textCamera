//
//  CheckViewController.swift
//  textCamera
//
//  Created by 山根大生 on 2020/03/16.
//  Copyright © 2020 taisei. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class CheckViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var perfectImage: UIImageView!
    
    var receivedPerfectImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let topColor = UIColor(hex: "#64b3f4")
               let bottomColor = UIColor(hex: "#c2e59c")
               let gradientColors: [CGColor] = [topColor!.cgColor, bottomColor!.cgColor]
               let gradientLayer: CAGradientLayer = CAGradientLayer()
               gradientLayer.colors = gradientColors
               gradientLayer.frame = self.view.bounds
               self.view.layer.insertSublayer(gradientLayer, at: 0)
        perfectImage.image = receivedPerfectImage
    }
    //戻るボタン
    @IBAction func cancelButton(_ sender: Any) {
        //2つ前に戻っている
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    // 追加ボタン
    @IBAction func addButton(_ sender: Any) {
       let addImage = perfectImage.image
        //アルバムへ追加している
        UIImageWriteToSavedPhotosAlbum(addImage!, nil, nil, nil)
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    //共有ボタン
    @IBAction func shareButton(_ sender: Any) {
        //UIActivityを呼んでいる
        let controller = UIActivityViewController(activityItems: [perfectImage.image as Any], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
    }
    
    func showCheckAnimation(){
        let animationView = AnimationView(name: "CheckAnimation")
        animationView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 1
        
        view.addSubview(animationView)
        
        animationView.play { finished in
            if finished {
                animationView.removeFromSuperview()
            }
        }
    }
}
