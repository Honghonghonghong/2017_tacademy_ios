day5
====

custom ui
---------

### using cocoacountrols

-	https://www.cocoacontrols.com/

```
- storyboard에 collectionView 만들기
- collectionView outlet 만들기
- viewDidLoad에서 layout교체

```

DynamicScene
------------

### animation

-	Asynchronous
-	sync 원하면 completion에 넣기

```
- 원하는 View 만들고
- viewDidAppear에서 UIView.animate(...)

```

### transition

```
- self.<View>.removeFromSuperview()
- self.view.addSubview(<View>)

- UIView.transition(...)
- UIView.transition(from: ,to:)
```

### touch

-	touches.count
-	location, previousLocation(in view: UIView?)  
	pram에 대한 위치
-	UIEvent

```
- touchesBegan
- multiple touch 확성화 여부
- ImageView의 default는 user interaction 꺼져있음
- let touch1 = touches.first
- let potin1 = touch1?.location(in: self.view)

- let touchArray = Array(touches)

- location(in: touch.view) 현재 view interaction 꺼져있으면 상위 view에 대한

```

### 제스처

-	tap, pan, swipe ...
-	target-action
-	interface builder
	-	대상 view에 연결
-	code
	-	gestureRecognizers 만들고
	-	view에 add
-	swipe
	-	방향지정
-	pan
	-	velocity, setTranslation ..
-	pinch
-	rotate
-	touch, gesture 둘다 할때는 기본은 gesture만

```
- View.transform....() matrix 생성
- transform이라 autoLayout 궁합 안맞음
- 원하는 view에 gesture넣기
- action 등록

- pinch
  - sender.scale 얼마나 늘어났나
  - View.transform = View.transform.scaledBy() :
  - sender.scale = 1.0 으로 초기화
```

### dynamics

-	뷰에 물리 효과
-	UIDynamicBehavior
	-	Attachment 같이 이동, push 힘, gravity ...
-	UIDynamicAnimator 행위와 아이템 연결
	-	addBehavior

```
- View 하나 만들고
- UIDynamicAnimator(영향 영역)
- UIGravityBehavior
- animator.addBehavior(.)
- gravity.addItem(View)

-collision.translatesReferenceBoundsIntoBoundary = true
```

> ARC로 인한 문제 : 해결 animator를 밖으로

draw
----

-	BezierPath
	-	currentPoint {get}
	-	func move(to point:CGPoint)

```
선그리기 예제

let path = UIBezierPath()
path.move(to CGPoint(..))
path.addLine(to CGPoint(..))

path.stroke()
```

-	drawRect를 호출하지 않음 자동 호출?
-	setNeedsDisplay 로 해야함

```
- UIView Class 새로 만들기
- let v = MyView()
- self.view.addSubview(v)
- v.frame = CGRect(...)

- 자식 클래스에서 하나라도 init 만들면 init 상속 받지 않음, 전부 override

- storyboard가 먼저 생기는구나 viewDidLoad에서 보다

- override func draw(){

}


```

Tip
---

-	enum 항목 소문자로
-	delete all untracked file `git clean -fdx`
