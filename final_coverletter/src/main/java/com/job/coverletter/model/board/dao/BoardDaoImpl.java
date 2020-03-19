package com.job.coverletter.model.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.job.coverletter.model.board.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	@Qualifier("sqlSessionTemPlate")
	private SqlSessionTemplate sqlSession;

	//글목록
	@Override
	public List<BoardDto> boardList() {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "boardList");
		} catch (Exception e) {
			System.out.println("[error] : boardList");
			e.printStackTrace();
		}
		return list;
	}

	//글작성
	@Override
	public int boardInsert(BoardDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "boardInsert", dto);
		} catch (Exception e) {
			System.out.println("[error] : boardInsert");
			e.printStackTrace();
		}
		return res;
	}

	//글상세
	@Override
	public BoardDto boardDetail(BoardDto dto) {
		//BoardDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE + "boardDetail", dto);
		} catch (Exception e) {
			System.out.println("[error] : boardDetail");
			e.printStackTrace();
		}

		return dto;
	}

	//글수정
	@Override
	public int boardUpdate(BoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	//글삭제 (달린 댓글도 다 같이 삭제)
	@Override
	public int boardDelete(int groupno) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE + "boardDelete", groupno);
		} catch (Exception e) {
			System.out.println("[error] : boardDelete");
			e.printStackTrace();
		}
		return res;
	}

	//댓글상세
	@Override
	public List<BoardDto> replyList(BoardDto dto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "replyList", dto);
		} catch (Exception e) {
			System.out.println("[error] : replyList");
			e.printStackTrace();
		}
		return list;
	}

	//댓글작성
	@Override
	public int replyInsert(BoardDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "replyUpdate", dto);
			res = sqlSession.insert(NAMESPACE + "replyInsert", dto);
		} catch (Exception e) {
			System.out.println("[error] : boardDelete");
			e.printStackTrace();
		}
		return res;
	}

	//대댓글작성
	@Override
	public int rereplyInsert(BoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	//댓글삭제
	@Override
	public int replyDelete(int boardseq) {
		// TODO Auto-generated method stub
		return 0;
	}

}
