//
//  YenViewController.swift
//   ExchangeRateLMW
//
//  Created by 이민욱 on 2022/12/13.
//

import UIKit

class YenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var lblResult: UILabel!

    @IBOutlet weak var txtKRW: UITextField!
    @IBOutlet weak var txtYEN: UITextField!
    
    @IBAction func calcYen(_ sender: UIButton) {
        if txtKRW.text == ""
        {
            print("Input error")
            lblResult.text = "원화를 입력하세요"
            return
        }
        else{
            // text : String? 옵셔널 스트링형
            // 값이 없을 경우가 있어서 옵셔널 !로 강제 언래핑
            // 첫번째 느낌표는 일반적인 string으로 바꿈
            // 문자형을 Double()로 바꿈 그러면 Double?로 변경
            // 한번더 !로 강제 언래핑하면 완성
            let KRW = Double(txtKRW.text!)!
            print(KRW)
            let YEN = KRW / 9.6
            let shortenedYEN = String(format: "%.1f", YEN)
            let color = UIColor.white
            print("YEN:\(shortenedYEN)")
            lblResult.text = "YEN: \(shortenedYEN)"
            lblResult.backgroundColor = color
            lblResult.clipsToBounds = true
            lblResult.layer.cornerRadius = 20
        }

    }
    
    @IBAction func calcKRW(_ sender: UIButton) {
        if txtYEN.text == ""
        {
            print("Input error")
            lblResult.text = "엔을 입력하세요"
            return
        }
        else{
            // text : String? 옵셔널 스트링형
            // 값이 없을 경우가 있어서 옵셔널 !로 강제 언래핑
            // 첫번째 느낌표는 일반적인 string으로 바꿈
            // 문자형을 Double()로 바꿈 그러면 Double?로 변경
            // 한번더 !로 강제 언래핑하면 완성
            let YEN = Double(txtYEN.text!)!
            print(YEN)
            let KRW = YEN * 9.6
            let shortenedKRW = String(format: "%.1f", KRW)
            let color = UIColor.white
            print("KRW:\(shortenedKRW)")
            lblResult.text = "KRW: \(shortenedKRW)"
            lblResult.backgroundColor = color
            lblResult.clipsToBounds = true
            lblResult.layer.cornerRadius = 20
        }
    }
    @IBAction func scChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.view.backgroundColor = UIColor(displayP3Red: 0.0, green: 0.7, blue: 1.0, alpha: 1.0)
        }
        else{
            self.view.backgroundColor = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.5, alpha: 1.0)
        }
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
