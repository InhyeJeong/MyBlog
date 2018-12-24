package edu.iot.common.model;

import java.util.Date;
import lombok.Data;

/**database 에서 테이블 생성한 후, 클래스 생성*/
@Data
public class MyGalleryImage {
	private long imageId;
	
	//gallery image 에는 @NotEmpty 어노테이션 검사 안함 > 파일 업로드와 관련있음
	private String title;
	private String description;
	private String fileName; // fileName을 주지 않았을 경우에는 title로 사용함
	private String serverFileName;
	
	private String source;
	//필드추가  : 게시물 조회
	private int readCnt;
	private Date regDate;
	private Date updateDate;


}
