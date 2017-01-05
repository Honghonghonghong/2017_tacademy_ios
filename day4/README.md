day3
====

Cell
----

### sell accessory

-	동적으로 변경 가능 UITableViewCellAccessoryType
-	인스펙터에서 설정
-	i 버튼은 클릭 가능 ; UITableViewDelegate
-	selection mode : single, multi, 편집중 선택?

```
- Table View
- Data Delegation
- Data 설정

- Accessory 넣어보기
- 이벤트 : tableView Delegate 연결
- accessoryButtonTappedForRowWith

- multiple selection
- didSelect...
- deSelect 오타 조심

- selectRow code로 선택
```

### Modify cell in tableView

-	UITableViewCellEditingStyle
-	deleteRowsAtIndexPaths
-	reloadData, reloadSections
-	edittingStyle, none, delete, insert
-	move
	-	view는 자동 반영 data는 이동시켜야함

```
삭제
- [data].remove(at: <index>)
- TableCiew.reloadData() 는 바로
- TableView.deleteRows(at: [index], with: .automatic) 애니메이션

편집
- TableView.isEditing = true
- editingStyleFor

이동
- canMoveRowAt return true
- moveRowAt
```

### Custom

-	custom cell 과 class 연결해야함
-	cell에서 발생하는 것은 cell class 에서 하자
-	부모 클래스 뷰와 다른이름으로

```
- style custom으로
- 원하는 view 넣기
- cell에 대한 cocoatouch class : UITableViewCell (nib은 storyboard 이전에 사용하던..)
- class 연결
- cell 만들때 as! <CellClass>

```

-	생성시 cell.delegate = self
-	delegate는 weak로 대부분
-	:NSObject..로 하면 class전용
-	super super 로 btn식별 가능하지면 귀찮.. 그냥 class에서

```
- protocol ProductCellDelegate: class {...}
- weak var delegate: ProductCellDelegate!
- btn action에 delegat.---()
- viewController에 delegate추가

```

### pull to refresh

### hight

```
tableView.rowHight = 33
tableView.rowHeight = UITableViewAutomaticDimension
```

### TableViewController

-	테이블뷰컨트롤러 상속하는 클래스 만들고
-	연결
-	정적 셀
	-	고정메뉴 같은거
	-	장점, 셀 outlet을 view에서 가능?
	-	TableViewController에서만 사용가능

Collection view
---------------

-	collection view controller
-	셀 작성, .. ,재사용 ID설정

```
- dataSource, deletate 연결
- dataSource의 numberOfItems.... 설정
- CellForItemAt 설정
- dequeReuseableCell
- collectionView의 cell size에 영향받음

- UICollectionViewCell class 만들기

```

Tip
---

-	parm에 type name 빼기

SingleTon
---------

-	하나의 인스턴스를 공통으로 사용함

```swift
class Manager {
  static let sharedManager = Manager()
}

```
