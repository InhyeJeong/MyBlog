package edu.iot.common.dao;

import java.util.List;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.iot.common.model.Hboard;

public interface HboardDao {
	
	
	@Update({"UPDATE Hboard SET",
			"read_cnt = read_cnt + 1", 
			"WHERE hboard_id=#{hboardId}" })
	void increaseReadCnt(long hboardId) throws Exception;


	// getList
	//	date 다른 형식으로 출력하기 위해 쿼리문에 직접 입력(TOCHAR)
	@Select({"select hboard_id, title, subtitle, writer, content, read_cnt, reg_date, update_date, str_reg_date",
			"from( select row_number()",
					"OVER (ORDER BY reg_date DESC) AS SEQ, hboard_id, title, subtitle, writer, content, read_cnt, reg_date, update_date, TO_CHAR(reg_date,'Month DD, YYYY','NLS_DATE_LANGUAGE=ENGLISH') as str_reg_date",
					"from hboard )",
					"order by hboard_id desc"})
	List<Hboard> getList() throws Exception;
	
	//count
	@Select("SELECT count(*) FROM Hboard")
	int count(long hboardId) throws Exception;
	
	
	//insert
	@Insert({"insert into Hboard(hboard_id, title, subtitle, writer, read_cnt, content, reg_date, update_date)", 
			"values(Hboard_SEQ.NEXTVAL,#{title}, #{subtitle}, #{writer}, 0, #{content}, SYSDATE, SYSDATE)"
		
		})
	@Options(useGeneratedKeys = true,
	keyColumn = "hboard_id", keyProperty = "hboardId")
	int insert(Hboard hboard) throws Exception;
	
	
	//findbyId
	@Select({"select hboard_id, title, subtitle, writer, content, read_cnt, reg_date, update_date, TO_CHAR(reg_date,'Month DD, YYYY','NLS_DATE_LANGUAGE=ENGLISH') as str_reg_date",
		"from hboard",
			"where hboard_id=#{hboardId} "})
	Hboard findById(long hboardId) throws Exception;
	
	
	//update
	@Update({ 	"update Hboard set",
				" title = #{title}, subtitle = #{subtitle}, content = #{content}, update_date = sysdate",
				"WHERE hboard_id=#{hboardId}" })
	int update(Hboard hboard) throws Exception;
	
	
	//delete
	@Delete({ 	"delete from Hboard",
				"where hboard_id=#{hboardId}"})
	int delete(Hboard hboard) throws Exception;
}
