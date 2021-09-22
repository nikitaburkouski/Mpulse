//
//  CollectionPhoneViewController.swift
//  MPulse
//
//  Created by Nikita on 6/21/21.
//

import UIKit
import Kingfisher


class CollectionPhoneViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    var phones: [IphonePrice] = []
    
    
    
    @IBOutlet weak var collectionViewPhones: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellXib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionViewPhones.register(cellXib, forCellWithReuseIdentifier: "CollectionViewCell")
        
        collectionViewPhones.delegate = self
        collectionViewPhones.dataSource = self
        
        phones.append(contentsOf: [IphonePrice(model: "iPhone 5S/SE", image: "https://static.1k.by/images/products/ip/big/p950000/p7/0/942373/i6153296ee.jpg", isX: false, lcd: "65 руб.",akb: "40 руб.", buzzer: "20 руб.", home: "25 руб.", buttonOn: "35 руб.", charge: "35 руб.", frontCamera: "30 руб.", camera: "30 руб." ), IphonePrice(model: "iPhone 6", image: "https://avatars.mds.yandex.net/get-mpic/4721581/img_id2365461289658954901.jpeg/13hq", isX: false, lcd: "90 руб.",akb: "45 руб.", buzzer: "25 руб.", home: "40 руб.", buttonOn: "40 руб.", charge: "50 руб.", frontCamera: "40 руб.", camera: "40 руб." ),IphonePrice(model: "iPhone 6 Plus", image: "https://avatars.mds.yandex.net/get-mpic/4386141/img_id1206639800646236147.jpeg/13hq", isX: false, lcd: "100 руб.",akb: "50 руб.", buzzer: "30 руб.", home: "40 руб.", buttonOn: "40 руб.", charge: "50 руб.", frontCamera: "45 руб.", camera: "40 руб." ),IphonePrice(model: "iPhone 6S", image: "https://avatars.mds.yandex.net/get-mpic/4397006/img_id6759961081108890233.jpeg/13hq", isX: false, lcd: "110 руб.",akb: "50 руб.", buzzer: "30 руб.", home: "40 руб.", buttonOn: "45 руб.", charge: "60 руб.", frontCamera: "50 руб.", camera: "60 руб." ),IphonePrice(model: "iPhone 6S Plus", image: "https://avatars.mds.yandex.net/get-mpic/466729/img_id2421523910885877971.jpeg/13hq", isX: false, lcd: "140 руб.",akb: "55 руб.", buzzer: "40 руб.", home: "40 руб.", buttonOn: "50 руб.", charge: "65 руб.", frontCamera: "60 руб.", camera: "65 руб." ),IphonePrice(model: "iPhone 7", image: "https://avatars.mds.yandex.net/get-mpic/331398/img_id7352553178180156765.jpeg/orig", isX: false, lcd: "110 руб.",akb: "55 руб.", buzzer: "50 руб.", home: "50 руб.", buttonOn: "60 руб.", charge: "65 руб.", frontCamera: "60 руб.", camera: "50 руб." ),IphonePrice(model: "iPhone 7 Plus", image: "https://avatars.mds.yandex.net/get-mpic/200316/img_id6449344687185579707.jpeg/13hq", isX: false, lcd: "120 руб.",akb: "70 руб.", buzzer: "60 руб.", home: "50 руб.", buttonOn: "70 руб.", charge: "80 руб.", frontCamera: "80 руб.", camera: "120 руб." ),IphonePrice(model: "iPhone 8", image: "https://avatars.mds.yandex.net/get-mpic/932277/img_id8577152390218330050.jpeg/13hq", isX: false, lcd: "130 руб.",akb: "80 руб.", buzzer: "60 руб.", home: "130 руб.", buttonOn: "90 руб.", charge: "100 руб.", frontCamera: "100 руб.", camera: "130 руб." ),IphonePrice(model: "iPhone 8 Plus", image: "https://avatars.mds.yandex.net/get-mpic/932277/img_id8577152390218330050.jpeg/orig", isX: false, lcd: "130 руб.",akb: "100 руб.", buzzer: "80 руб.", home: "140 руб.", buttonOn: "100 руб.", charge: "110 руб.", frontCamera: "110 руб.", camera: "140 руб." ), IphonePrice(model: "iPhone X", image: "https://avatars.mds.yandex.net/get-mpic/1336510/img_id6093797155197468763.jpeg/orig", isX: true, lcd: "300 руб.",akb: "120 руб.", buzzer: "90 руб.", home: "320 руб.", buttonOn: "110 руб.", charge: "120 руб.", frontCamera: "120 руб.", camera: "180 руб." ), IphonePrice(model: "iPhone XS", image: "https://avatars.mds.yandex.net/get-mpic/4493022/img_id1459199870519019524.jpeg/13hq", isX: true, lcd: "370 руб.",akb: "150 руб.", buzzer: "120 руб.", home: "320 руб.", buttonOn: "110 руб.", charge: "150 руб.", frontCamera: "120 руб.", camera: "200 руб." ), IphonePrice(model: "iPhone XS Max", image: "https://avatars.mds.yandex.net/get-mpic/4493022/img_id1459199870519019524.jpeg/13hq", isX: true, lcd: "470 руб.",akb: "150 руб.", buzzer: "130 руб.", home: "340 руб.", buttonOn: "120 руб.", charge: "150 руб.", frontCamera: "130 руб.", camera: "210 руб." ), IphonePrice(model: "iPhone XR", image: "https://avatars.mds.yandex.net/get-mpic/2008455/img_id615147227856673967.jpeg/orig", isX: true, lcd: "220 руб.",akb: "120 руб.", buzzer: "110 руб.", home: "-", buttonOn: "110 руб.", charge: "140 руб.", frontCamera: "120 руб.", camera: "180 руб." ), IphonePrice(model: "iPhone 11", image: "https://avatars.mds.yandex.net/get-mpic/4080064/img_id8109488739423124283.jpeg/orig", isX: true, lcd: "280 руб.",akb: "180 руб.", buzzer: "180 руб.", home: "-", buttonOn: "240 руб.", charge: "280 руб.", frontCamera: "240 руб.", camera: "350 руб." ), IphonePrice(model: "iPhone SE 2020", image: "https://avatars.mds.yandex.net/get-mpic/4401552/img_id1772781560543430164.jpeg/13hq", isX: false, lcd: "130 руб.",akb: "80 руб.", buzzer: "60 руб.", home: "130 руб.", buttonOn: "90 руб.", charge: "100 руб.", frontCamera: "100 руб.", camera: "130 руб." ), IphonePrice(model: "iPhone 11 Pro", image: "https://avatars.mds.yandex.net/get-mpic/4944925/img_id1796212095156617048.jpeg/13hq", isX: true, lcd: "460 руб.",akb: "180 руб.", buzzer: "240 руб.", home: "380 руб.", buttonOn: "280 руб.", charge: "340 руб.", frontCamera: "340 руб.", camera: "440 руб." ), IphonePrice(model: "iPhone 11 Pro Max", image: "https://avatars.mds.yandex.net/get-mpic/4944925/img_id1796212095156617048.jpeg/13hq", isX: true, lcd: "640 руб.",akb: "180 руб.", buzzer: "250 руб.", home: "410 руб.", buttonOn: "340 руб.", charge: "440 руб.", frontCamera: "440 руб.", camera: "550 руб." ), IphonePrice(model: "iPhone 12", image: "https://avatars.mds.yandex.net/get-mpic/5218438/img_id8730315210738110501.png/orig", isX: true, lcd: "-",akb: "-", buzzer: "-", home: "-", buttonOn: "-", charge: "-", frontCamera: "-", camera: "-" ), IphonePrice(model: "iPhone 12 Pro", image: "https://avatars.mds.yandex.net/get-mpic/4397502/img_id2110023655882054022.jpeg/orig", isX: true, lcd: "-",akb: "-", buzzer: "-", home: "-", buttonOn: "-", charge: "-", frontCamera: "-", camera: "-" ), IphonePrice(model: "iPhone 12 Pro Max", image: "https://avatars.mds.yandex.net/get-mpic/4397502/img_id2110023655882054022.jpeg/orig", isX: true, lcd: "-",akb: "-", buzzer: "-", home: "-", buttonOn: "-", charge: "-", frontCamera: "-", camera: "-")])
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return phones.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewPhones.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let phone = phones[indexPath.row]
        cell.labelPhone.text = phone.model
        
        
        
        let url = URL(string: phone.image)
        cell.imageView.kf.setImage(with: url)
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
        
        let phone = phones[indexPath.row]
        
        
        if phone.isX {
            let priceVC = storyboard?.instantiateViewController(identifier: "PriceXGenerationViewController") as! PriceXGenerationViewController
            priceVC.phone = phone
            present(priceVC, animated: true, completion: nil)
        } else {
            let priceVC = storyboard?.instantiateViewController(identifier: "PriceViewController") as! PriceViewController
            priceVC.phone = phone
            present(priceVC, animated: true, completion: nil)
        }
        
    }
    
}


//struct IphonePrice {
//    var model: String
//    var image: String
//    var isX: Bool
//    var lcd: String
//    var akb: String
//    var buzzer: String
//    var home: String
//    var buttonOn: String
//    var charge: String
//    var frontCamera: String
//    var camera: String
//}



