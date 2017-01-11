day8
====

multi thread
------------

-	NSObject, Thread, OperationQueue, Operation
-	NSObject
	-	performSelectior  

```
  class My Class: NSObject{
    func countTen(){

    }
  }

  let obj = MyClass()
  obj.performSelector(inBackground: #selector(MyClass.countTen), with nil)
  obj.performSelector(inBackground: #selector(MyClass.countTen), with nil)
```

-	thread

```
클로저
class func detachNewThread(_ block: @escaping() -> Swift.Void)

Thread.detachNewThreadSelector(#selector(), ..)

clas MyThread: Thread {
  override func main(){
    // thread code
  }
}
start()

var thread1 =MyThread()
MyThread.start()
```

-	멀티 쓰레드 큐
	-	동시 시작 쓰레드 수 조절

네트워크
--------

### 리소스

-	리소스 위치 : URL
-	번들 내 리소스 : Bundle class
	-	url(forResource)
-	내부 폴터
-	외부 리소스
-	URL은 알파벳, 숫자, -, \_, . 등
	-	그 외는 % 인코딩
	-	string.addingPercentEncoding
-	이미지 경로 -> URL -> Data -> UIImage
-	ATS 설정하기
-	요청
	-	URLRequest
-	응답
	-	URLResponse
	-	HTTPURLRespone

### 웹 컨텐츠

-	WebKit, 사파리 뷰 컨트롤러, UIKit의 웹뷰

	-	WebKit 추천

-	사파리 뷰 컨트롤러

	-	하나의 씬!

```
import WebKit

let config = WKWebViewConfiguration()
config....
let w = WKWebView(..., config)
self.view addSubviwe(w)

let urlStr = ".....한글"
let encoded urlStr.addingPercentEncoding(.urlQueryAllowed)!
let url = URL(encoded)
let request = URLRequest(url)
w.load(requeset)


// url이 없을 경우 처리
WKNavigationDelegate 추가

```

### 동기식 비동기식

-	비동기식
	-	멀티 쓰레드
	-	API : URLSession, URLConnection
	-	network lib 가장 많이 쓰임
-	메인 Thread에서만 UI접근 가능
-	URSession
	-	default 디스크 기반의 캐쉬 사용
	-	Ephemeral
	-	Background
-	Session 만들때 종류 선택, 그걸로 Task 만들기

```
queue: OperationQueue!
queue.addOperation{
  print("isMain",Thread.cuurent.isMainTread)// 확인할때
}
OperationQueue.main.addOperation{
  // UI 바꿀때
}

------
//클로저 혹은델리게이트
let session = URLSession
// 핸들러 없는건 델리게이트로 동작

session.dataTask(with: url){
  (url: URL?, response: URLResponse?, err:Error?) in
  if error != nil {
    // 에러
  }

  또는

  gauard error == nil else {
    //에러 처리
    return
  }
  response....
}

```

-	NSURLConnextion
	-	동기식에는 return이 있음

XML
---

-	XMLParser
	-	이벤트 기반의 파서
-	<태그> 값 </태그>

-	이미지 리소스 캐쉬

	-	URLCache
	-	cashedResponse

```
let chashe = URLCache..

```

```

let parser = XMLParser(url)
XMLParserDelegate 추가
parser.delegate = self
parser?.parse()

- parserDidStartDocument, End
- parser(didStartElement)
- parser(didEndElement)
- parser(foundChar..)

- 한번에 parsing이 안된다 buffer를 만들자


너무 delegate가 많아지니까

extension ViewCon..:Delegate{

}



```

JSON & Alamofire
----------------

-	타입 변환 해줘야함
-	Alamofire cocoaPod를 이용해서 설치
-	chrom 확장 프로그램 json formatter

```

let result = JSONSerialization.jsonObject(data, options)

result as? [String: [String: ..]...]
귀찮..
if let root = result as? [String: Any], let feed = .... {

}

```

```
var queue: OperationQueue!

cash check
+
queue.addOperation {
  let url: URL!
  let data = try! Data(url)
  OperationQueue.main.addOperation{
      cell.imageView?.image = image
  }
}

를

AlamofireImage  로

```
