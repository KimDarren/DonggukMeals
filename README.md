# 동국대학교 오늘의 학식
[![works badge](https://cdn.rawgit.com/nikku/works-on-my-machine/v0.2.0/badge.svg)](https://github.com/nikku/works-on-my-machine)

_There is no English version. If you cannot read Korean, you should go back :) sorry._

## 소개
* iPhone용 **[동국대학교 중앙도서관 열람실](https://itunes.apple.com/app/id875569115)** 어플리케이션입니다.
* 현재, 전세계 앱스토어에 2.0.1 버전이 release 되어있습니다.
* 당일의 동국대학교 학식 정보를 제공합니다.

## 실행하기

**동국대학교 오늘의 학식** 어플리케이션은 [Cocoapods](http://cocoapods.org)를 사용하고 있습니다. 

* Cocoapods를 설치합니다. *이미 설치되어있다면 다음 단계로 넘어가도 좋습니다.*

```bash
# Install cocoapods
[sudo] gem install cocoapods
```

* [Podfile](https://github.com/DarrenLine/DonggukLibrary/blob/develop/Podfile)에 작성된  라이브러리들을 아래의 명령어로 설치합니다.

```bash
# Set up
pod setup

# Install pods
pod install
```

* *DonggukMeals.xcworkspace)* 파일을 열어 Simulator 혹은 iOS Device에 실행합니다.

## 해야할 일들
* 코드 리팩토링
* API 문서 작성 

## 저작권
### [MIT](https://github.com/DarrenLine/DonggukLibrary/blob/develop/LICENSE)
소스코드 참고 및 사용시 저에게 [알려주는건 어떠신가요?](mailto:koreandarren@gmail.com)