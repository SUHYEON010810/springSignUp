package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.MemberVO;
import egovframework.example.sample.service.boardVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("boardDAO")
public class boardDAO extends EgovAbstractDAO{

	public String insertboard(boardVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("boardDAO.insertboard", vo);
	}

	public List<?> selectList(boardVO vo) {
		// TODO Auto-generated method stub
		return list("boardDAO.selectList", vo);
	}

	public boardVO seleteBoardData(int boardID) {
		// TODO Auto-generated method stub
		return (boardVO) select("boardDAO.seleteBoardData", boardID);
	}

	public int deleteBoard(int boardID) {
		// TODO Auto-generated method stub
		return (int) delete("boardDAO.deleteBoard", boardID);
	}

	public int updateViewCnt(boardVO d_vo) {
		// TODO Auto-generated method stub
		return (int) update("boardDAO.updateViewCnt", d_vo);
	}

	public int updateboard(boardVO vo) {
		// TODO Auto-generated method stub
		return (int) update("boardDAO.updateboard", vo);
	}


}
