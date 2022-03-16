package com.example.errd.service;

import java.util.List;

import com.example.errd.vo.BoardVO;

public interface BoardService {

	void insertBoard(BoardVO b);

	List<BoardVO> getBoardList(BoardVO b);

	String checkPwd(int no);

	void delBoard(int no);

	int getBoardLike(int board_no);

	void upBoardLike(int board_no);

	void delBoardLike(int board_no);

	int getTotalCount(BoardVO b);

}
