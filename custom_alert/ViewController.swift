//
//  ViewController.swift
//  custom_alert
//
//  Created by 이병훈 on 2021/05/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let setButton = UIButton(type: .system)
        
        setButton.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        setButton.setTitle("버튼을 누르면 알람이 등장해요", for: .normal)
        setButton.center.x = self.view.frame.width / 2
        setButton.addTarget(self, action: #selector(helloAlert(_:)), for: .touchUpInside)
        self.view.addSubview(setButton)
    }
    
    @objc func helloAlert(_ sender: Any) {
        let alert = UIAlertController(title: "커스텀 테스트", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel))
        
        let v = UIViewController()
        v.view.backgroundColor = .black
        
        let label = UILabel(frame: CGRect(x: 90, y: 45, width: 100, height: 30))
        label.text = "커스텀할 공간"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.sizeToFit()
        
        v.view.addSubview(label)
        
        alert.setValue(v, forKey: "contentViewController")
        
        self.present(alert, animated: false)
        
    }


}

