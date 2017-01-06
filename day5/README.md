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

Tip
---

-	enum 항목 소문자로
-	delete all untracked file `git clean -fdx`
