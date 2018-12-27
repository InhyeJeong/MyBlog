package edu.iot.common.dao;

import edu.iot.common.model.MyGalleryImage;

// gallery 인터페이스
public interface MyGalleryImageDao extends CrudDao<MyGalleryImage, Long> {

	/**조회수 증가 */
	// sql문에서 update : 리턴타입이 integer이거나 void
	Integer increaseReadCnt(long imageId) throws Exception;
	void delete (MyGalleryImage mgallery) throws Exception;
	
	//	이미지
	void addImage(MyGalleryImage image) throws Exception;
}
