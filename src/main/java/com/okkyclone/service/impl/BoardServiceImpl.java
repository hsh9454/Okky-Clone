
package com.okkyclone.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.okkyclone.domain.BoardVO;
import com.okkyclone.domain.Criteria;
import com.okkyclone.mapper.BoardMapper;
import com.okkyclone.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	@Override
	public List<BoardVO> getList(Criteria cri) {
		System.out.println("목록 가져오기 (페이징 포함): " + cri);
		return mapper.getList();
	}

	@Override
	public void register(BoardVO board) {
		mapper.insert(board);
	}

	@Override
	public BoardVO get(Long bno) {
		mapper.updateViewCount(bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		return mapper.delete(bno) == 1;
	}

	@Override
	@Transactional
	public boolean toggleLike(Long bno, String userid) {
		if (mapper.checkLikeLog(bno, userid, 2) > 0) {
			return false;
		}

		int count = mapper.checkLikeLog(bno, userid, 1);
		if (count > 0) {
			mapper.removeLikeLog(bno, userid, 1);
			mapper.updateLikeCount(bno, -1);
			return false;
		} else {
			mapper.addLikeLog(bno, userid, 1);
			mapper.updateLikeCount(bno, 1);
			return true;
		}
	}

	@Override
	@Transactional
	public boolean toggleDislike(Long bno, String userid) {
		if (mapper.checkLikeLog(bno, userid, 1) > 0) {
			return false;
		}

		int count = mapper.checkLikeLog(bno, userid, 2);
		if (count > 0) {
			mapper.removeLikeLog(bno, userid, 2);
			mapper.updateDislikeCount(bno, -1);
			return false;
		} else {
			mapper.addLikeLog(bno, userid, 2);
			mapper.updateDislikeCount(bno, 1);
			return true;
		}
	}

	@Override
	public List<BoardVO> getListByParent(String parentSlug, Criteria cri) {
	    return mapper.getListByParent(parentSlug, cri);
	}
	@Override
	public List<BoardVO> getList() {
		System.out.println("메인 페이지용 전체 목록 가져오기");
		return mapper.getList();
	}

	@Override
	public List<BoardVO> getTechList() {
		System.out.println("테크 지식/뉴스 목록 가져오기");
		return mapper.getTechList();
	}

	@Override
	public List<BoardVO> getListWithCategory(Criteria cri, String category) {
		System.out.println("카테고리별 목록 가져오기: " + category);
		return mapper.getListWithCategory(cri, category);
	}

	@Override
	public List<BoardVO> getPopularList(String type) {
		System.out.println("인기글 리스트 가져오는 중... 타입: " + type);
		return mapper.getPopularList(type);
	}

	@Override
	public List<BoardVO> getCategoryList(String category) {
		System.out.println("카테고리별 리스트 조회 시작: " + category);
		return mapper.getCategoryList(category);
	}
	
	@Override
	public List<BoardVO> getTechKnowledgeList() {
		return mapper.getTechKnowledgeList();
	}
}
