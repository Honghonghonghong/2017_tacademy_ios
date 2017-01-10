day7
====

Data
----

### sandbox

-	도큐먼트 폴더는 다시 얻을 수 없는 데이터들(인터넷 데이터 x)
-	let documentPath = NSSearchPathForDirectoriesInDomains(FielManager.SearchPathDirectory.documentDirectory, FielManager.SearchPathDomainMask.userDomainMask, true)[0]

-	iTunes 파일 공유

	-	plist: Application supports iTunes file sharing

-	NSTemporaryDirectory() temp경로

```
- Bundle.main.bundlePath

- Build Phases -> copy Bundle Resources
  - 번들에 포함될 데이터만

- NSHomeDirectory()
```

### 기본 타입

-	Array -> NSArray 변환 as에 !? 없어도 됨

### User Default

-	파일 경로 불필요
-	key-value 방식
-	SettingBundle plist ?

	-	identifier 로
	-	user Default에서 identifier로 접근

		### SQLite

-	C 기반의 API가 Swift와 사용하기 어렵.

-	target -> Linked Frameworks and Lib에서 더하는데 C 기반은

	-	브릿징 해더파일 생성
	-	빌드 설정
	-	헤더 파일 import
	-	또는, objective-C 파일 생성하면 자동으로 ??

```
- linked
- header 만들고
- build settings -> bridging : rootdir/hearder.h
- header 에 #import <sqlite3.h>

쉽게
- new file class objective-C 이름은 상관 없음
- bridging header 자동 생성

확인
- 자동완성으로
```

-	FMDB, SQLite.swift 등등

pod

```
- porject 만들고 해당 dir 그리고 pod init
- 내용 넣고
- pod install
```

### core Data

### realm

-	객체형 데이터베이스
-	import RealmSwift

```
class Todo: Object {
  dynamic var title: String!
}
RealmOptional<T>

let realm = try! Realm()

let todo = Todo()
todo.title = ""

do {
  let
}

```

```
해당 홈 폴터 / document

가서

```
