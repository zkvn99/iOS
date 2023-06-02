//
//  WebViewController.swift
//  BMIlmw12
//
//  Created by 이민욱 on 2022/12/06.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {

    @IBAction func goNaver(_ sender: UIButton) {
        let myURL = URL(string:
                            "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EB%8B%AC%EB%9F%AC")
                let myRequest = URLRequest(url: myURL!)
                webView.load(myRequest)
    }
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let myURL = URL(string:"https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%94%ED%99%94&oquery=%EC%97%94&tqi=hHAKVdp0Jy0ssnw7uRKssssst5w-334761")
        let myRequest = URLRequest(url:myURL!)
        webView.load(myRequest)
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    } // 다시 들어아도 계속 실행됨
}
