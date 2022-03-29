package test;

import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlSessionBean;

public class SqlSessionFactoryTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
		System.out.println(factory);
	}

}
