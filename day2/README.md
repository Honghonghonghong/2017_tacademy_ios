-	프로토콜 선언시 optional은 구현하지 않아도 되는 부분

알림
----

-	두 obj가 통신할때 Notification
-	발송, 수신 두 obj는 서로의 정보를 모름, 알림에 대한 이름만!
-	center, post, addObserver
-	키보드가 올라오는 noti가 오면 observre가 수신

적응형 UI
---------

-	배치를 다르게 but 다양한 크기 -> 묶자 e.g. (4', 4.7' 가로), (4',4.7,5.5' 세로) ..
-	Size Class  
	Regular, compact, any 3가지
-	기기 대상 -> Size Class

```swift3
let trait = self.traitCollection
trait.verticalSizeClass == .compact
...

willTrans...
```

코드로
------

-	NSLayoutConstraint
-	위치제약은 부모에 크기는 자기자신에

Bar
---

-	내이게이션바, 툴바, 바버튼(UIButton과 다름)...

```swift3
UIToolbar
```

Scroll View
-----------
