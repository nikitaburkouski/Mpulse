//
//  XiaomiPhoneViewController.swift
//  MPulse
//
//  Created by Nikita on 7/21/21.
//

import UIKit
import Kingfisher

class XiaomiPhoneViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    var xiaomi: [Xiaomi] = []
    
    @IBOutlet weak var xiaomiCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellXib = UINib(nibName: "CollectionXiaomiViewCell", bundle: nil)
        xiaomiCollectionView.register(cellXib, forCellWithReuseIdentifier: "CollectionXiaomiViewCell")
        
        xiaomiCollectionView.delegate = self
        xiaomiCollectionView.dataSource = self
        
        xiaomi.append(contentsOf: [Xiaomi(model: "Redmi 7", image: "https://avatars.mds.yandex.net/get-mpic/4033296/img_id163612759520252929.jpeg/13hq", lcd: "150 руб", akb: "50 руб.", glassRepair: "90 руб."), Xiaomi(model: "Redmi Note 7", image: "https://avatars.mds.yandex.net/get-mpic/4412310/img_id9069575144920145917.jpeg/orig", lcd: "160 руб.", akb: "60 руб.", glassRepair: "100 руб."), Xiaomi(model: "Redmi 8A", image: "https://avatars.mds.yandex.net/get-mpic/4606255/img_id8752779617121873404.jpeg/13hq", lcd: "150 руб.", akb: "50 руб.", glassRepair: "85 руб."), Xiaomi(model: "Redmi 8", image: "https://avatars.mds.yandex.net/get-mpic/1853752/img_id8579950124777469919.jpeg/orig", lcd: "150 руб.", akb: "55 руб.", glassRepair: "80 руб."), Xiaomi(model: "Redmi Note 8", image: "https://avatars.mds.yandex.net/get-mpic/4397006/img_id3839035118099756539.jpeg/orig", lcd: "160 руб.", akb: "60 руб.", glassRepair: "90 руб."), Xiaomi(model: "Redmi 9A", image: "https://avatars.mds.yandex.net/get-mpic/4944925/img_id5802912692559965472.jpeg/orig", lcd: "140 руб.", akb: "60 руб.", glassRepair: "90 руб."), Xiaomi(model: "Redmi 9", image: "https://avatars.mds.yandex.net/get-mpic/1636931/img_id7998096308739649615.jpeg/orig", lcd: "150 руб.", akb: "60 руб.", glassRepair: "90 руб."), Xiaomi(model: "Redmi Note 9 Pro", image: "https://avatars.mds.yandex.net/get-mpic/4076910/img_id6252135850534239559.jpeg/orig", lcd: "170 руб.", akb: "65 руб.", glassRepair: "110 руб."), Xiaomi(model: "Mi 8", image: "https://avatars.mds.yandex.net/get-mpic/1244413/img_id2877082498881765033.png/13hq", lcd: "250 руб.", akb: "65 руб.", glassRepair: "150 руб."), Xiaomi(model: "Mi 9", image: "https://avatars.mds.yandex.net/get-mpic/4113189/img_id6900769111068644370.jpeg/13hq", lcd: "350 руб.", akb: "70 руб.", glassRepair: "150 руб."), Xiaomi(model: "Mi 9T", image: "https://avatars.mds.yandex.net/get-mpic/1886132/img_id9111063707314779258.jpeg/13hq", lcd: "350 руб.", akb: "70 руб.", glassRepair: "170 руб."), Xiaomi(model: "Redmi Note 10", image: "https://avatars.mds.yandex.net/get-mpic/3749045/img_id2980667943396148302.jpeg/orig", lcd: "200 руб.", akb: "75 руб.", glassRepair: "130 руб."), Xiaomi(model: "Mi 10T", image: "https://avatars.mds.yandex.net/get-mpic/1673800/img_id2315083006030330079.jpeg/orig", lcd: "240 руб.", akb: "70 руб.", glassRepair: "150 руб.")])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return xiaomi.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = xiaomiCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionXiaomiViewCell", for: indexPath) as! CollectionXiaomiViewCell
        
        let xiaom = xiaomi[indexPath.row]
        cell.labelModel.text = xiaom.model
        
        let url = URL(string: xiaom.image)
        cell.image.kf.setImage(with: url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {  //функция размера ячейкм
        let offset = 20
        let spacing = 14
        let screenWidth = UIScreen.main.bounds.size.width
        let cellWidth = (Int(screenWidth) - offset * 2 - spacing) / 2
        let size = CGSize(width: cellWidth , height: 200)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let xiaom = xiaomi[indexPath.row]
        
        let priceXiaomi = storyboard?.instantiateViewController(identifier: "PriceXiaomiViewController") as! PriceXiaomiViewController
        
        priceXiaomi.xiaomi = xiaom
        present(priceXiaomi, animated: true, completion: nil)
        
    }
    
    
}


