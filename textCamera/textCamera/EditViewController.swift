//
//  EditViewController.swift
//  textCamera
//
//  Created by 山根大生 on 2020/03/06.
//  Copyright © 2020 taisei. All rights reserved.
//

import Foundation
import UIKit

class EditViewController: UIViewController{
    
    
    @IBOutlet weak var getPicture: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getPicture.image = image
    }
}
