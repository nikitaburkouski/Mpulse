//
//  HuaweiPhoneViewController.swift
//  MPulse
//
//  Created by Nikita on 7/22/21.
//

import UIKit
import Kingfisher



class HuaweiPhoneViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    var huawei: [Huawei] = []
    
    
    @IBOutlet weak var huaweiCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellXib = UINib(nibName: "HuaweiCollectionViewCell", bundle: nil)
        huaweiCollectionView.register(cellXib, forCellWithReuseIdentifier: "HuaweiCollectionViewCell")
        
        huaweiCollectionView.delegate = self
        huaweiCollectionView.dataSource = self
        
        huawei.append(contentsOf: [Huawei(model: "P20 lite", image: "https://avatars.mds.yandex.net/get-mpic/466729/img_id8913461385811961907.jpeg/13hq", lcd: "130 руб.", akb: "55 руб.", glassRepair: "80 руб."), Huawei(model: "P20 Pro", image: "https://avatars.mds.yandex.net/get-mpic/397397/img_id2769428435586051681.jpeg/13hq", lcd: "170 руб.", akb: "80 руб.", glassRepair: "120 руб."), Huawei(model: "P20 Pro", image: "https://avatars.mds.yandex.net/get-mpic/331398/img_id8587207921530352569.jpeg/13hq", lcd: "500 руб.", akb: "80 руб.", glassRepair: "170 руб."), Huawei(model: "Mate 20 Pro", image: "https://avatars.mds.yandex.net/get-mpic/4322107/img_id4944161772480443444.jpeg/13hq", lcd: "350 руб.", akb: "100 руб.", glassRepair: "250 руб."), Huawei(model: "P30 lite", image: "https://avatars.mds.yandex.net/get-mpic/3721790/img_id9146988693107107141.jpeg/13hq", lcd: "140 руб.", akb: "55 руб.", glassRepair: "100 руб."), Huawei(model: "P30", image: "https://avatars.mds.yandex.net/get-mpic/4119784/img_id585011277317126024.jpeg/13hq", lcd: "300 руб.", akb: "70 руб.", glassRepair: "120 руб."), Huawei(model: "Mate 30 Pro", image: "https://avatars.mds.yandex.net/get-mpic/4367383/img_id3871743268955858.jpeg/13hq", lcd: "1200 руб.", akb: "130 руб.", glassRepair: "400 руб."), Huawei(model: "P40 lite E", image: "https://avatars.mds.yandex.net/get-mpic/1704682/img_id1055029809805527096.png/orig", lcd: "150", akb: "80", glassRepair: "100"), Huawei(model: "P40 lite", image: "https://avatars.mds.yandex.net/get-mpic/4426104/img_id8256453906003470921.jpeg/orig", lcd: "160", akb: "80", glassRepair: "100")])
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return huawei.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = huaweiCollectionView.dequeueReusableCell(withReuseIdentifier: "HuaweiCollectionViewCell", for: indexPath) as! HuaweiCollectionViewCell
        
        let huaw = huawei[indexPath.row]
        cell.labelModel.text = huaw.model
        
        
        let url = URL(string: huaw.image)
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
        
        let huaw = huawei[indexPath.row]
        
        let priceHuawei = storyboard?.instantiateViewController(identifier: "PriceHuaweiViewController") as! PriceHuaweiViewController
        
        priceHuawei.huawei = huaw
        present(priceHuawei, animated: true, completion: nil)
        
    }
    
}


//struct Huawei {
//    var model: String
//    var image: String
//    var lcd: String
//    var akb: String
//    var glassRepair: String
//}
