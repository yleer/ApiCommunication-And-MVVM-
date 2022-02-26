# 새싹 취미 공유
> 취미를 공유할 수 있는 친구를 찾아보세요!<br /> 원하는 위치와 취미를 지정해 근처에 새싹들에게 취미 요청을 하거나 요청을 받아 같이 취미를 즐겨보세요.


![](header.png)

## Installation
>+ 프로젝트 클론 - https://github.com/yleer/SeSac-Service-Level-Project.git
>+ zip 파일 다운하기 




## Usage example

<p align="center">
  <img src = "https://user-images.githubusercontent.com/48948578/155700533-0f34f804-bc1e-416b-b922-c0b31600fbaa.png" width=1000>
</p>

<br />
<br />

<p align="center">
  <img src = "https://user-images.githubusercontent.com/48948578/155701849-1d224b47-5c93-4b80-a90c-85c3252e9d0d.png" width=700>
</p>


## Features

새싹 취미 공유에 기능들:

* 선택한 위치 주변 새싹 검색
* 동일한 취미를 가진 새싹과 매칭
* 새싹들에 대한 정보 확인
* 매칭된 새싹과 채팅
* 매칭 종료 후 새싹에 대한 리뷰, 신고 
* In App Purchase 기능을 통한 새싹, 그리고 배경화면 이미지 변경
* Push Notification을 통한 푸시에 대한 처리
* 개인정보 수정 및 


## Tech Stack
>+ MapKit을 사용한 지도 표현
>+ Alamofire를 아용한 rest api 통신
>+ SnapKit을 이용한 UI 작성
>+ SocketIO를 통한 채팅 구현
>+ Realm을 이용한 채팅 내용 저장 및 불러오기 
>+ FireBase Auth를 통한 전화번호 인증
>+ FCM을 이용한 push notification 구현
>+ In App Purchase 기능
>+ MVVM, MVC 패턴 사용

```sh
make install
npm test
```
## 회고 
* 1/25
  * API 통신 중 GET 메소드를 통해 정보를 가져와야 하는 부분이 있었는데, 서버측에서의 응답값을 바꾸어 에러가 났다. 이러한 문제를 최소화하기 위해 백앤드 측과 지속적인 소통이 필요할 것 같다.
* 1/26 
  * cellForRowAt을 통해 tableviewCell을 지정해주는 함수에서 각 cell마다 지정해주어야 하는 값이 많아 함수가 거대해졌다. 이 부분을 최소화하기 위하여 각 custom cell에서 configure 함수를 따로 만들어 그 곳에서 cell을 초기화 할 수 있도록 하였다.
  * Custom colors들과 custom images들이 다수 존재하였는데 이들을 사용하기 위해 직접 값을 사용하는데 번거러움을 느꼈다. 이를 좀 더 편하게 사용하기 위하여 UIColor에 extension을 사용하여 사용에 좀더 용이하게 만들었다. 그리고 Images들을 좀더 편하게 사용하기 위해 enum을 만들어 접근을 쉽게 했다.
 * 1/28
   * 기존에 키보드 올림 내림 구현을 IQKeyboard 라이브러리를 사용하여 구현했다. 하지만 디자인에 있어 키보드 상태에 따라 UI가 변화하여 그져 올리고 내리는 것만으로는 부족함을 느꼈다. 이를 해결하기 위해 키보드 내림과 올림을 직접 구현하기로 했다.
   
   ```
   NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)               
   NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
   ```

1/28 일지 원래는 IQKeyboard를 이용하여 키보드 내림 올림 구현을 했다. 하지만 디자인에 있어 그냥 키보드를 올리고 내리는 기능 이외에 키보드가 올라와 있을때 버튼의 위치, 크기가 변해야 해 키보드 올림 내림을 직접 구현하기로 함.  노티피케이션 코드를 이용하여 키도드가 올라가고 내려갈때에 대응 할 수 있음. textfield들에서는 view.endEditing(true)를 사용하면 키보드가 내려갔지만 searchbar에서는 이코드를 사용해도 키보드가 내려가지 않음. 그 대신 resignFirstResponder()를 사용하면 내려가는 것을 파악. 심지어 searchbar에서는 노티피케이션도 안되는 거 같음 https://stackoverflow.com/questions/29925373/how-to-make-keyboard-dismiss-when-i-press-out-of-searchbar-on-swift 나와 같은 문제를 갖고 있음.

https://stackoverflow.com/questions/29882775/resignfirstresponder-vs-endediting-for-keyboard-dismissal/29882945 에서 차이 공부해보자.

* 0.2.1
    * CHANGE: Update docs (module code remains unchanged)
* 0.2.0
    * CHANGE: Remove `setDefaultXYZ()`
    * ADD: Add `init()`
* 0.1.1
    * FIX: Crash when calling `baz()` (Thanks @GenerousContributorName!)
* 0.1.0
    * The first proper release
    * CHANGE: Rename `foo()` to `bar()`
* 0.0.1
    * Work in progress

## Meta

Your Name – [@YourTwitter](https://twitter.com/dbader_org) – YourEmail@example.com

Distributed under the XYZ license. See ``LICENSE`` for more information.

[https://github.com/yourname/github-link](https://github.com/dbader/)

## Contributing

1. Fork it (<https://github.com/yourname/yourproject/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

<!-- Markdown link & img dfn's -->
[npm-image]: https://img.shields.io/npm/v/datadog-metrics.svg?style=flat-square
[npm-url]: https://npmjs.org/package/datadog-metrics
[npm-downloads]: https://img.shields.io/npm/dm/datadog-metrics.svg?style=flat-square
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[wiki]: https://github.com/yourname/yourproject/wiki
