//
//  ViewController.swift
//  guess
//
//  Created by Timmy on 2023/9/18.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var guessWrongCountLabel: UILabel!
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    // 宣告兩個實例變數
    var answer = Int.random(in: 1...100)  //存儲隨機生成的1到100之間的數字作為答案
    var guessWrongCount = 0            // 用於計算猜錯的次數
    
    // 在視圖加載完成後執行的初始化設定，通常不需要額外的程式碼
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // 使用者點擊"猜"按鈕時觸發的動作
    @IBAction func guess(_ sender: Any) {
        let numberText = numberTextField.text! // 從文本框中獲取文字輸入
        let number = Int(numberText) // 將文字轉換為整數
        if number != nil {  // 確保轉換成功
            let guessNumber = number! // 獲得轉換後的數字
            if guessNumber == answer {  // 判斷是否猜對了
                resultLabel.text = "準"   // 顯示準確的消息
            } else if guessNumber < answer {  //猜的數字太小
                resultLabel.text = "太小了"    //顯示太小的消息
                numberTextField.text = ""    //清空文本框
                guessWrongCount += 1          // 增加猜錯的次數
            } else {
                resultLabel.text = "太大了"    // 顯示太大的消息ㄈ
                numberTextField.text = ""
                guessWrongCount += 1
            }
        }
        guessWrongCountLabel.text = "\(guessWrongCount)"
        if guessWrongCount == 3 {    // 設定如果猜錯的次數達到3次
            //錯誤3次
            gameOverLabel.isHidden = false  //顯示遊戲結束的標籤
        }
    }
    //使用者點擊"重新開始"按鈕時觸發的動作
    @IBAction func replay(_ sender: Any) {
        answer = Int.random(in: 1...100)  // 重新生成隨機答案
        numberTextField.text = ""
        //空字串
        resultLabel.text = "?"    // 重置結果標籤
        guessWrongCount = 0       // 重置猜錯的次數
        guessWrongCountLabel.text = "\(guessWrongCount)"  // 重置猜錯次數的標籤
        gameOverLabel.isHidden = true          // 隱藏遊戲結束的標籤
        
        // 收起鍵盤
        view.endEditing(true)
    }
}
  
