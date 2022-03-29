package test;

import java.util.List;

import hrd.dao.MemberDao;
import hrd.vo.Member;

public class SelectTest {

	public static void main(String[] args) {
		
		MemberDao dao = MemberDao.getInstance();
		
		List<Member> list = dao.selectAll();
		for(Member m : list)
		System.out.println(m);
		
		Member result = dao.selectOne(100004);
		System.out.println("조회 결과 : " + result);
		
		List<Member> results = dao.searchName("김길동");
		System.out.println("김길동 조회 결과 : " + results);
	}

}
