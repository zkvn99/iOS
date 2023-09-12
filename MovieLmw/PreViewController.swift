//
//  PreViewController.swift
//  MovieLmw
//
//  Created by 이민욱 on 2023/06/09.
//

import UIKit
import WebKit

class PreViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let urlKorPreview =  "https://www.youtube.com/results?search_query=영화 미리보기"
        let urlPreview = urlKorPreview.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let urlPreview = URL(string: urlPreview) else { return }
        let requestPreview = URLRequest(url: urlPreview)
        webView.load(requestPreview)
        // Do any additional setup after loading the view.
                }
            
        
    }
