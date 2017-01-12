이미지
======

모달 델리게이트
---------------

-	모달, 델리게이트로
-	iOS10 부터 plist에 적어줘야 함
	-	CameraUsageDescription
	-	PhotoLi...
-	카메라 사용 여부 UIImagePickerController.isSor...
-	두개 이상의 prot type
	-	var delegate:(UIImagePickerControllerDelegate *&* UINavigationControllerDelegate)?

```
let picker = UIImagePickerController()
self.show(picker, sender: nil)
+ plist에 권한 주기
- delegate 없이 한경우에도 사라지는 것 까지는 됨
```

-	var sourceType: UIImagePickerControllerSourceType
	-	photoLibrary
	-	camera
	-	savedPhotosAlbum
-	이미지 편집 : var allowsEditing: Bool

> Prior to running the picker interface, set this value to the desired source type.

포토 프레임워크
---------------

-	코드로 !
-	사진과 앨범 단위
	-	Asset, Asset Group, Group List
-	권한 상태 : PHPhotoLibrary
	-	class func authorizationStatus()
	-	notDetermined, restricted, denied, authorized
	-	요청하기: class func requestAuthorization(..)
-	PHAsset 요청: fetch, 옵션: ...
	-	요청 결과 PHFestchResult

멀티 미디어 다루기
------------------

### 아이팟 라이브러리 미디어 재생

-	음원 선택 방법
	-	미디어 피커 : 사용자가 직점
	-	미디어 쿼리 : 검색
-	모달 + 델리게이트
-	systemMusicPlayer, applicationMusicPlayer
-	재생 상태 변경

	-	알림

-	AVFoundation , 스트리밍, 번들에 있는 등등..

	-	audionPlayerDecodErrorDidOccur

### 녹음

### 동영상 재생

-	바로 재생 길이를 모를 수도
	-	NSNotification.Name.MPMovieDurationAcailable

REST
----

-	리소스를 다루는 행위
	-	get, post,put, delete
-	리소스 접근 표현 + 리소스 다루는 행위
