///
//  addHomeViewController.swift
//  p2fack_practice
//
//  Created by Fuuya Yamada on 2019/02/12.
//  Copyright © 2019 Fuuya Yamada. All rights reserved.
//

import UIKit

class addHomeViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate/*,UIPickerViewDelegate, UIPickerViewDataSource*/{
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var voice: UITextField!
    
    var pickerView: UIPickerView = UIPickerView()
    var DPicker = DatePickerKeyboard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.placeholder = "やったこと"
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField2.placeholder = "いつやった？"
        textField2.leftViewMode = .always
        textField2.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
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
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        taskList.append(textField.text!)
        textField.text = ""
        UserDefaults.standard.set(taskList, forKey: "TaskList" )
        
        let nav = self.navigationController
        // 一つ前のViewControllerを取得する
        let homeViewController = nav?.viewControllers[(nav?.viewControllers.count)!-2] as! home_ViewController
        // 値を渡す
        let date = DateUtils.dateFromString(string: textField2.text!, format: "yyyy年MM月dd日")
        homeViewController.taskTime = date
        print(homeViewController.taskTime)
        // popする
        navigationController?.popViewController(animated: true)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}
