# ios-luckycardgame

iOS 학습 프로젝트 #1

## 주간 계획

* 프로젝트 기획을 모두 확인하고 최대 2시간 단위로 계획을 나눈다.
  * 계획에는 학습 할 사항, 구현 할 사항 등 세부적으로 나눈다.
* 시간의 역순으로 구성하여, 가장 최근에 한 작업을 빠르게 확인할 수 있다.

`템플릿 : [ ] [분류] 계획 내역 (예상시간) - (실제소요시간)`

### 학습 주머니

* [ ] [학습] struct와 class의 차이점 (메모리 관리 방법, 속성의 변화의 관점에서) (30m)
* [ ] [학습] iOS의 UIView class에 대한 학습 (1h)
* [ ] [학습] ViewController에서 Drawing Cycle에 대한 학습 (1h 30m)
  * constraint가 계산되는 시점과 constraint에서 safeArea가 반영되는 시점에 대한 학습

### 7월 12일 (수)

* [x] [계획] 7월 11일 회고 및 계획 수정 (30m)

* [ ] [구현] 참가자와 보드를 포함하는 LuckyGame 객체 설계/구현 (3h)
  * [ ] [구현] 참가자별 카드 정렬
  * [ ] [구현] 바닥에 깔린 카드 정렬
  * [ ] [구현] 참가자가 같은 숫자 카드 3장을 가진 경우 판단
  * [ ] [구현] 특정 참가자가 자신의 카드와 바닥 카드를 포함해 같은 카드 3개가 있는지 판단

* [ ] [학습] 테스트 코드 작성 방법 및 컨벤션 학습 (30m)
* [ ] [검증] 게임 로직에 대한 테스트 코드 작성 (1h)

* [ ] [계획] 2주차 기능 구현 계획 세우기

### 7월 11일 (화)

* [x] [계획] 7월 10일 회고 및 계획 수정 (10m)

* [x] [구현] 카드 개수에 따른 카드 분배 UI 구현 (2h)
  * [x] [구현] 적응형 크기를 갖는 CardView 구현
  * [x] [구현] 카드 덱 내의 카드 개수에 따른 spacing 계산
  * [x] [구현] drawing cycle에 맞춰 frame 업데이트
  * [x] [구현] segmented control input에 따른 화면 업데이트 구현
  * [x] [구현] dealerDeck에 카드 분배 구현

<details>
  <summary>스크린샷</summary>

  <img width=300 src="https://github.com/sseungmn/ios-luckycardgame/assets/46219689/87d91a2f-9724-4833-90bd-a05ef4737c20"><img width=300 src="https://github.com/sseungmn/ios-luckycardgame/assets/46219689/4ab0ecb8-abb4-48b0-b908-7ae35d8552dc"><img width=300 src="https://github.com/sseungmn/ios-luckycardgame/assets/46219689/bd63d245-31c7-46aa-badb-a0345668079b">

</details>

### 7월 10일 (월)

* [x] [계획] 지난 주 회고 및 계획 수정 (30m)

* [x] [설계] 카드 분배하기의 MVC구조 설계 (1h) - (30m)

* [ ] [구현] 카드 개수에 따른 카드 분배 UI 구현 (2h)
  * [] [구현] 적응형 크기를 갖는 CardView 구현

---
### 7월 8일 - 9일 (주말)

* [x] [설계] drawing cycle에 맞춰 frame을 업데이트 하기 위한 구조 설계 () - (1h)
* [x] [구현] recursive하게 view의 frame을 설정하고 업데이트하는 로직 구현  () - (2h)

### 7월 7일 (금)

* [x] [계획] 7월 6일 회고 (10m)

* [x] [구현] segment control 구현 (10m)
* [x] [설계] 보드를 관리할 방법에 대한 고민/설계 (1h)
* [x] [구현] 참가 인원에 따른 보드 구현 (30m)

### 7월 6일 (목)

* [x] [계획] 7월 5일 회고 및 주간 계획 수정 (10m)

* [x] [구현] 코드 리뷰 내용 반영 (10m) - (1hr)
* [x] [구현] 카드게임 구조체 구현 (40m) - (1hr 40m)
  * 카드게임을 구현하기 위해 CardDeck에 API추가

<details>
  <summary>스크린샷</summary>

  <img width="650" alt="image" src="https://github.com/softeerbootcamp-2nd/ios-luckycardgame/assets/46219689/bae6d28e-5b39-40bb-83f9-b1d93049eb50">
  <img width="550" alt="image" src="https://github.com/softeerbootcamp-2nd/ios-luckycardgame/assets/46219689/d5256242-c5c2-4e1e-aca9-8aede7bf1580">
  <img width="450" alt="image" src="https://github.com/softeerbootcamp-2nd/ios-luckycardgame/assets/46219689/a1ea824d-4cc8-476e-9a58-e773f2bba114">
</details>

### 7월 5일 (수)

* [x] [계획] 7월 4일 회고 및 주간 계획 수정 (10m)

* [x] [학습] View Drawing Cycle과 safeArea가 확정되는 시점에 대한 학습 (1hr) - (1h 20m)
* [x] [리펙토링] 리뷰 반영 및 리펙토링 (1hr) - (1h 40m)

* [x] [구현] 럭키 카드 클래스 설계 (20m) - (20m)
  * [x] [검증] 여러가지 상황에서 확장 가능성을 판단 (10m) - (10m)
* [x] [구현] 럭키 카드 덱 구현 (30m) - (30m)

<details>
  <summary>스크린샷</summary>

  <img width="500" alt="image" src="https://github.com/sseungmn/ios-luckycardgame/assets/46219689/62543a2f-07a5-4c57-96b5-014d9b66b332">
</details>

### 7월 4일 (화)

* [x] [계획] 프로젝트 주간 계획 작성 (1h)

* [x] [구현] 프로젝트 생성 및 요구사항에 따른 설정 (10m) - 20230704_1416
* [x] [구현] 각 뷰의 Frame 계산하기 (20m) - 20230704_1735
  * [x] [공부] safeArea에 대해 알아보기 (20m) - 20230704_1514
* [x] [구현] 요구사항에 맞는 View 만들기 (20m) - 20230704_1735

<details>
  <summary>스크린샷</summary>

  <img width=250; src="https://github.com/sseungmn/ios-luckycardgame/assets/46219689/39485090-5124-4066-b22c-6c93c7a2ddb7"><img width=250; src="https://github.com/sseungmn/ios-luckycardgame/assets/46219689/3cca6d8e-b6cc-49ff-9cde-26e341f720fd"><img width=250; src="https://github.com/sseungmn/ios-luckycardgame/assets/46219689/6a949508-4b2a-4b16-8e83-f440e4643f31">
</details>

* [ ] [학습] Info.plist의 목적 및 적용방식에 대한 학습 (30m)
