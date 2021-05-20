//
//  sliderContent.swift
//  custom_alert
//
//  Created by 이병훈 on 2021/05/20.
//

import UIKit

class sliderContent: UIViewController {
    var slider = UISlider()
    var value: Float {
        self.slider.value
    }
    
    override func viewDidLoad() {
        slider.frame = CGRect(x: 0, y: 0, width: 170, height: 30)
        slider.maximumValue = 100
        slider.minimumValue = 0
        self.view.addSubview(slider)
        
        self.preferredContentSize = CGSize(width: self.slider.frame.width, height: self.slider.frame.height + 40)

    }
}
