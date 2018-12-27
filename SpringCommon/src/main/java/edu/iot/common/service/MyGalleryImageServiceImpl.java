package edu.iot.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.iot.common.dao.MyGalleryImageDao;
import edu.iot.common.exception.IDMissmatchException;

import edu.iot.common.model.MyGalleryImage;

@Service
public class MyGalleryImageServiceImpl implements MyGalleryImageService {
	//	db연결
	@Autowired
	MyGalleryImageDao dao;

	@Override
	public void create(MyGalleryImage mgallery) throws Exception {
		dao.insert(mgallery);
	}

	@Override
	public MyGalleryImage findById(long imageId) throws Exception {
		dao.increaseReadCnt(imageId);
		MyGalleryImage mgallery =dao.findById(imageId);
		return mgallery;
	}


	@Override
	public void update(MyGalleryImage mgallery) throws Exception {
		int result = dao.update(mgallery);
		if(result == 0) {
			throw new  IDMissmatchException();
		}
	}

	@Override
	public void delete(MyGalleryImage mgallery) throws Exception {
		dao.delete(mgallery);
	}

	@Override
	public List<MyGalleryImage> getList() throws Exception {
		return dao.getList();
	}

	@Override
	public void addImage(MyGalleryImage image) throws Exception {//insert
		dao.addImage(image);
	}
}
