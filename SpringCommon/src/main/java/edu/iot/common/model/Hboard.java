package edu.iot.common.model;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class Hboard {
	private long hboardId;
	
	@NotEmpty(message="제목은 필수항목입니다.")
	private String	title;
	
	@NotEmpty(message="부제목은 필수항목입니다.")
	private String	subtitle;
	

	private String	writer;
	

	private String	content;
	
	private int		readCnt;
	
	
	private Date	regDate;
	private Date	updateDate;
	
	//
	private String strRegDate;
	
}
