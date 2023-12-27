/*
    다대다 관계
    1. 2개의 테이블을 직접 관계 짓는 것은 불가능하다. 
    2. 다대다 관계를 가지는 2개의 테이블과 연결된 중간 테이블이 필요하다.
    3. 일대다 관계를 2개 만들면 다대다 관계가 된다.
*/    

--학생 테이블 생성
CREATE TABLE STUDENT_T(
    STUDENT_NO      NUMBER               NOT NULL PRIMARY KEY, 
    STUDENT_NAME    VARCHAR2(100 byte)   NOT NULL,
    STUDENT_GRADE   VARCHAR2(100 byte)   NOT NULL,
    STUDENT_CLASS   NUMBER               NOT NULL
);

--과목 테이블 생성
CREATE TABLE SUBJECT_T (
    SUBJECT_NO   NUMBER               NOT NULL PRIMARY KEY,
    SUBJECT_NAME VARCHAR2(100  byte)  NOT NULL
);
    
--수강신청 테이블 생성
CREATE TABLE ENROLL_T (
    ENROLL_NO   NUMBER  NOT NULL   PRIMARY KEY,
    STUDENT_NO  NUMBER  REFERENCES STUDENTS_T(STUDENT_NO) ON DELETE CASCADE, -- 학생이 지워지면 수강신청내역도 지워진다.
    SUBJECT_NO  NUMBER  REFERENCES LECTURE_T(LECTURE_NO) ON DELETE SET NULL -- 과목이 폐강되어도 누가 신청했었는지는 알 수 있다(NULL값으로 확인)/학번은 남아있음.
);

--역순으로 삭제
DROP TABLE ENROLL_T;
DROP TABLE SUBJECT_T;
DROP TABLE STUDENT_T;
