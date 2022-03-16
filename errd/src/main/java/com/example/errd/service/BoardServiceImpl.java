package com.example.errd.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.errd.dao.BoardDAO;
import com.example.errd.vo.BoardVO;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDao;
	
	@Override
	public void insertBoard(BoardVO b) {
		boardDao.insertBoard(b);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO b) {
		return boardDao.getBoardList(b);
	}

	@Override
	public String checkPwd(int no) {
		return boardDao.checkPwd(no);
	}

	@Override
	public void delBoard(int no) {
		boardDao.delBoard(no);
	}

	@Override
	public int getBoardLike(int board_no) {
		return boardDao.getBoardLike(board_no);
	}

	@Override
	public void upBoardLike(int board_no) {
		boardDao.upBoardLike(board_no);		
	}

	@Override
	public void delBoardLike(int board_no) {
		boardDao.delBoardLike(board_no);
	}

	@Override
	public int getTotalCount(BoardVO b) {
		return boardDao.getTotalCount(b);
	}
	
}
