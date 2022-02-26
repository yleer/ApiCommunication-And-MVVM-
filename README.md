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
   위 노티피케이션을 통해 키보드 제어가 가능하였고, 이를 통해 키보드의 상태에 따라 UI에 변화를 줄 수 있었다.
   이때 texteField들은 view.endEditing(true)를 사용하여 키보드 내리는 것이 가능했지만, searchBar에는 이 코드가 작동하지 않았다. 검색을 통해 resignFirstResponder()사용 하면 된다는 것을 알게 되었다.
  
 https://stackoverflow.com/questions/29925373/how-to-make-keyboard-dismiss-when-i-press-out-of-searchbar-on-swift 나와 같은 문제를 갖고 있음. <br />
 https://stackoverflow.com/questions/29882775/resignfirstresponder-vs-endediting-for-keyboard-dismissal/29882945 에서 차이 공부해보자.
 
 * 1/29
    * Api 명세서에 명시되어 있는데로 post 콜을 진행하였다. 하지만 client error를 명시하는 501에러가 발생하였다. 다른 통신들은 아무 문제 작동하여 무엇이 문제인지 모르고 있어 서버측에 어떤 문제가 있나 문의하는 일이 있었다. 아래의 사진이 api가 필요로 하는 파라메터값이고, 그 다음이 내가 보낸 배열의 값이 서버측에서 받아들인 값이다. 
   <img src = "https://user-images.githubusercontent.com/48948578/155841220-99e896a4-2c4a-478a-aaf0-1a7fd90f61d5.png" height=50>
   <img src = "https://user-images.githubusercontent.com/48948578/155841213-3dc3242e-3b8a-487e-b668-a158275a05f1.png" height=50>
   
   위에서 확인 한 것과 같이 배열 인자 값이 올바르지 않게 인자로 넘어간 것을 알게 되었고, Alamofire에서 배열 값을 보낼때 parameter encoding을 해줘아햐는 사실을 알게 되었다. encoding 옵션을 추가하여 통신을 진행하자 통신이 잘 되는 것을 확인 할 수 있었다.

* 2/5
  * 한 특정 화면에서 입력된 사용자의 데이터가 다른 화면에서도 사용이 된다. 하지만 이 데이터가 사용되는 모든 화면에 모두 값을 전달하는 것은 중복되는 코드가 많고 보기에도 좋지 않다는 점을 느꼈다. 이를 해결하기 우해 Singleton 패턴을 사용하게 되었고, 사용자의 관한 임시 정보를 Singleton을 통해 보관하여 해결하였다. 



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
