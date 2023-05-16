# FIP
![image](https://github.com/miji-Park/FIP/assets/129833754/b4a6cf35-124b-40e1-9bf7-b61ac49f337b)


인천일보 아카데미에서 진행한 팀 프로젝트 입니다.

구매 후기를 sns 형식으로 만든 쇼핑몰 사이트 입니다.



# Description

- 개발 기간: 2023.02.27 ~ 2023.03.31 (약 5주)

- 참여 인원: 6명

- 사용 기술

![image](https://github.com/miji-Park/FIP/assets/129833754/c6324ba1-f5d3-4ef6-aa11-f91046117fc5)


  - Spring 4.0,  Apache Tomcat 9.0,  BootStrap,  Mybatis,  Eclipse
  - Java,  Ajax,  Jquery,  MVC Pttern,JSP
  - Oracle 11g DataBase
  - Kakao Api

# 프로젝트 일정 및 데이터베이스 ERD

 ![image](https://github.com/miji-Park/FIP/assets/129833754/096a4f2f-5784-4242-a2ca-6b0eef8bcabc)

![image](https://github.com/miji-Park/FIP/assets/129833754/9cf06210-6520-4f9d-8b15-8e75446531ae)

테이블 : 16개


- 담당 구현 파트

  - 프로젝트 개발환경 구축, OracleDB로 데이터베이스 설계

  - 로그인 페이지, 회원가입 페이지 구현(우편주소API, 이메일 메일전송 API)

  - 상품 페이지(카테고리별/판매순/최신순 별로 상품 조회 가능, 상품상세 페이지에서 수량 및 옵션 선택, 바로 구매 및 장바구니 담기 가능)

  - 주문 결제 페이지(카카오페이 결제 기능)
  
  - 스타일 게시판(최신순/인기순/브랜드 별 조회 가능, 상세페이지에서 좋아요/댓글 기능)

  - 마이페이지(프로필 사진 변경, 회원 탈퇴 기능, 찜 목록, 내가 쓴 글/관심 글 목록)
  
  - 관리자페이지(회원관리, 상품관리, 스타일게시판 관리, 공지사항 관리)


    

# Views & Implementation

 ####메인
  ![image](https://github.com/miji-Park/FIP/assets/129833754/ed98fa70-06ec-4f2f-9ad3-273b7f0ded0c)
  
  
 ####로그인 & 회원가입
 - **로그인 페이지**
 ![image](https://github.com/miji-Park/FIP/assets/129833754/7f322f02-26e5-40b0-8057-5be98757b864)

  
  
  
 - **회원가입 페이지**
  
  ![image](https://github.com/miji-Park/FIP/assets/129833754/be0c3002-b3d4-4c03-b5f4-c490e0ed10fd)


 - **회원가입 시 이메일 인증**
  ![회원가입 이메일인증](https://github.com/miji-Park/FIP/assets/129833754/e1c3b501-5bc6-4bd6-b683-d7200d098431)


  
------

 ####상품페이지

- **상품리스트 페이지**
![image](https://github.com/miji-Park/FIP/assets/129833754/2370b461-258c-4335-b319-f90e3210fc88)


- **상품상세에서 장바구니 담기**

https://github.com/miji-Park/FIP/assets/129833754/54ba8823-6672-49e4-8393-feedf67b6c13





------

 ####주문결제 페이지

// 카카오페이 결제하는 움짤
![카카오페이](https://github.com/miji-Park/FIP/assets/129833754/23094def-9c0b-4bff-865f-85f976640ebc)




------
 #### 스타일 게시판

  - **스타일 게시판 리스트 **
  ![image](https://github.com/miji-Park/FIP/assets/129833754/09a0e7fe-705f-46c0-b5fc-353e5cb461d9)

  
  //스타일 상세에서 댓글 달기랑 좋아요 
![스타일게시판](https://github.com/miji-Park/FIP/assets/129833754/a9bd1179-9311-4875-a61e-1676f8e79de6)



------
 #### 관리자 페이지
  
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



