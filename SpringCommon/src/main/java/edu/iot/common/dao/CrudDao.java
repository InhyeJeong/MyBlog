package edu.iot.common.dao;

import java.util.List;

//C : insert
//R : getList / FindbyId
//U : update리턴int 매개변수FS insert 성공:1 실패:예외발생
//D : delete
public interface CrudDao<M, K> { //	model과 id에 대한 제네릭이 2개필요함
	int count() throws Exception; //행의갯수

	M findById(K k) throws Exception; //없으면 null

	List<M> getList() throws Exception;//없으면 비어있는 문자열

	int insert(M m) throws Exception;
	
	int update(M m) throws Exception;

	int delete(K k) throws Exception;

}
