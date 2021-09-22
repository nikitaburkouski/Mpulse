//
//  IphoneInfoTrackViewController.swift
//  MPulse
//
//  Created by Nikita on 8/27/21.
//

import UIKit
import Kingfisher

class IphoneInfoTrackViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    var iphone: IPhoneModel!
    
    var iphoneInfos: [iPhoneInfoTrack] = []
    
    @IBOutlet weak var IphoneInfoTableView: UITableView!
    @IBOutlet weak var imagePhone: UIImageView!
    @IBOutlet weak var labelModel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let customCellXib = UINib(nibName: "IphoneTrackTableViewCell", bundle: nil)
        IphoneInfoTableView.register(customCellXib, forCellReuseIdentifier: "IphoneTrackTableViewCell")
        
        IphoneInfoTableView.delegate = self
        IphoneInfoTableView.dataSource = self
        
        IphoneInfoTableView.tableFooterView = UIView() // убрать лишние полоски
        
        labelModel.text = iphone.model
        
        let url = URL(string: iphone.image)
        imagePhone.kf.setImage(with: url)
        
        let introduced = iPhoneInfoTrack()
        introduced.name = "Дата производства"
        introduced.description = iphone.date
        iphoneInfos.append(introduced)
        
        let discontinued = iPhoneInfoTrack()
        discontinued.name = "Номерa модели"
        discontinued.description = iphone.modelNumber
        iphoneInfos.append(discontinued)
        
        let colors = iPhoneInfoTrack()
        colors.name = "В каких цветах представлены"
        colors.description = iphone.colors
        iphoneInfos.append(colors)
        
        let price = iPhoneInfoTrack()
        price.name = "Цены на старте продаж"
        price.description = iphone.price
        iphoneInfos.append(price)
        
        let storage = iPhoneInfoTrack()
        storage.name = "Флеш-память"
        storage.description = iphone.storage
        iphoneInfos.append(storage)
        
        let builtMemory = iPhoneInfoTrack()
        builtMemory.name = "Оперативная память"
        builtMemory.description = iphone.builtMemory
        iphoneInfos.append(builtMemory)
        
        let lcd = iPhoneInfoTrack()
        lcd.name = "Технология экрана"
        lcd.description = iphone.lcd
        iphoneInfos.append(lcd)
        
        let lcdSize = iPhoneInfoTrack()
        lcdSize.name = "Диагональ экрана"
        lcdSize.description = iphone.lcdSize
        iphoneInfos.append(lcdSize)
        
        let lcdResolution = iPhoneInfoTrack()
        lcdResolution.name = "Разрешение экрана"
        lcdResolution.description = iphone.lcdResolution
        iphoneInfos.append(lcdResolution)
        
        let lcdPixel = iPhoneInfoTrack()
        lcdPixel.name = "Колисество пикселей на дюйм"
        lcdPixel.description = iphone.lcdPixel
        iphoneInfos.append(lcdPixel)
        
        let processor = iPhoneInfoTrack()
        processor.name = "Процессор"
        processor.description = iphone.processor
        iphoneInfos.append(processor)
        
        let processorSpeed = iPhoneInfoTrack()
        processorSpeed.name = "Частота процессора"
        processorSpeed.description = iphone.processorSpeed
        iphoneInfos.append(processorSpeed)
        
        let arch = iPhoneInfoTrack()
        arch.name = "Разрядность процессора"
        arch.description = iphone.architecture
        iphoneInfos.append(arch)
        
        let numberCores = iPhoneInfoTrack()
        numberCores.name = "Количество ядер"
        numberCores.description = iphone.numberCores
        iphoneInfos.append(numberCores)
        
        let coprocessor = iPhoneInfoTrack()
        coprocessor.name = "Сопроцессор"
        coprocessor.description = iphone.coprocessor
        iphoneInfos.append(coprocessor)
        
        let graphicsCard = iPhoneInfoTrack()
        graphicsCard.name = "Графическая карта"
        graphicsCard.description = iphone.graphicsCard
        iphoneInfos.append(graphicsCard)
        
        let battery = iPhoneInfoTrack()
        battery.name = "Емкость аккумулятора"
        battery.description = iphone.battery
        iphoneInfos.append(battery)
        
    }
    
    
    @IBAction func youTubeButtonClicked(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "YouTubeViewController") as! YouTubeViewController
        vc.iphones = iphone
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iphoneInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IphoneTrackTableViewCell") as! IphoneTrackTableViewCell
        let iphoneInfo = iphoneInfos[indexPath.row]
        
        cell.label1.text = iphoneInfo.name
        cell.label2.text = iphoneInfo.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78
    }
    
    
    
}



