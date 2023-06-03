//
//  ViewController.swift
//  MovieLmw
//
//  Created by 이민욱 on 2023/05/03.
//

import UIKit

let name = ["슈퍼 마리오 브라더스","드림","존 윅4","스즈메의 문단속","옥수역귀신","리바운드","더 퍼스트 슬램덩크","렌필드","킬링 로맨스","무명"]

// MARK: - Welcome
struct MovieData: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult
struct BoxOfficeResult: Codable {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList
struct DailyBoxOfficeList: Codable {
    let rnum, rank, rankInten: String
    let rankOldAndNew: RankOldAndNew
    let movieCD, movieNm, openDt, salesAmt: String
    let salesShare, salesInten, salesChange, salesAcc: String
    let audiCnt, audiInten, audiChange, audiAcc: String
    let scrnCnt, showCnt: String
    
    enum CodingKeys: String, CodingKey {
        case rnum, rank, rankInten, rankOldAndNew
        case movieCD = "movieCd"
        case movieNm, openDt, salesAmt, salesShare, salesInten, salesChange, salesAcc, audiCnt, audiInten, audiChange, audiAcc, scrnCnt, showCnt
    }
}

enum RankOldAndNew: String, Codable {
    case old = "OLD"
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt="
    
    var movieData : MovieData?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        cell.movieName.text = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].movieNm
        if let audiAcc = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].audiAcc{
            let numF = NumberFormatter()
            numF.numberStyle = .decimal
            let aCount = Int(audiAcc)!
            let result = numF.string(for: aCount)! + "명"
            cell.label.text = "누적 관객수 : \(result)" }
        
        if let openDt =  movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].openDt{cell.openDay.text = "개봉일 : \(openDt)"}
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.description)
    }
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        movieURL += makeYesterdayString()
        getData()
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "박스오피스(영화진흥위원회제공:"+makeYesterdayString()+")"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? DetailViewController else {
            return
        }
        // if let dest = ~ { dest.movieName=? }
        // as! ~  dest.moviName = ~ 2가지 변환 가능
        let myIndexPath = table.indexPathForSelectedRow!
        let row = myIndexPath.row
        print(row)
        dest.movieName = (movieData?.boxOfficeResult.dailyBoxOfficeList[row].movieNm)!
    }
    
    func makeYesterdayString() -> String {
        let y = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let dateF = DateFormatter()
        dateF.dateFormat = "yyyyMMdd"
        let day = dateF.string(from: y)
        return day
    }
    
    func getData(){
        if let url = URL(string:movieURL){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let JSONdata = data { // data 옵셔널형
                    let dataString = String(data: JSONdata, encoding: .utf8)
                    print(dataString!)
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(MovieData.self, from: JSONdata)
                        self.movieData = decodedData
                        DispatchQueue.main.async {
                            self.table.reloadData()
                        }
                    }catch{
                        print(error)
                    } //5
                } //4
            } //3
            task.resume()
        } //2
    } //1
    
}

