drop procedure SECURE_DML;
drop procedure ADD_JOB_HISTORY;
drop trigger UPDATE_JOB_HISTORY;
drop trigger SECURE_EMPLOYEES;
drop sequence LOCATIONS_SEQ;
drop sequence EMPLOYEES_SEQ;
drop sequence DEPARTMENTS_SEQ;
drop table LOCATIONS cascade constraints purge;
drop table COUNTRIES cascade constraints purge;
drop table JOBS cascade constraints purge;
drop table EMPLOYEES cascade constraints purge;
drop table JOB_HISTORY cascade constraints purge;
drop table DEPARTMENTS cascade constraints purge;
drop table REGIONS cascade constraints purge;