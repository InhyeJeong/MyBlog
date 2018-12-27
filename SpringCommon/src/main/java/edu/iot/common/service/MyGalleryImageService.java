package edu.iot.common.service;


import java.util.List;
import edu.iot.common.model.MyGalleryImage;


public interface MyGalleryImageService {


	void create(MyGalleryImage mgallery) throws Exception;

	MyGalleryImage findById(long imageId) throws Exception;

	void update(MyGalleryImage mgallery)throws Exception;
	
	void delete(MyGalleryImage mgallery) throws Exception;
	
	List<MyGalleryImage> getList() throws Exception;
	
	/**파일 업로드를 위한 추가*/
	void addImage(MyGalleryImage image) throws Exception;
	
}
