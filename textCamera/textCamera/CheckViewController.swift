//
//  CheckViewController.swift
//  textCamera
//
//  Created by 山根大生 on 2020/03/16.
//  Copyright © 2020 taisei. All rights reserved.
//

import Foundation
import UIKit

class CheckViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var perfectImage: UIImageView!
    
    var receivedPerfectImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        perfectImage.image = receivedPerfectImage
    }
    @IBAction func cancelButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
