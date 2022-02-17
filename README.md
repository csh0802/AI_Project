프로젝트 소개

퍼스널 컬러 분석 및 색상 추천정보 제공 서비스

​

기간

2021.11.23 ~ 2021.12.24

​

활용 기술

Spring boot, MariaDB, AWS, Docker

​

프로젝트 배경


 

- 현재 패션과 뷰티 분야에 대한 트렌드가 존재하며, 소비자들은 이를 자기관리 및 자기표현의 수단으로 활용하고 있음


 

- 자기표현의 수단중 중요한 요소중 하나인 퍼스널 컬러 분석에 대한 수요는 높은데 반해 개인 상담의 비용 수준이 매우 높아 분석 서비스를 접하기 어렵다는 문제가 있음

​

- 이에 "옛다 컬너"는 접근성이 뛰어나고 이용이 편리한 퍼스널컬러 분석 서비스를 제공하고자 함

​

​

주요 기능 및 구현 방법

​

1. 퍼스널 컬러 진단

- 네이버 CFR API의 ObjectDetection을 이용해 얼굴인식 및 자체 알고리즘 기반 퍼스널 컬러 진단

- 진단 결과 저장 및 SNS 공유 기능 탑재

​

2. 색 조합 추천

- 매칭된 퍼스널 컬러 기반 추천색상 팔레트 제공

- 사용자의 퍼스널컬러에 대한 Best color 기반 색 조합 시뮬레이터 구현

​

3. 패션 아이템 추천

- 매칭된 퍼스널 컬러 기반 뷰티/패션 아이템 추천

- 링크를 통해 상품 구매 페이지와 연동

​

4. 컬러 정보 공유 커뮤니티

- 퍼스널 컬러 및 뷰티/패션 아이템에 대한 정보를 공유하고 유저 간 교류가 가능한 게시판 구현

​

​

기대효과

​

1. 퍼스널 컬러 진단 및 색 조합 정보 제공을 통해 개인의 맞춤 색상을 인지하고 효율적인 소비 생활을 가능하게 함

​

- 무료로 퍼스널 컬러 정보를 제공함으로써 비용 및 시간 절감

- 직관적인 코디 색 조합 정보를 제공함으로써 간편하게 코디 가능

​

2. 컬러 커뮤니티에서 유저들 간 소통이 이루어지며 웹 사이트가 제공하는 정보 이외에도 추가적인 정보 수집이 가능함

​

- 자신과 같은 톤을 가진 유저들과의 커뮤니케이션을 통해 패션 및 뷰티

아이템에 대한 정보를 확장할 수 있음

​

​

내 역할

​

- 팀장으로써 일정관리 및 조율

- 퍼스널 컬러 진단 알고리즘 설계 (java)

- Docker를 활용한 aws서버 배포, mariaDB rds 구축 및 연동

- colorbox 구상 및 설계

- 전체적 디버깅 및 오류수정
