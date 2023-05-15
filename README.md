# FIP

<p align="center"><img src="![커피한잔](https://github.com/miji-Park/FIP/assets/129833754/f4eedaae-01c2-4536-85fe-b7aed4b8f88a)
"/></p>![커피한잔](https://github.com/miji-Park/FIP/assets/129833754/070b020e-728e-45b7-a6a2-5852899eba70)

<p align="center"><img src="![Uploading 커피한잔.jpg…]()
  "/></p>

인천일보 아카데미에서 진행한 팀 프로젝트 입니다.

구매 후기를 sns 형식으로 만든 쇼핑몰 사이트 입니다.



# Description

- 개발 기간: 2023.02.27 ~ 2023.03.31 (약 5주)

- 참여 인원: 6명

- 사용 기술

<p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/사용한프로그램.png?raw=true"/></p>


  - Spring 4.0,  Apache Tomcat 9.0,  Tiles3,  BootStrap,  Mybatis,  Eclipse
  - Java,  Ajax,  Jquery,  MVC Pttern,JSP
  - Oracle 11g DataBase
  - CoolSMS,  Kakao Api

# 프로젝트 일정 및 데이터베이스 ERD

 <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/프로젝트 일정.png?raw=true"/></p>



 <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/프로젝트 ERd.png?raw=true"/></p>





- 담당 구현 파트

  - 프로젝트 개발환경 구축, OracleDB로 데이터베이스 설계

  - 로그인 페이지, 회원가입 페이지 구현(우편주소API, 핸드폰 문자 인증 API, 이메일 메일전송 API)

  - 아이디,비밀번호 찾기 페이지 구현

  - 문의 게시판 페이지 구현(작성, 수정 ,삭제, 페이징, 검색 기능)
  
  - 문의 게시판 상세 기능 구현(비밀글 , 답변상태 기능)

  - 관리자페이지 문의게시판 구현(미답변인 글들만 보이도록 구현)
  
  - 자주묻는질문 외부 CDN 이용하여 구현


    

# Views

- **메인**

  <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/메인화면.gif?raw=true"/></p>
  
  
  - **로그인**
 
 <p align="center"><img width="930" alt="스크린샷 2023-04-16 오후 4 38 48" src="https://user-images.githubusercontent.com/105100402/232283293-f78ba26e-de74-4688-b45d-1d5220bf11cb.png"></p>
  
  
  
  - **회원가입**
  
  <img width="995" alt="휴대폰 인증" src="https://user-images.githubusercontent.com/105100402/232295001-17fc7d8f-ecef-437a-9193-66407a8cc7b7.png">



  <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/휴대폰인증.gif?raw=true"/></p>




- **펀딩** 

   <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/펀딩상세.gif?raw=true"/></p>





- **공연 예매**

 <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/공연예매.gif?raw=true"/></p>



- **아티스트 SNS**

  <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/sns페이지.gif?raw=true"/></p>


# Implementation

- #### 펀딩 리스트
  
  - **펀딩 리스트 출력 **
    <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/펀딩리스트1.gif?raw=true"/></p>


    1. isotope 플러그인을 사용하여 장르별 정렬 기능 구현.

    2. JsonView를 설정해 Json형태로 데이터를 가져와 Ajax통신으로 펀딩 목록들 페이지에 출력.

  - **펀딩 마감처리 및 펀딩 정보 출력**
    <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/펀딩 체크.png?raw=true"/></p>


    1. Oracle 배치 프로시저, 스케줄러를 사용하여 펀딩 마감처리, 후원 성공여부 판단.
    
    2. Java의 DecimalFormat클래스를 사용하여 천단위 콤마(금액 표기하기) 표기



 

------


- #### 펀딩 상세 페이지

  <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/펀딩 상세페이지.png?raw=true"/></p>

  <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/펀딩 상세페이지2.png?raw=true"/></p>
  
  <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/후원 티어1.png?raw=true"/></p>

  - **펀딩 상세페이지 정보 업데이트 및 예외**

    1. Mybatis 쿼리문을 이용하여 펀딩 게시글의 상세정보를 가져오고 JsonView를 설정하여 Json형태로  데이터를 가져와 Ajax 통신으로 펀딩 상세페이지를 구성.
    2. Mybatis 쿼리문을 이용하여 사용하여 후원 이후 해당 펀딩의 데이터베이스 현재 후원금액 및 후원인원 정보를 실시간으로 업데이트.
    3. Jquery를 사용하여 비회원일 경우, 펀딩 마감 이후 후원하기 기능 Block 처리


------


  - **펀딩 결제**
      <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/카카오결제.png?raw=true"/></p>


    1. Jquery를 사용하여 티어별 후원하기 클릭 시 해당하는 티어의 해택 정보 및 가격 가져오게 구현.
    2. 카카오페이 버튼 클릭시 카카오페이 단편결제 팝업창 표시. QR를 통하여 결제 진행. 
    3. 구매 완료시 카카오페이를 통한 결제완료 정보를  Json형태로 데이터를 가져와 Ajax 결제정보를 팝업창에 표기.


------       


- #### 공연 예매 리스트
  
  - **공연예매 리스트 출력 **
    <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/공연리스트1.png?raw=true"/></p>
    <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/공연리스트2.png?raw=true"/></p>


    1. isotope 플러그인을 사용하여 장르별 정렬 기능 구현.

    2. JsonView를 설정해 Json형태로 데이터를 가져와 Ajax통신으로 공연 목록들 페이지에 출력.
    3. Java File 클래스를 이용하여 해당하는 공연 리스트의 포스터, 브로셔 이미지 주소를 가져와 화면에 표기.


------

- #### 공연예매 상세 페이지


  - **공연예매 상세페이지 정보 업데이트 및 예외**

    <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/공연예매 상세페이지.png?raw=true"/></p>
    <p align="center"><img src="https://github.com/jjwa2/-FFF/blob/master/이미지파일/공연예매 완료.png?raw=true"/></p>
    
    
    1. Mybatis 쿼리문을 이용하여 펀딩 게시글의 상세정보를 가져오고 JsonView를 설정하여 Json형태로  데이터를 가져와 Ajax 통신으로  상세페이지를 구성.
    2. Jquery를 사용하여 비회원일 경우, 공연 마감 이후 공연예매 기능 Block 처리
    3. 공연예매 이후 Java Mail 라이브러리를 통하여 공연티켓 정보 이메일 발송 처리. 

------

- #### 문의 게시판

<p align="center"><img width="932" alt="문의게시판" src="https://user-images.githubusercontent.com/105100402/232291985-952e564f-32e5-4026-8b36-5ffc2d31a17b.png"></p>

1.글 작성할 때 비밀글 체크 시 관리자와 작성자만 글제목과 글내용을 확인할 수 있고 다른 사용자는 노란글씨로 '비밀글입니다'로 보이며 클릭 시 alert창에 '비밀글입니다'라고 뜨며 볼 수 없음
2.관리자가 미답변인 글에 답변을 작성 시 미답변 -> 답변완료로 상태 변경

- **자주묻는질문**

<p align="center"><img width="924" alt="FAQ" src="https://user-images.githubusercontent.com/105100402/232292421-2c197162-5bde-4710-912c-94f4ee52b08a.png"></p>

