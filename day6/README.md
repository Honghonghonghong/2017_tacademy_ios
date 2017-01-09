day6
====

-	UIApplication

	-	ㅇ이벤트 최종처리
	-	푸쉬 노티와 로컬 노티
	-	멀티 태스킹
	-	앱 URL
	-	shared

-	Application Delegate

	-	UIApplication.shared.delegate as! AppDelegate
	-	project 내에서 공유할때
	-	App 상태 관리
	-	foreground : 활성상태, 비활성상태
	-	background

```
  applicationDidFinishLaunching

  applicationWiillEnterForeground
  applicationDidBecomeActive

  applicationWillResignActive
  DidEnterB

  Terminate
```

-	View Controller

---

-	UIWindow
	-	rootViewControoler : 현재 동작중인 scene
-	접근
	-	UIapplication.shared.delegate?.window
	-	self.view.window(viewDidAppear 이후)

### StoryBoard

-	segue : scene 전환
-	구분 : segue, scene, cell 마다 ID
-	협업 어려움 -> 스토리보드 분리
	-	스토리보드 레퍼런스로 다른 것과 연결
-	스토리보드는 ViewController 만들어줌

```
func instantiateInitialViewController() -> UIViewController?
옵셔널임!

let vc = self.storyboard!.in....
view가 storybard를 통해서 만들어졌을때만
```

```
- scene, UIViewController 만들고 연결
- storyboard reference
  - file name, reference ID, 그리고 현재 storybard에서 접근하는  ID 지정가능
```

### MVC

-	모델 객체 접근 - 싱글턴
	-	class var shared: TodoManager{get}

### Modal

-	대등 tap, 종속 master-detail
-	모달 : 독점

-	모달

	-	사용자의 입력 사황에 집중
	-	모달 방식으로 씬 사용하기, 세그웨이를 이용한 전환, 코드로 전환

```
- 세그웨이 전환
사용자의 이벤트를 필요로함

- 코드로 세그웨이 실행
사용자의 동작 없이 실행가능

- 코드로 모달 씬 전환
```

```
2.
세그웨이가 있어야함
func performSegue(id) 세그웨이 실행
func ㄴshouldPerformSegue() 세그웨이를 실행 여부를 결정
func prepare(...) 실행되기 전에 동작

3.
다음에 나타날 모달에 데이터 보내고 싶을떄
prepare(){
  let vc = segue.destination as? ModalViewController
  vc.data = "---"
}


------

var data:String!

override func viewWillAppear(){
  여기에서 View변경 적용

}

뷰 컨트롤러와, 뷰와 라이프 사이클 다름
```

```
- 모달 씬에서 동작 결과 다시 넘기기
- delegate 로!!

- 델리게이트 프로토콜 정의
protocol AADelegate:Class {
  func complete()
}

weak var delegate: AADelegate!

action {
  // delegate가 있을때 없을때 둘다 해야하지만
  delegate.complete()
  self.dissmiss()
}
```

```
세그웨이 없이 코드로 모달 전환

```

### navigation

-	씬전환 : 스택에 푸쉬

-	템플릿 : Editor -> Embed In 메뉴 이용 뷰컨트롤러가 선택돼 있는 상태에서 활성화

-	show 내비게이션 기반(push), 내비개이션 기반아니면(modal)

-	테이블 뷰는 단골(마스터 씬 작성용)

-	segue 이용해서 전환할때 sender가 cell임

-	Adjust Scroll View Inset(View에서)

	-	self.automaticallyAdjustsScrllViewInsets = false

```
- single view
- navigation Controller 또는 view 선택하고 embed in
- segue show로 연결
-

```

### bar

-	scene에서 편집기능 쓰고싶다
-	var isEditing: Bool 현재 씬에서 사용할거면 바꿔서
-	var editButtonItem: 을 사용하면 편해짐

-	self.navigationItem.rightBarButtonItem = self.editButtonItem

-	self.editButtonitem.targt = self

### tap

-	self.tabBarControllor, tabBarItem
-	UITabBarController
	-	selectedIndex: Int
	-	tabBar
	-	viewControllers 연결된것들
-	UITapBar  

```
```

-	씬 사이에 데이터 공유
-	delegate 이용
