//
//  YoutubeViewController.swift
//  MovieLmw
//
//  Created by 이민욱 on 2023/06/09.
//

import UIKit
import WebKit


class YoutubeViewController: UIViewController {

    @IBOutlet weak var youtube: WKWebView!
    var movieName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = movieName
        let urlKorString = "https://www.youtube.com/results?search_query="+movieName+"미리보기"
        let urlString = urlKorString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        youtube.load(request)

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
