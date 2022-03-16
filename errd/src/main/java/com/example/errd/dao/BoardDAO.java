package com.example.errd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.errd.vo.BoardVO;

@Mapper
public interface BoardDAO {

	void insertBoard(BoardVO b);

	List<BoardVO> getBoardList(BoardVO b);

	String checkPwd(int no);

	void delBoard(int no);

	int getBoardLike(int board_no);

	void upBoardLike(int board_no);

	void delBoardLike(int board_no);

	int getTotalCount(BoardVO b);
	

}
