package egovframework.example.sample.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.boardVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("boardDAO")
public class boardDAO extends EgovAbstractDAO{

	public String insertboard(boardVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("boardDAO.insertboard", vo);
	}

}
