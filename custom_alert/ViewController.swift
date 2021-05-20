//
//  ViewController.swift
//  custom_alert
//
//  Created by 이병훈 on 2021/05/20.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* 버튼 생성 */
        let setButton = UIButton(type: .system)
        
        setButton.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        setButton.setTitle("버튼을 누르면 알람이 등장해요", for: .normal)
        setButton.center.x = self.view.frame.width / 2
        /* 버튼 누를시 메서드 동작 */
        setButton.addTarget(self, action: #selector(helloAlert(_:)), for: .touchUpInside)
        
        let sliderBtn = UIButton(type: .system)
        
        sliderBtn.frame = CGRect(x: 100, y: 400, width: 250, height: 50)
        sliderBtn.setTitle("버튼을 누르면 슬라이더가 나옵니다.", for: .normal)
        sliderBtn.center.x = self.view.frame.width / 2
        
        sliderBtn.addTarget(self, action: #selector(pushSlider(_:)), for: .touchUpInside)
        
        label.frame = CGRect(x: 100, y: 350, width: 200, height: 50)
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.center.x = sliderBtn.center.x
        label.text = "slider점수가 나올 에정입니다."
        
        self.view.addSubview(sliderBtn)
        self.view.addSubview(setButton)
        self.view.addSubview(label)
    }
    
    @objc func helloAlert(_ sender: Any) {
        let alert = UIAlertController(title: "커스텀 테스트", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel))
        
        let v = UIViewController()
        
        let mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        v.view = mapView
        v.preferredContentSize.height = 300
        /* 맵 위치 및 크기 설정*/
        // 지도에서 보여줄 위치 설정(위,경도)
        let pos = CLLocationCoordinate2D(latitude: 37.335958, longitude: 127.093343)
        // 지도에서 보여주는 범위 크기?
        let span = MKCoordinateSpan(latitudeDelta: 0.0005, longitudeDelta: 0.0005)
        
        let setting = MKCoordinateRegion(center: pos, span: span)
        //해당 지역을 mapView에 설정
        mapView.region = setting
        mapView.regionThatFits(setting)
        
        /* 위치 핀 결정 */
        let point = MKPointAnnotation()
        point.coordinate = pos
        mapView.addAnnotation(point)
        
        /* label 설정 */
//        let label = UILabel(frame: CGRect(x: 90, y: 45, width: 100, height: 30))
//        label.text = "커스텀할 공간"
//        label.textColor = .white
//        label.font = UIFont.boldSystemFont(ofSize: 10)
//        label.sizeToFit()
        
//        v.view.addSubview(label)
        /* contentViewController에 뷰컨트롤러 넣기 */
        alert.setValue(v, forKey: "contentViewController")
        
        self.present(alert, animated: false)
        
    }


    @objc func pushSlider(_ sender: Any) {
        let alert = UIAlertController(title: "slider커스텀", message: nil, preferredStyle: .alert)
        
        let sliderContent = sliderContent()
        alert.addAction(UIAlertAction(title: "ok", style: .default){(_) in
            self.label.text = "\(sliderContent.value)입니다."
        })
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel))
        
        alert.setValue(sliderContent, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }
}

