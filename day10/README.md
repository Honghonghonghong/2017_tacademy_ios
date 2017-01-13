day 10
======

지도와 위치 정보 활용
---------------------

-	MapKit

	-	MKMapView

-	CLLocationCoordinate2D : 위치 정보

-	MKMapViewDelegate

	-	지도 로딩, 에러, 사용자의 지도 스크롤

```
Storyboard에 MapView 만들고 import MapKit!
```

### 위치 정보 출력

-	위치 정보 : Annotation
-	지도에 출력 AnnotationView
-	MKAnnotation

```

```

-	더 많은 정보 담기
-	MKAnnotationView, MKPinAnnotationView

```

class <name>: MKPointAnotation {

}

if annotation is <class> {

}

```

### 어노테이션 뷰와 콜아웃

-	func mapView(... didSelect view: MKAnnotationVew)

### 오버레이

-	MKCircle, MKPolygon, MKPolyline, MKOverly, MKShape
-	오버레이 렌더러가 오버레이 출력
	-	MK..Renderer

### 위치 정보

-	LocationAlwaysUsageDescription
-	LocationWhenInUseUsageDescription

### CLLocationManger <-- ARC 조심!

Sencor
------

-	OperationQueue 화면 업데이트 할꺼면 main으로
-	CMGyroDtaa
	-	manager.startGyroUpdates(to: OperationQueue.main){..}

App Communication
-----------------

-	다른 app과

-	let app = UIAppliactoin.shared

-	let url = URL(string: "...")!

-	app.open(url, options:\[:], completionHandler: nil)

> "tel", "mail", ..

-
