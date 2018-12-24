package edu.iot.common.service;



import java.util.List;

import edu.iot.common.model.Hboard;

public interface HBoardService {
	
	public void create(Hboard hboard) throws Exception;
	
	public Hboard findById(long hboardId) throws Exception;
	
	public void update(Hboard hboard) throws Exception;
	
	void delete(Hboard hboard) throws Exception;
	
	List<Hboard> getList() throws Exception;
}
