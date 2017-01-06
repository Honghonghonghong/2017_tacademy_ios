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

Tip
---

-	enum 항목 소문자로
