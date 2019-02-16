//
//  data.swift
//  p2fack_practice
//
//  Created by Fuuya Yamada on 2019/02/16.
//  Copyright © 2019 Fuuya Yamada. All rights reserved.
//

import UIKit

class DatePickerKeyboard: UITextField {
    private var datePicker: UIDatePicker!
    var changedDate = Date()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commoninit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    private func commoninit() {
        // datePickerの設定
        datePicker = UIDatePicker()
        datePicker.date = Date()
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ja")
        datePicker.addTarget(self, action: #selector(setText), for: .valueChanged)
        
        // textFieldのtextに日付を表示する
        setText()
        
        inputView = datePicker
        inputAccessoryView = createToolbar()
    }
    
    // キーボードのアクセサリービューを作成する
    private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 44)
        
        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        space.width = 12
        let flexSpaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let todayButtonItem = UIBarButtonItem(title: "今日", style: .done, target: self, action: #selector(todayPicker))
        let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePicker))
        
        let toolbarItems = [flexSpaceItem, todayButtonItem, doneButtonItem, space]
        
        toolbar.setItems(toolbarItems, animated: true)
        
        return toolbar
    }
    
    // キーボードの完了ボタンタップ時に呼ばれる
    @objc private func donePicker() {
        resignFirstResponder()
    }
    // キーボードの今日ボタンタップ時に呼ばれる
    @objc private func todayPicker() {
        datePicker.date = Date()
        setText()
    }
    
    // datePickerの日付けをtextFieldのtextに反映させる
    @objc private func setText() {
        let f = DateFormatter()
        f.dateStyle = .long
        f.locale = Locale(identifier: "ja")
        text = f.string(from: datePicker.date)
        changedDate = datePicker.date
        
    }
    
    // クラス外から日付を取り出すためのメソッド
    func getDate() -> Date {
        return changedDate
    }
    
    // コピペ等禁止
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    //        // 選択禁止
    //        override func selectionRects(for range: UITextRange) -> [Any] {
    //            return []
    //        }
    // カーソル非表示
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect(x: 0, y: 0, width: 0, height: 0)
    }
}


class DateUtils {
    class func dateFromString(string: String, format: String) -> Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.date(from: string)!
    }
    
    class func stringFromDate(date: Date, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
