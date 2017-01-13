//
//  ViewController.swift
//  locationBased mapView
//
//  Created by Tacademy-Mac on 2017. 1. 13..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit
import MapKit
import SafariServices

class MuseumInfo: MKPointAnnotation {
    var exhibitions: [String]?
    var url: String?
}
class TheaterInfo: MKPointAnnotation{
    var phoneNumber: String?
}

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func addAno(_ sender: Any) {
        let namSan = MKPointAnnotation()
        
        namSan.coordinate = CLLocationCoordinate2D(latitude: 37.5514, longitude: 126.9880)
        namSan.title = "남산"
        namSan.subtitle = "wow"
        mapView.addAnnotation(namSan)
    }
    @IBAction func rmAno(_ sender: Any) {
        mapView.removeAnnotations(mapView.annotations)
    }
    @IBAction func showSeoul(_ sender: UIButton) {
        // 맵 뷰의 중앙에 나타날 위치
        let center = CLLocationCoordinate2D(latitude: 37.55, longitude: 127.0)
        // 맵 뷰에 표시될 범위. 1.0은 약 111km
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        // 범위 구조체 생성
        let region = MKCoordinateRegion(center: center, span: span)
        
        // 맵 뷰에 표시될 범위 설정
        mapView.setRegion(region, animated: true)
    }
    // 이미지 : Double-J Design (http://www.doublejdesign.co.uk)
    func addAnotations(){
        let museum1 = MuseumInfo()
        museum1.title = "국립 중아 박물관"
        museum1.coordinate = CLLocationCoordinate2DMake(37.523984, 126.980355)
        museum1.exhibitions = ["다산 정약용", "고려 불화대전", "흙으로 빚는 아시아의 꿈"]
        museum1.url = "http://www.museum.go.kr"
        
        self.mapView.addAnnotation(museum1)

        let museum2 = MuseumInfo()
        museum2.title = "세종문화회관"
        museum2.coordinate = CLLocationCoordinate2DMake(37.5724,126.9756)
        museum2.url = "http://www.sejongpac.or.kr"
        museum2.exhibitions = ["점핑 위드 러브", "세종 이야기", "충무공 이야기"]
        self.mapView.addAnnotation(museum2)

        // 씨네큐브 : 37.56978,126.972132
        let cinema1 = TheaterInfo()
        cinema1.title = "씨네큐브"
        cinema1.phoneNumber = "02-2002-7770"
        // 구조체 객체 생성 메소드
        cinema1.coordinate = CLLocationCoordinate2D(latitude: 37.5698, longitude: 126.9721)

        // 인디스페이스 : 37.570653,126.97164
        let cinema2 = TheaterInfo()
        cinema2.title = "인디스페이스"
        cinema2.phoneNumber = "02-738-0366"
        cinema2.coordinate = CLLocationCoordinate2D(latitude: 37.570653, longitude: 126.97164)

        // 배열을 이용해서 다수의 어노테이션 추가
        self.mapView.addAnnotations([cinema1, cinema2])

        let cafe1 = MKPointAnnotation()
        cafe1.title = "카페";
        cafe1.coordinate = CLLocationCoordinate2DMake(37.561755,126.985254);
        self.mapView.addAnnotation(cafe1)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MuseumInfo{
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "MUSEUM")
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "MUSEUM")
                annotationView!.image = UIImage(named: "museum.png")
                annotationView!.canShowCallout = true
                
                let infoButton = UIButton(type: UIButtonType.infoLight)
                // 태그 - 어노테이션 뷰의 콜 아웃 버튼 클릭 이벤트에서 좌/우 컨트롤 구분용
                infoButton.tag = 1
                annotationView!.rightCalloutAccessoryView = infoButton
                
            }
            return annotationView
        }
        else if annotation is TheaterInfo {
            // 영화관 정보에 해당하는 어노테이션 뷰 제공
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "THEATER")
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "THEATER")
                annotationView!.image = UIImage(named: "film")
                annotationView!.canShowCallout = true
            } else {
                annotationView!.annotation = annotation
            }
            return annotationView
        }
        else {
            // 기타 어노테이션 뷰
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "DEFAULT")
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "DEFAULT")
                annotationView!.canShowCallout = true
            } else {
                annotationView!.annotation = annotation
            }
            return annotationView
        }
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if let museum = view.annotation as? MuseumInfo {
            print("calloutAccessoryControlTapped : \(museum.title), control tag :",control.tag)
            
            
            if let urlStr = museum.url, let url = URL(string: urlStr) {
                let detailVC = SFSafariViewController(url: url)
                self.present(detailVC, animated: true, completion: nil)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addAnotations()
    }
}
//
//import UIKit
//import CoreLocation
//
//extension CLActivityType {
//    func description() -> String {
//        switch self {
//        case .other:
//            return "Other"
//        case .automotiveNavigation:
//            return "Automotive Navigation"
//        case .fitness:
//            return "Fitness"
//        case .otherNavigation:
//            return "Other Navigation"
//        }
//    }
//}
//
//class ViewController: UIViewController, CLLocationManagerDelegate {
//    // 로컬 변수로 선언하면 메모리 해제됨 - 프로퍼티로 선언
//    var manager : CLLocationManager!
//    
//    @IBOutlet weak var textView: UITextView!
//    
//    var mornitoringLocation : Bool = false
//    
//    // 표준 측정
//    @IBAction func showUserLocation(_ sender: AnyObject) {
//        textView.text = ""
//        previousLocation = nil
//        
//        print("표준 위치 측정 서비스 가능 \(CLLocationManager.locationServicesEnabled())")
//        
//        switch CLLocationManager.authorizationStatus() {
//        case .authorizedAlways, .authorizedWhenInUse:
//            startMornitoring()
//        case .notDetermined:
//            // manager.requestWhenInUseAuthorization()
//            manager.requestAlwaysAuthorization()
//        default:
//            print("위치 정보 접근 권한이 없음 : \(CLLocationManager.authorizationStatus())")
//        }
//    }
//    
//    func startMornitoring() {
//        if mornitoringLocation {
//            print("표준 위치 서비스 중지")
//            textView.text = "표준 위치 서비스 중지\n"
//            manager.stopUpdatingLocation()
//            mornitoringLocation = false
//        }
//        else {
//            print("표준 위치 서비스 시작")
//            textView.text = "표준 위치 서비스 시작\n"
//            // 100미터 단위 정확도
//            manager.desiredAccuracy = kCLLocationAccuracyBest
//            // 10미터 이동
//            manager.distanceFilter = 10
//            
//            // 10초 이후, 100미터 이동 이후에 동작
//            manager.allowDeferredLocationUpdates(untilTraveled: 100, timeout: 10)
//            manager.startUpdatingLocation()
//            mornitoringLocation = true
//        }
//        print("distance filter : \(manager.distanceFilter)")
//        print("accuracy : \(manager.desiredAccuracy)")
//    }
//    
//    
//    @IBAction func mornitoringHeading(_ sender: Any) {
//        if CLLocationManager.headingAvailable() {
//            manager.startUpdatingHeading()
//        }
//        else {
//            print("방향 감시 불가")
//        }
//        
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
//        print("trueHeading \(newHeading.trueHeading)")
//        print("magHeading \(newHeading.magneticHeading)")
//        print("values \(newHeading.x), \(newHeading.y), \(newHeading.z)")
//    }
//    
//    @IBAction func mornitorState(_ sender: Any) {
//        //    manager.sta
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
//        print("didDetermineState")
//    }
//    
//    var mornitoringSignificantChange = false
//    @IBAction func significantChangeMonitoring(_ sender: Any) {
//        textView.text = ""
//        previousLocation = nil
//        
//        print("주요 거리 변화 감지 서비스 가능 \(CLLocationManager.significantLocationChangeMonitoringAvailable())")
//        
//        switch CLLocationManager.authorizationStatus() {
//        case .authorizedAlways, .authorizedWhenInUse:
//            if mornitoringSignificantChange {
//                manager.stopMonitoringSignificantLocationChanges()
//                mornitoringSignificantChange = false
//                textView.text = "Significant Change Location Service Stopped"
//            }
//            else {
//                manager.startMonitoringSignificantLocationChanges()
//                mornitoringSignificantChange = true
//                textView.text = "Significant Change Location Service Started"
//            }
//        case .notDetermined:
//            manager.requestAlwaysAuthorization()
//        default:
//            print("위치 정보 접근 권한이 없음 : \(CLLocationManager.authorizationStatus())")
//        }
//    }
//    
//    var timeFormatter : DateFormatter!
//    var previousLocation : CLLocation!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        manager = CLLocationManager()
//        manager.delegate = self
//        
//        timeFormatter = DateFormatter()
//        timeFormatter.timeStyle = DateFormatter.Style.medium
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let location = locations.last!
//        
//        var str = "============================\n"
//        str += "측정 시각\t: \(timeFormatter.string(from: location.timestamp))\n"
//        str += "현재 위치\t: \(location.coordinate.latitude)" + ",\(location.coordinate.longitude)\n"
//        str += "고도\t\t: \(location.altitude)\n"
//        
//        if let floor = location.floor {
//            str += "현재 층\t: \(floor.level)\n"
//        }
//        
//        // 이동 거리 측정
//        if previousLocation != nil {
//            str += "이동거리\t: \(location.distance(from: previousLocation))\n"
//        }
//        previousLocation = location
//        
//        str += "활동\t\t:\(manager.activityType.description())\n"
//        
//        // 텍스트 뷰에 반영
//        textView.text = str + textView.text
//        print(str)
//    }
//    
//    // 지역 진출입 감시
//    @IBAction func mornitoringRegion(_ sender: Any) {
//        let center = CLLocationCoordinate2DMake(37.533308,127.200351)
//        let region = CLCircularRegion(center: center, radius: 1000.0, identifier: "해운대")
//        manager.startMonitoring(for: region)
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
//        let str = "\(region.identifier) 입장\n"
//        textView.text = str + textView.text
//        print(str)
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
//        let str = "\(region.identifier) 퇴장\n"
//        textView.text = str + textView.text
//        print(str)
//    }
//    
//    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
//        let str = "진출입 감시 에러\(error.localizedDescription)\n"
//        textView.text = str + textView.text
//        print(str)
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
//        let str = "\(region.identifier) 진출입 감시 시작\n"
//        textView.text = str + textView.text
//        print(str)
//    }
//}
