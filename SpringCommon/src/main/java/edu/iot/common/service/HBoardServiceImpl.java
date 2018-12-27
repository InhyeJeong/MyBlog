package edu.iot.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.iot.common.dao.HboardDao;
import edu.iot.common.exception.IDMissmatchException;

import edu.iot.common.model.Hboard;




@Service
public class HBoardServiceImpl implements HBoardService {
	@Autowired
	HboardDao dao;

	@Transactional
	@Override
	public void create(Hboard hboard) throws Exception {
		dao.insert(hboard);//board id 생김
		
	}

	@Override
	public Hboard findById(long hboardId) throws Exception {
		dao.increaseReadCnt(hboardId); // 조회수 증가
		Hboard hboard = dao.findById(hboardId);
		return hboard;
	}

	@Override
	public void update(Hboard hboard) throws Exception {
		int result = dao.update(hboard);
		if(result == 0) {
			throw new  IDMissmatchException();
		}		
	}

	@Override
	public void delete(Hboard hboard) throws Exception {
		dao.delete(hboard);
		
	}
	
	//	메인화면에 게시물 list 받아오는 메서드
	@Override
	public List<Hboard> getList() throws Exception {
		return dao.getList();
		
	}





	
}
