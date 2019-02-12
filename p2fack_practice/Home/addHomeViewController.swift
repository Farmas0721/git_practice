//
//  addHomeViewController.swift
//  p2fack_practice
//
//  Created by Fuuya Yamada on 2019/02/12.
//  Copyright © 2019 Fuuya Yamada. All rights reserved.
//

import UIKit

class addHomeViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textMemo: UITextField!
    @IBOutlet weak var voice: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.placeholder = "やったこと"
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField2.placeholder = "いつやった？"
        textField2.leftViewMode = .always
        textField2.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField3.placeholder = "次いつやる？"
        textField3.leftViewMode = .always
        textField3.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textMemo.placeholder = "メモ"
        textMemo.leftViewMode = .always
        textMemo.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        voice.placeholder = "通知するボイス"
        voice.leftViewMode = .always
        voice.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func picChoice(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let pickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            // 「.camera」にすればカメラを起動できる
            pickerView.sourceType = .photoLibrary
            // デリゲート
            pickerView.delegate = self
            // ビューに表示
            self.present(pickerView, animated: true)
        }
    }
    

}
