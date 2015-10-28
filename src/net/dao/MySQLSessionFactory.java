package net.dao;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MySQLSessionFactory {

	static	SqlSessionFactory sqlSessionFactory = null;
	//SqlSessionFactory �����ϴ� �޼ҵ�
	public static SqlSessionFactory 
	    getSqlSessionFactory(){
		
	  try{	
		String resource = "Configuration.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		 sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	  }catch(Exception e){
		  e.printStackTrace();
	  }
		return sqlSessionFactory;
	}//end getSqlSessionFactory()
	
	
	//SQLSession �����ϴ� �޼ҵ�
	public static SqlSession openSession(){
		return getSqlSessionFactory().openSession();
	}
	

}//end class




