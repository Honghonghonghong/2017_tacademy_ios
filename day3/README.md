Day3
====

Picker
------

-	좌우 여백 설정하기
-	Date; DateFormatter, DateComponent Calendar
-	timer mode ?? background 가기 전에 설정?

`sender.date` -> `2017-01-04 02:50:09 +0000`

-	DateFormatter

```swift
let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .short
dateFormatter.timeStyle = .short

let dateStr = dateFormatter.string(from: date)

print(dateStr)
```

`1/7/17, 10:53 AM`

### dataSource and Delegate

-	error `... selector ...` 호출 못해서

패턴
----

-	싱글턴

```swift
classe MyClass {
  static lset sharedInstance = MyClass()
}
```

-	delegate
	-	순환 참조 방지 weak, 클래스 전용 `protocol Name: class{}`

### Tip

[link](http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder)  
 - clone a git repository into a specific folder

```git
git init
git remote add origin <REPO>  
git pull origin master
```
