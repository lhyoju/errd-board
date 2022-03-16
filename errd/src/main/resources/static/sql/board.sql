create table errd_board(
 board_no number(38) primary key --게시물 번호
 ,board_name varchar2(100) not null --작성자
 ,board_cont varchar2(4000) not null --내용
 ,board_pwd varchar2(20) not null --비번
 ,board_hit number(38) default 0--조회수
 ,board_up number(38) default 0 --좋아요수
 ,board_date date --등록날짜
);

select * from errd_board order by board_no desc;

--errd_board_seq 시퀀스 생성
create sequence errd_board_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가옵션
nocache;
