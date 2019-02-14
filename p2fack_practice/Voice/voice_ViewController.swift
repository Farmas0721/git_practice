//
//  voice_ViewController.swift
//  p2fack_practice
//
//  Created by Fuuya Yamada on 2019/02/10.
//  Copyright © 2019 Fuuya Yamada. All rights reserved.
//

import UIKit

class voice_ViewController: UIViewController {

    @IBOutlet weak var voice: UIButton!
    let image0:UIImage = UIImage(named:"voiceButtun.png")!
    let image1:UIImage = UIImage(named:"stopButtun.png")!
   var count = 0
  
    @IBAction func voice(_ sender: Any) {
        count += 1
        if(count%2 == 0){
            voice.setImage(image0, for: .normal)
        }else{
            voice.setImage(image1, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
              // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
