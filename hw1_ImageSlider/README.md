hw1 - Image Slider
==================

시작해보자
----------

-	UI는 쉽게 구성했다.
-	주어진 이미지의 수는 적어서 직접 파일명을 입력해도 되지만 많아진다면..
-	직접하지 말자!
-	[FileManager](https://developer.apple.com/reference/foundation/filemanager)

> An FileManager object lets you examine the contents of the file system and make changes to it. The FileManager class provides convenient access to a shared file manager object that is suitable for most types of file-related manipulations. A file manager object is typically your primary mode of interaction with the file system. You use it to locate, create, copy, and move files and directories. **You also use it to get information about a file or directory or change some of its attributes.**

```swift
let fileM = FileManager.default

if let files = try? fileM.contentsOfDirectory(atPath: ".") {
  print(files)
}
```

-	안된다. `[".Trashes", ".vol", "Applications", "bin", "cores", "dev", "etc", "home", ...]` 원하는 정보가 아니다.

-	뒤적뒤적

-	뒤적뒤적...

[File System](https://developer.apple.com/library/content/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/FileSystemOverview/FileSystemOverview.html)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-	아

![enter image description here](https://developer.apple.com/library/content/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/art/ios_app_layout_2x.png)

> An NSBundle object helps you access the code and resources in a bundle directory on disk.

### 그럼 이제 Bundle Path로 접근하자

```swift
let bundle = Bundle.main
print(bundle.bundlePath)
```

-	굿
-	[hint URL](http://stackoverflow.com/questions/6398937/getting-a-list-of-files-in-the-resources-folder-ios)

끝
--
