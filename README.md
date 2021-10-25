# PCM 포켓몬센터 매니저
----------------------------------------------
http://3.37.104.69:8080/

[테스트계정]  
계정1- 로그인아이디: pikachu / 비밀번호: 1111 / 지점: 무지개시티지점 (관리자계정)  
계정2 - 로그인아이디: mew / 비밀번호: 1234 / 지점: 무지개시티지점 (일반계정)  
계정3 - 로그인아이디: purin / 비밀번호: asdf / 지점: 블루시티지점 (관리자계정)    


포트폴리오
-------
[포트폴리오.pdf](https://github.com/jinw0909/PCM/blob/master/portfolio.pdf)


프로젝트 설명
-----------------
본 어플리케이션은 간소화된 물류 관리 어플리케이션입니다.
평소 효율적인 물류 관리 어플리케이션이 있으면 좋겠다고 생각하여 간소하게나마 포켓몬스터라는 소재를 통해 구현해보았습니다.     
포켓몬센터 직원들은 지점을 찾아온 환자의 상태에 따라 치료제 요청서를 작성하고 각 센터의 관리자들은 요청서를 확인한 후 치료제를 발급해주는 것이 주요 기능입니다.  
그 외에도 공지사항 기능을 통해 포켓몬센터 지점간 정보를 공유할 수 있으며, 지점 관리자의 경우 다른 모든 지점의 치료제 발급량을 바로 확인해 볼 수도 있습니다.  

설계
---
* ui설계  
https://ovenapp.io/project/HYGrGBlpfe8OKp3NS5NV5gk0sjEfOATV#ACqj6
* url설계 / db설계  
https://docs.google.com/spreadsheets/d/1D9kaIOSG73_NmJwOMJkvhgz6EP8AxNBWgygUq51JXMA/edit#gid=0

주요기능
------
* 로그인 및 정보수정(공통권한)  
  * package [com.jinw0909.portfolio.commons.*](https://github.com/jinw0909/PCM/tree/develop/src/main/java/com/jinw0909/portfolio/commons)
  * view [webapp/WEB-INF/jsp/commons/*](https://github.com/jinw0909/PCM/tree/develop/src/main/webapp/WEB-INF/jsp/commons)

* 치료제 요청(직원권한)
  * package [com.jinw0909.portfolio.members.*](https://github.com/jinw0909/PCM/tree/develop/src/main/java/com/jinw0909/portfolio/members)
  * view [webapp/WEB-INF/jsp/members/*](https://github.com/jinw0909/PCM/tree/develop/src/main/webapp/WEB-INF/jsp/members)

* 치료제 발급(관리자권한)
  * package [com.jinw0909.portfolio.members.*](https://github.com/jinw0909/PCM/tree/develop/src/main/java/com/jinw0909/portfolio/managers)
  * view [webapp/WEB-INF/jsp/members/*](https://github.com/jinw0909/PCM/tree/develop/src/main/webapp/WEB-INF/jsp/managers)

* 공지사항 및 댓글 작성
  * package [com.jinw0909.portfolio.notice.*](https://github.com/jinw0909/PCM/tree/develop/src/main/java/com/jinw0909/portfolio/notice)
  * view [webapp/WEB-INF/jsp/notice/*](https://github.com/jinw0909/PCM/tree/develop/src/main/webapp/WEB-INF/jsp/notice)


DEMO
-----
* 회원가입 및 정보수정
* 공지사항 및 댓글 작성
* 치료제 요청
* 치료제 발급
* 지점별 발급 현황 확인

사용한 라이브러리 && 라이센스
-----------------------
* Tomcat
* MySQL
* Spring Framework
* MyBatis
* Bootstrap
* jQuery

향후 계획
------
* 직원 프로필 페이지 추가하기
* 모든 지점별 통계를 엑셀로 받을 수 있는 기능 추가하기
