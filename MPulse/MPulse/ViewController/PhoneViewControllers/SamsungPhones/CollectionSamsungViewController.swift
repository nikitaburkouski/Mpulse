//
//  CollectionSamsungViewController.swift
//  MPulse
//
//  Created by Nikita on 7/10/21.
//

import UIKit
import Kingfisher

class CollectionSamsungViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    var samsung: [Samsung] = []

    @IBOutlet weak var samsungCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let cellXib = UINib(nibName: "CollectionSamsungViewCell", bundle: nil)
        samsungCollectionView.register(cellXib, forCellWithReuseIdentifier: "CollectionSamsungViewCell")
        
        samsungCollectionView.delegate = self
        samsungCollectionView.dataSource = self
        
        samsung.append(contentsOf: [Samsung(model: "Galaxy A10", image: "https://avatars.mds.yandex.net/get-mpic/4453979/img_id1957665223949724288.jpeg/13hq", lcd: "200 руб.", akb: "100 руб.", glassRepair: ""), Samsung(model: "Galaxy A20", image: "https://avatars.mds.yandex.net/get-mpic/4370207/img_id1608157158115149192.jpeg/13hq", lcd: "200 руб.", akb: "100 руб.", glassRepair: ""), Samsung(model: "Galaxy A30", image: "https://avatars.mds.yandex.net/get-mpic/4944925/img_id8788266890883635046.jpeg/orig", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy A40", image: "https://avatars.mds.yandex.net/get-mpic/4250892/img_id1425963514952254375.jpeg/13hq", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy A50", image: "https://avatars.mds.yandex.net/get-mpic/4397502/img_id4800449233378577517.jpeg/13hq", lcd: "", akb: "", glassRepair: ""),Samsung(model: "Galaxy A51", image: "https://avatars.mds.yandex.net/get-mpic/4375199/img_id4341194433383503893.png/orig", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy A52", image: "https://avatars.mds.yandex.net/get-mpic/4441046/img_id5970538311268223026.jpeg/orig", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy A70", image: "https://avatars.mds.yandex.net/get-mpic/4252138/img_id5240150422537237192.jpeg/orig", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy A71", image: "https://avatars.mds.yandex.net/get-mpic/4393885/img_id2459577943973268094.jpeg/orig", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy A80", image: "https://avatars.mds.yandex.net/get-mpic/4736439/img_id1289936039142328029.jpeg/13hq", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy S8", image: "https://avatars.mds.yandex.net/get-mpic/1927699/img_id4447051930764154992.jpeg/13hq", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy S8+", image: "https://avatars.mds.yandex.net/get-mpic/4120567/img_id5668432307806305020.jpeg/13hq", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy Note 8", image: "https://avatars.mds.yandex.net/get-mpic/4386141/img_id1508329983579335345.jpeg/13hq", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy S9", image: "https://avatars.mds.yandex.net/get-mpic/1620389/img_id916785582653195814.png/13hq", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy S9+", image: "https://avatars.mds.yandex.net/get-mpic/199079/img_id2820500142788026215.jpeg/13hq", lcd: "", akb: "", glassRepair: ""),Samsung(model: "Galaxy Note 9", image: "https://avatars.mds.yandex.net/get-mpic/4578218/img_id6028132770509243872.jpeg/13hq", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy S10", image: "https://avatars.mds.yandex.net/get-mpic/4721581/img_id5214609443863642861.jpeg/13hq", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy S10e", image: "https://avatars.mds.yandex.net/get-mpic/4080064/img_id713532704394335961.jpeg/orig", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy S10+", image: "https://avatars.mds.yandex.net/get-mpic/4410238/img_id4885506943740723130.jpeg/13hq", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy Note 10", image: "https://avatars.mds.yandex.net/get-mpic/4462738/img_id3925873109617208242.jpeg/orig", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy S20", image: "https://avatars.mds.yandex.net/get-mpic/4362548/img_id3766014326528073882.jpeg/orig", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy S20+", image: "https://avatars.mds.yandex.net/get-mpic/4113189/img_id5666496449591638863.jpeg/orig", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy Note 20", image: "https://avatars.mds.yandex.net/get-mpic/4944925/img_id3205877012281134737.jpeg/orig", lcd: "", akb: "", glassRepair: ""), Samsung(model: "Galaxy S21", image: "https://avatars.mds.yandex.net/get-mpic/4519143/img_id8981709508333998696.jpeg/orig", lcd: "", akb: "", glassRepair: "")])
    
        navigationItem.title = "Samsung"
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return samsung.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = samsungCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionSamsungViewCell", for: indexPath) as! CollectionSamsungViewCell
        
        let sams = samsung[indexPath.row]
        cell.labelModel.text = sams.model
      
        let url = URL(string: sams.image)
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
    
        let sams = samsung[indexPath.row]
        
        let priceSamsung = storyboard?.instantiateViewController(identifier: "PriceSamsungViewController") as! PriceSamsungViewController
        
        priceSamsung.samsung = sams
        present(priceSamsung, animated: true, completion: nil)
        
    }
    
}



