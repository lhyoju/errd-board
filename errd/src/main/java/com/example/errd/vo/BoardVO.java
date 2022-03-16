package com.example.errd.vo;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class BoardVO {
	
	private int board_no; //게시물 번호
	private String board_name; //작성자
	private String board_cont; //내용
	private String board_pwd; //비번
	private int board_hit; //조회수
	private int board_up; //좋아요수
	private String board_date; //등록날짜
	
	//페이징(쪽나누기)
	private int startrow; //시작행 번호
	private int endrow; //끝행 번호
	
	//검색기능 -> 검색 필드와 검색어
	private String find_field; //검색 필드
	private String find_name; //검색어

	
}
