//
//  NewsViewController.swift
//  MPulse
//
//  Created by Nikita on 6/27/21.
//

import UIKit
import Alamofire

class NewsViewController: UIViewController,  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    let url = "https://newsapi.org/v2/everything?q=iphone&from=2021-08-23&to=2021-08-23&language=ru&sortBy=apple&apiKey=7c08b705e2b145299b5f7facdea38801"
    
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    
    var news: News!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        AF.request(url).responseJSON(completionHandler: {response in
            if let dictionary = response.value as? [String: Any] {
                if let array = dictionary["articles"] as? [[String: Any]] {
                    if let newsDictionary = array[18] as? [String: Any] {
                        var news = News()
                        news.title = newsDictionary["title"] as? String
                        news.description = newsDictionary["description"] as? String
                        print(news.title)
                        print(news.description)
                        
                    }
                    
                    
                }
                
            }
            
        })
        
        
        let cellXib = UINib(nibName: "NewsCollectionViewCell", bundle: nil)
        newsCollectionView.register(cellXib, forCellWithReuseIdentifier: "NewsCollectionViewCell")
        
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
    //    cell.labelDiscription.text =
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {  //функция размера ячейкм
        let offset = 15
        let spacing = 15
        let screenWidth = UIScreen.main.bounds.size.width
        let cellWidth = (Int(screenWidth) - offset * 2)
        //  let cellWidth = (Int(screenWidth) - offset * 2 - spacing) / 2
        let size = CGSize(width: cellWidth , height: 250)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}
