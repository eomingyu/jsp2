package hrd.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import hrd.vo.Member;
import mybatis.SqlSessionBean;
import test.vo.User;

public class MemberDao {
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static MemberDao dao = new MemberDao();
	private MemberDao() {}
	public static MemberDao getInstance() {
		return dao;
	}
	public int getNextSeq() {
		SqlSession mapper = factory.openSession();
		int result = mapper.selectOne("getNextSeq");
		mapper.close();
		return result;
	}
	//insert(), update(), delete() 메소드는 member.xml에 resultType이 없이
	//실행결과 반영된 행의 개수를 리턴합니다.
	//commit 해야할 명령어 : insert, update, delete
	public int insert(Member vo) {
		SqlSession mapper = factory.openSession();
		int result = mapper.insert("insert", vo);
		mapper.commit();
		mapper.close();
		return result;
	}
	public int update(Member vo) {
		SqlSession mapper = factory.openSession();
		int result = mapper.update("update", vo);
		mapper.commit();
		mapper.close();
		return result; 
	}
	public Member selectOne(int custno) {
		SqlSession mapper = factory.openSession();
		Member result = mapper.selectOne("selectOne", custno);
		mapper.close();
		return result;
	}
	public List<Member> selectAll(){
		SqlSession mapper = factory.openSession();
		List<Member> result = mapper.selectList("selectAll");
		mapper.close();
		return result;
	}
	//검색
	public List<Member> search(String column,String find){
		SqlSession mapper = factory.openSession();
		//Map의 활용은 중요합니다.
		Map<String,String> map = new HashMap<>();
		map.put("column",column);	//key,value
		map.put("find",find);
		//member.xml에 파라미터값 여러개 전달하는 방법 : 클래스, Map
		List<Member> result = mapper.selectList("search", map);
		mapper.close();
		return result;
	}
	//테스트용
	public List<Member> searchName(String name){
		SqlSession mapper = factory.openSession();
		List<Member> result = mapper.selectList("searchName", name);
		mapper.close();
		return result;
	}
	//selectList 메소드의 첫 번째 인자 값은 member.xml 파일에서 실행할 sql 태그의 id값
	//					두 번째 인자 값은 sql 실행에 필요한 파라미터 값.
	
	
	//로그인 테스트용
	public User login(String email,String password) {
		SqlSession mapper = factory.openSession();
		Map<String,String> map = new HashMap<String, String>();
		map.put("email",email);
		map.put("password",password);
		User result = mapper.selectOne("Login", map);
		mapper.close();
		return result;
	}
	
	
}
