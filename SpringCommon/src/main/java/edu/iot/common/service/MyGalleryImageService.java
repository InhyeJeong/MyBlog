package edu.iot.common.service;


import java.util.List;

import edu.iot.common.model.MyGalleryImage;

// Service 인터페이스

public interface MyGalleryImageService {
	
	
	/** GalleryController의 createSubmit 메서드에서 사용됨 */
	//void create(MyGalleryImage mgallery) throws Exception;

	void create(MyGalleryImage mgallery) throws Exception;

	/** GalleryController의 updateForm 메서드에서 사용됨*/
	MyGalleryImage findById(long imageId) throws Exception;

	/** GalleryController의 updateSubmit 메서드에서 사용됨*/
	void update(MyGalleryImage mgallery)throws Exception;
	
	void delete(MyGalleryImage mgallery) throws Exception;
	
	List<MyGalleryImage> getList() throws Exception;
	
	/**파일 업로드를 위한 추가*/
	void addImage(MyGalleryImage image) throws Exception;
	
}
