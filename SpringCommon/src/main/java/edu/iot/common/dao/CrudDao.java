package edu.iot.common.dao;
//CRUD dao
//model과 id에 대한 제네릭이 2개필요함
//타입, 키로 사용되는 것의타입이 바뀐다
// 매서드명 매개변수의 갯수는 변하지 않는다. > generic으로 표현한다.
import java.util.List;
// 순서 : table정의 > model객체저의 >dao 인터페이스 정의 >Impl 구현객체정의 > 설정Alias 와 mapper등록 >mapper정의
import java.util.Map;


//C : int insert(FS s)
//R : 다양하게 나올 수 있다. 1) List<F S> getList() / 2) FS findById(long id)
//U : 리턴int 매개변수FS insert 성공:1 실패:예외발생
//D : id를 주고 delete하기
public interface CrudDao<M, K> { //model과 id에 대한 제네릭이 2개필요함
	int count() throws Exception; //행의갯수

	M findById(K k) throws Exception; //없으면 null

	List<M> getList() throws Exception;//없으면 비어있는 문자열

	int insert(M m) throws Exception;
	
	int update(M m) throws Exception;

	int delete(K k) throws Exception;
	
	//paginationDao를 옮김
	/**MyBatis 연결하면서 매개변수를 Map으로 바꿈 : 자동으로 호출하도록*/
	List<M> getPage(Map map) throws Exception; //end포함됨
}