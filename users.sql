CREATE TABLE USERS
(
  USERNAME VARCHAR2(4000) PRIMARY KEY NOT NULL,
  PASSWORD VARCHAR2(4000) NOT NULL,
  VCODE INTEGER,
  VERIFIED INTEGER,
  USER_TYPE INTEGER
);
INSERT INTO HR.USERS (USERNAME, PASSWORD, VCODE, VERIFIED, USER_TYPE) VALUES ('bhattvarun29@gmail.com', 'vvvvvv', 1209194976, 1, 1);
INSERT INTO HR.USERS (USERNAME, PASSWORD, VCODE, VERIFIED, USER_TYPE) VALUES ('karthickarya09@gmail.com', 'kkkkkk', 1209176976, 1, 0);
