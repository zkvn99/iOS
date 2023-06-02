//
//  ViewController.swift
//
//  Created by 이민욱 on 2022/12/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtUSD: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var txtKRW: UITextField!
    @IBAction func calcUSD(_ sender: UIButton) {
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
            let USD = KRW/1300
            let shortenedUSD = String(format: "%.1f", USD)
            let color = UIColor.white
            print("USD:\(shortenedUSD)")
            lblResult.text = "USD: \(shortenedUSD)"
            lblResult.backgroundColor = color
            lblResult.clipsToBounds = true
            lblResult.layer.cornerRadius = 20
        }
    }
    @IBAction func calcKRW(_ sender: UIButton) {
        if txtUSD.text == ""
        {
            print("Input error")
            lblResult.text = "달러를 입력하세요"
            return
        }
        else{
            // text : String? 옵셔널 스트링형
            // 값이 없을 경우가 있어서 옵셔널 !로 강제 언래핑
            // 첫번째 느낌표는 일반적인 string으로 바꿈
            // 문자형을 Double()로 바꿈 그러면 Double?로 변경
            // 한번더 !로 강제 언래핑하면 완성
            let USD1 = Double(txtUSD.text!)!
            print(USD1)
            let KRW1 = USD1*1300
            let shortenedKRW = String(format: "%.1f", KRW1)
            let color = UIColor.white
            print("USD:\(shortenedKRW)")
            lblResult.text = "KRW: \(shortenedKRW)"
            lblResult.backgroundColor = color
            lblResult.clipsToBounds = true
            lblResult.layer.cornerRadius = 20
        }
    }
    @IBAction func scMF(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.view.backgroundColor = UIColor(displayP3Red: 0.0, green: 0.7, blue: 1.0, alpha: 1.0)
        }
        else{
            self.view.backgroundColor = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.5, alpha: 1.0)
        }
    }

    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
    }
    

