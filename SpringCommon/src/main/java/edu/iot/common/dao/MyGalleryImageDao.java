package edu.iot.common.dao;

import edu.iot.common.model.MyGalleryImage;


public interface MyGalleryImageDao extends CrudDao<MyGalleryImage, Long> {

	/**조회수 증가 */
	// sql문에서 update : 리턴타입이 Integer이거나 void
	Integer increaseReadCnt(long imageId) throws Exception;
	
	//	gallery delete
	void delete (MyGalleryImage mgallery) throws Exception;
	
	//	이미지 추가
	void addImage(MyGalleryImage image) throws Exception;
}
