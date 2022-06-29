CREATE TABLE TBL_USER (
    USER_NUMBER	NUMBER PRIMARY KEY,
	EMAIL	VARCHAR2(1000) NOT NULL,
	NAME	VARCHAR2(1000) NOT NULL,
	NICKNAME	VARCHAR2(1000) NOT NULL,
	PASSWORD	VARCHAR2(1000) NOT NULL,
	CONTENT	VARCHAR2(1000),
	KAKAO	VARCHAR2(1000),
	REGISTER_DATE DATE DEFAULT SYSDATE,
	ACHIEVEMENT_NUMBER	NUMBER
);

CREATE TABLE TBL_USER_FILE (
    UUID VARCHAR2(1000) PRIMARY KEY,
   	UPLOAD_PATH VARCHAR2(1000) NOT NULL,
   	NAME VARCHAR2(2000) NOT NULL,
   	IMAGE VARCHAR2(10),
   	USER_NUMBER	NUMBER,
   	FILE_NUMBER NUMBER,
   	CONSTRAINT FK_FILE_USER_NUMBER FOREIGN KEY(USER_NUMBER)
   	REFERENCES TBL_USER(USER_NUMBER) ON DELETE CASCADE
);



CREATE TABLE TBL_PROJECT (
    PROJECT_NUMBER	NUMBER PRIMARY KEY,
	TITLE	VARCHAR2(1000) NOT NULL,
	CATEGORY	VARCHAR2(1000) NOT NULL,
	CONTENT	VARCHAR2(4000) NOT NULL,
	AUTHENTICATION	VARCHAR2(4000) NOT NULL,
	APPLY_COUNT NUMBER DEFAULT 1,
	USER_NUMBER NUMBER,
	START_DATE	DATE DEFAULT SYSDATE,
	END_DATE	DATE DEFAULT SYSDATE,
	REGISTER_DATE DATE DEFAULT SYSDATE,
	STATUS NUMBER(3) DEFAULT 0
);

 CREATE TABLE TBL_PROJECT_FILE(
   	UUID VARCHAR2(1000) PRIMARY KEY,
   	UPLOAD_PATH VARCHAR2(1000) NOT NULL,
   	NAME VARCHAR2(2000) NOT NULL,
   	IMAGE VARCHAR2(10),
   	PROJECT_NUMBER	NUMBER,
   	FILE_NUMBER NUMBER,
   	CONSTRAINT FK_FILE_PROJECT_NUMBER FOREIGN KEY(PROJECT_NUMBER)
   	REFERENCES TBL_PROJECT(PROJECT_NUMBER) ON DELETE CASCADE
   );
  
  CREATE TABLE TBL_REVIEW(
   	REVIEW_NUMBER	NUMBER PRIMARY KEY,
	USER_NUMBER	NUMBER NOT NULL,
	PROJECT_NUMBER	NUMBER NOT NULL,
	NICKNAME VARCHAR2(1000) NOT NULL,
	CONTENT	VARCHAR2(4000) NOT NULL,
	REGISTER_DATE DATE DEFAULT SYSDATE,
   	CONSTRAINT FK_REIVEW_PROJECT_NUMBER FOREIGN KEY(PROJECT_NUMBER)
   	REFERENCES TBL_PROJECT(PROJECT_NUMBER) ON DELETE CASCADE,
   	CONSTRAINT FK_REIVEW_USER_NUMBER FOREIGN KEY(USER_NUMBER)
   	REFERENCES TBL_USER(USER_NUMBER) ON DELETE CASCADE
   );
  
    CREATE TABLE TBL_REVIEW_FILE(
   	UUID VARCHAR2(1000) PRIMARY KEY,
   	UPLOAD_PATH VARCHAR2(1000) NOT NULL,
   	NAME VARCHAR2(2000) NOT NULL,
   	IMAGE VARCHAR2(10),
   	REVIEW_NUMBER	NUMBER,
   	FILE_NUMBER NUMBER,
   	CONSTRAINT FK_FILE_REVIEW_NUMBER FOREIGN KEY(REVIEW_NUMBER)
   	REFERENCES TBL_REVIEW(REVIEW_NUMBER) ON DELETE CASCADE
   );
  
  CREATE TABLE TBL_PARTICIPATION(
   	PROJECT_NUMBER	NUMBER,
	USER_NUMBER	NUMBER,
	STATUS	NUMBER(3) DEFAULT 0,
	REGISTER_DATE	DATE DEFAULT SYSDATE,
   	CONSTRAINT FK_PAR_PROJECT_NUMBER FOREIGN KEY(PROJECT_NUMBER)
   	REFERENCES TBL_PROJECT(PROJECT_NUMBER) ON DELETE CASCADE,
   	CONSTRAINT FK_PAR_USER_NUMBER FOREIGN KEY(USER_NUMBER)
   	REFERENCES TBL_USER(USER_NUMBER) ON DELETE CASCADE,
   	CONSTRAINT PARTICIPATION_PK PRIMARY KEY(PROJECT_NUMBER, USER_NUMBER)
   );
  
  CREATE TABLE TBL_LIKE(
   	REVIEW_NUMBER	NUMBER NOT NULL,
	USER_NUMBER	NUMBER NOT NULL,
   	CONSTRAINT FK_LIKE_REVIEW_NUMBER FOREIGN KEY(REVIEW_NUMBER)
   	REFERENCES TBL_REVIEW(REVIEW_NUMBER) ON DELETE CASCADE,
   	CONSTRAINT FK_LIKE_USER_NUMBER FOREIGN KEY(USER_NUMBER)
   	REFERENCES TBL_USER(USER_NUMBER) ON DELETE CASCADE,
   	CONSTRAINT LIKE_PK PRIMARY KEY(REVIEW_NUMBER, USER_NUMBER)
   );
  
	SELECT ALERT_NUMBER, ALERT_USER, USER_NUMBER, TYPE_ALERT, REVIEW_NUMBER, REGISTER_DATE
FROM TBL_ALERT;

  
   CREATE TABLE TBL_REPLY(
   	REPLY_NUMBER	NUMBER PRIMARY KEY,
	REVIEW_NUMBER	NUMBER NOT NULL,
	USER_NUMBER	NUMBER NOT NULL,
	CONTENT VARCHAR2(4000) NOT NULL,
	REGISTER_DATE DATE DEFAULT SYSDATE,
	NICKNAME VARCHAR2(1000),
   	CONSTRAINT FK_REPLY_REVIEW_NUMBER FOREIGN KEY(REVIEW_NUMBER)
   	REFERENCES TBL_REVIEW(REVIEW_NUMBER) ON DELETE CASCADE,
   	CONSTRAINT FK_REPLY_USER_NUMBER FOREIGN KEY(USER_NUMBER)
   	REFERENCES TBL_USER(USER_NUMBER) ON DELETE CASCADE
   );
  
  
  CREATE TABLE TBL_REPORT(
	REPORT_NUMBER	NUMBER PRIMARY KEY,
	USER_NUMBER	NUMBER NOT NULL,
	REVIEW_NUMBER	NUMBER NOT NULL,
	REASON	VARCHAR2(1000) NOT NULL,
	REGISTER_DATE DATE DEFAULT SYSDATE,
   	CONSTRAINT FK_REPORT_REVIEW_NUMBER FOREIGN KEY(REVIEW_NUMBER)
   	REFERENCES TBL_REVIEW(REVIEW_NUMBER) ON DELETE CASCADE,
   	CONSTRAINT FK_REPORT_USER_NUMBER FOREIGN KEY(USER_NUMBER)
   	REFERENCES TBL_USER(USER_NUMBER) ON DELETE CASCADE
   );
  
  CREATE TABLE TBL_MESSAGE_ROOM(
   ROOM_ID VARCHAR2(2000) NOT NULL,
   SEND_USER_NUMBER NUMBER NOT NULL,
   RECEIVE_USER_NUMBER NUMBER NOT NULL,
    CONSTRAINT MESSAGE_ROOM_PK PRIMARY KEY(ROOM_ID)
);
  
CREATE TABLE TBL_MESSAGE(
   MESSAGE_NUMBER NUMBER NOT NULL,
    SEND_USER_NUMBER   NUMBER NOT NULL,
    RECEIVE_USER_NUMBER   NUMBER NOT NULL,
    ROOM_ID   VARCHAR2(1000),
    CONTENT   VARCHAR2(1000) NOT NULL,
    MESSAGE_DATE   VARCHAR2(1000) NOT NULL,   
    CONSTRAINT FK_MESSAGE_SEND_NUMBER FOREIGN KEY(SEND_USER_NUMBER)
    REFERENCES TBL_USER(USER_NUMBER) ON DELETE CASCADE,
    CONSTRAINT FK_MESSAGE_RECEIVE_NUMBER FOREIGN KEY(RECEIVE_USER_NUMBER)
    REFERENCES TBL_USER(USER_NUMBER) ON DELETE CASCADE,
    CONSTRAINT MESSAGE_PK PRIMARY KEY(MESSAGE_NUMBER),
    CONSTRAINT FK_ROOM_ID FOREIGN KEY(ROOM_ID)
   REFERENCES TBL_MESSAGE_ROOM(ROOM_ID) ON DELETE CASCADE
);
  
  CREATE TABLE TBL_FOLLOW(
   	FOLLOWING_NUMBER	NUMBER NOT NULL,
	FOLLOWER_NUMBER	NUMBER NOT NULL,
   	CONSTRAINT FK_FOLLOW_FOLLOWING_NUMBER FOREIGN KEY(FOLLOWING_NUMBER)
   	REFERENCES TBL_USER(USER_NUMBER) ON DELETE CASCADE,
   	CONSTRAINT FK_FOLLOW_FOLLOWER_NUMBER FOREIGN KEY(FOLLOWER_NUMBER)
   	REFERENCES TBL_USER(USER_NUMBER) ON DELETE CASCADE,
   	CONSTRAINT FOLLOW_PK PRIMARY KEY(FOLLOWING_NUMBER, FOLLOWER_NUMBER)
   );
  
  CREATE TABLE TBL_ACHIEVEMENT(
   	ACHIEVEMENT_NUMBER	NUMBER PRIMARY KEY,
	USER_NUMBER	NUMBER NOT NULL,
	MEDAL	VARCHAR2(1000),
   	CONSTRAINT FK_ACHIEVEMENT_USER_NUMBER FOREIGN KEY(USER_NUMBER)
   	REFERENCES TBL_USER(USER_NUMBER) ON DELETE CASCADE
   );
  
       CREATE TABLE TBL_ALERT(
     ALERT_NUMBER NUMBER PRIMARY KEY,
     ALERT_USER NUMBER,
     USER_NUMBER NUMBER,
     TYPE_ALERT VARCHAR2(30),
     REVIEW_NUMBER NUMBER,
     REGISTER_DATE DATE DEFAULT SYSDATE,
     CONSTRAINT FK_ALERT_USER FOREIGN KEY(ALERT_USER)
    REFERENCES TBL_USER(USER_NUMBER) ON DELETE CASCADE,
    CONSTRAINT FK_ALERT_ALERT FOREIGN KEY(USER_NUMBER)
    REFERENCES TBL_USER(USER_NUMBER) ON DELETE CASCADE,
    CONSTRAINT FK_REVIEW_NUMBER FOREIGN KEY(REVIEW_NUMBER)
    REFERENCES TBL_REVIEW(REVIEW_NUMBER) ON DELETE CASCADE
  );
 

 
 
CREATE SEQUENCE SEQ_ALERT;
CREATE SEQUENCE SEQ_USER;
CREATE SEQUENCE SEQ_PROJECT;
CREATE SEQUENCE SEQ_REVIEW;
CREATE SEQUENCE SEQ_REPLY;
CREATE SEQUENCE SEQ_REPORT;
CREATE SEQUENCE SEQ_MESSAGE;
CREATE SEQUENCE SEQ_ACHIEVEMENT;
CREATE SEQUENCE SEQ_USERFILE;
CREATE SEQUENCE SEQ_REVIEWFILE;
CREATE SEQUENCE SEQ_PROJECTFILE;


DROP SEQUENCE SEQ_ALERT;
DROP SEQUENCE SEQ_USER;
DROP SEQUENCE SEQ_PROJECT;
DROP SEQUENCE SEQ_REVIEW;
DROP SEQUENCE SEQ_REPLY;
DROP SEQUENCE SEQ_REPORT;
DROP SEQUENCE SEQ_MESSAGE;
DROP SEQUENCE SEQ_ACHIEVEMENT;
DROP SEQUENCE SEQ_USERFILE;
DROP SEQUENCE SEQ_REVIEWFILE;
DROP SEQUENCE SEQ_PROJECTFILE;


SELECT USER_NUMBER, EMAIL, NAME, NICKNAME, PASSWORD, CONTENT, KAKAO, REGISTER_DATE, ACHIEVEMENT_NUMBER
FROM TBL_USER;

SELECT REPLY_NUMBER, REVIEW_NUMBER, USER_NUMBER, CONTENT, RGISTER_DATE
FROM TBL_REPLY;



SELECT PROJECT_NUMBER, TITLE, CATEGORY, CONTENT, AUTHENTICATION, START_DATE, END_DATE, STATUS
FROM TBL_PROJECT;

INSERT INTO TBL_PROJECT
(PROJECT_NUMBER, TITLE, CATEGORY, CONTENT, AUTHENTICATION, START_DATE, END_DATE, STATUS)
VALUES(SEQ_PROJECT.NEXTVAL, 't1e2st12234223', 't2es1t11232233', 'te1s1t12231134', 't1e1st121113234', SYSDATE, SYSDATE, 0
);


UPDATE TBL_USER_FILE
SET UPLOAD_PATH='', NAME='', IMAGE='', USER_NUMBER=0
WHERE UUID='';

INSERT INTO TBL_MESSAGE
(SEND_USER_NUMBER, RECEIVE_USER_NUMBER, ROOM, CONTENT, MESSAGE_DATE)
VALUES(0, 0, '', '', SYSDATE);

SELECT SEND_USER_NUMBER, RECEIVE_USER_NUMBER, ROOM, CONTENT, MESSAGE_DATE
FROM TBL_MESSAGE;

SELECT US.NICKNAME , US.CONTENT ,RV.CONTENT ,RV.CONTENT 
FROM TBL_REVIEW RV, TBL_USER US  
WHERE RV.USER_NUMBER = US.USER_NUMBER 
AND RV.REVIEW_NUMBER = 1;

SELECT COUNT(RV.REVIEW_NUMBER)
FROM TBL_REVIEW RV, TBL_USER US, TBL_PROJECT PJ 
WHERE RV.USER_NUMBER = US.USER_NUMBER 
AND RV.PROJECT_NUMBER = PJ.PROJECT_NUMBER ;

SELECT REVIEW_NUMBER, USER_NUMBER, PROJECT_NUMBER, CONTENT, REGISTER_DATE
FROM TBL_REVIEW;

SELECT REVIEW_NUMBER, USER_NUMBER, PROJECT_NUMBER, CONTENT, REGISTER_DATE, NICKNAME
FROM TBL_REVIEW;




INSERT INTO TBL_REVIEW
(REVIEW_NUMBER, USER_NUMBER, PROJECT_NUMBER, CONTENT, REGISTER_DATE)
VALUES(SEQ_REVIEW.NEXTVAL, 1, 1, 'testtest', SYSDATE);

INSERT INTO TBL_REPORT
(REPORT_NUMBER, USER_NUMBER, REVIEW_NUMBER, REASON)
VALUES(0, 0, 0, '');

SELECT RN, PJ.PROJECT_NUMBER, PJ.TITLE, PJ.CATEGORY, PJ.CONTENT, PJ.AUTHENTICATION, PJ.START_DATE, PJ.END_DATE
FROM
(
SELECT ROWNUM RN, PJ.PROJECT_NUMBER, PJ.TITLE, PJ.CATEGORY, PJ.CONTENT, PJ.AUTHENTICATION, PJ.START_DATE, PJ.END_DATE
FROM    TBL_PROJECT PJ, TBL_PARTICIPATION PT
WHERE ROWNUM <= 10 ORDER BY COUNT(PT.USER_NUMBER)
)
WHERE RN > 0;
       
SELECT USER_NUMBER, EMAIL, NAME, NICKNAME, PASSWORD, CONTENT, KAKAO, REGISTER_DATE, ACHIEVEMENT_NUMBER
FROM TBL_USER;


INSERT INTO TBL_USER
(USER_NUMBER, EMAIL, NAME, NICKNAME, PASSWORD, CONTENT, KAKAO, REGISTER_DATE, ACHIEVEMENT_NUMBER)
VALUES(1, '111', '222', '333', '444', '111', '222', SYSDATE, 0);


       
 INSERT INTO TBL_PARTICIPATION
 (PROJECT_NUMBER, USER_NUMBER, STATUS, REGISTER_DATE)
 VALUES(1, 1, 0, SYSDATE);

SELECT PJ.PROJECT_NUMBER, PJ.TITLE, PJ.CATEGORY, PJ.CONTENT, PJ.AUTHENTICATION, PJ.START_DATE, PJ.END_DATE
FROM TBL_PROJECT PJ
        
			     
 SELECT COUNT(PJ.PROJECT_NUMBER),PJ.PROJECT_NUMBER 
 FROM TBL_PROJECT PJ
 FULL OUTER JOIN TBL_PARTICIPATION PT
 ON PJ.PROJECT_NUMBER =PT.PROJECT_NUMBER
 GROUP BY (PJ.PROJECT_NUMBER)
 ORDER BY COUNT(PJ.PROJECT_NUMBER) DESC;
						       
       
       
SELECT PROJECT_NUMBER, USER_NUMBER, STATUS, REGISTER_DATE
FROM TBL_PARTICIPATION;
	
SELECT PROJECT_NUMBER, TITLE, CATEGORY, CONTENT, AUTHENTICATION, START_DATE, END_DATE, STATUS
FROM TBL_PROJECT;

SELECT REVIEW_NUMBER, USER_NUMBER, PROJECT_NUMBER, CONTENT, REGISTER_DATE
FROM TBL_REVIEW;

SELECT USER_NUMBER, EMAIL, NAME, NICKNAME, PASSWORD, CONTENT, KAKAO, REGISTER_DATE, ACHIEVEMENT_NUMBER
FROM TBL_USER;

SELECT REPLY_NUMBER, REVIEW_NUMBER, USER_NUMBER, CONTENT, RGISTER_DATE
FROM TBL_REPLY;

INSERT INTO TBL_REPLY
(REPLY_NUMBER, REVIEW_NUMBER, USER_NUMBER, CONTENT, RGISTER_DATE)
VALUES(2, 1, 2, 'ter123st', SYSDATE);

SELECT REVIEW_NUMBER, USER_NUMBER, PROJECT_NUMBER, CONTENT, REGISTER_DATE, NICKNAME
FROM TBL_REVIEW;

INSERT INTO TBL_REVIEW
(REVIEW_NUMBER, USER_NUMBER, PROJECT_NUMBER, CONTENT, REGISTER_DATE, NICKNAME)
VALUES(SEQ_REVIEW.NEXTVAL, 1, 1, 'TESTESETSETSETSETTESTTEST', SYSDATE, (SELECT NICKNAME FROM TBL_USER WHERE USER_NUMBER=1));

SELECT UUID, UPLOAD_PATH, NAME, IMAGE, USER_NUMBER, FILE_NUMBER
FROM TBL_USER_FILE;
             
SELECT UUID, UPLOAD_PATH, NAME, IMAGE, REVIEW_NUMBER, FILE_NUMBER
FROM TBL_REVIEW_FILE;

INSERT INTO TBL_REVIEW_FILE
(UUID, UPLOAD_PATH, NAME, IMAGE, REVIEW_NUMBER, FILE_NUMBER)
VALUES('defg', '', '', '', 0, 0);

SELECT UUID, UPLOAD_PATH, NAME, IMAGE, PROJECT_NUMBER, FILE_NUMBER
FROM TBL_PROJECT_FILE;

SELECT PROJECT_NUMBER, TITLE, CATEGORY, CONTENT, AUTHENTICATION, APPLY_COUNT, USER_NUMBER, START_DATE, END_DATE, STATUS
FROM TBL_PROJECT;

SELECT REVIEW_NUMBER, USER_NUMBER, PROJECT_NUMBER, NICKNAME, CONTENT, REGISTER_DATE
FROM TBL_REVIEW;


INSERT INTO TBL_PROJECT
(PROJECT_NUMBER, TITLE, CATEGORY, CONTENT, AUTHENTICATION, APPLY_COUNT, USER_NUMBER, START_DATE, END_DATE, STATUS)
VALUES(6, 'a', 'a', 'a', 'a', 0, 0, SYSDATE, SYSDATE, 0
);

SELECT PROJECT_NUMBER, USER_NUMBER, STATUS, REGISTER_DATE
FROM TBL_PARTICIPATION;

INSERT INTO TBL_PARTICIPATION
(PROJECT_NUMBER, USER_NUMBER, STATUS, REGISTER_DATE)
VALUES(3, 1, 0, SYSDATE);

SELECT PF.UUID, PF.UPLOAD_PATH, PF.NAME, PF.IMAGE, PF.PROJECT_NUMBER, PF.FILE_NUMBER
FROM TBL_PROJECT_FILE PF, TBL_PARTICIPATION PT, TBL_PROJECT PJ 
WHERE	PT.PROJECT_NUMBER = PJ.PROJECT_NUMBER 
		AND PT.PROJECT_NUMBER = PF.PROJECT_NUMBER  
		AND PT.USER_NUMBER = 1 AND PJ.STATUS = 1;
	
	SELECT PF.UUID, PF.UPLOAD_PATH, PF.NAME, PF.IMAGE, PF.PROJECT_NUMBER, PF.FILE_NUMBER
        FROM TBL_PROJECT_FILE PF, TBL_PARTICIPATION PT, TBL_PROJECT PJ
        WHERE PT.PROJECT_NUMBER = PJ.PROJECT_NUMBER
		AND PT.PROJECT_NUMBER = PF.PROJECT_NUMBER
		AND PT.USER_NUMBER = 1 AND PJ.STATUS = 1;


SELECT UUID, UPLOAD_PATH, NAME, IMAGE, PROJECT_NUMBER, FILE_NUMBER
FROM TBL_PROJECT_FILE;

INSERT INTO TBL_USER
(USER_NUMBER, EMAIL, NAME, NICKNAME, PASSWORD, CONTENT, KAKAO, REGISTER_DATE, ACHIEVEMENT_NUMBER)
VALUES(0, 'admin', 'admin', 'admin', 'admin', '', '', SYSDATE, 0);

        
      