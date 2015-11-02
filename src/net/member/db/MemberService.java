package net.member.db;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import net.dao.MySQLSessionFactory;
import net.entity.MemberBean;

//MySQLSessionFactory
public class MemberService {
	
	@SuppressWarnings("finally")
	public boolean sinup(MemberBean member){
		SqlSession session = MySQLSessionFactory.openSession();
		//肄붾뱶 �뙣�꽩
		try{
			//id媛� 諛섎뱶�떆 �씪移�
			int n = session.insert("memberMappeing.sinup", member);
			System.out.println(n);
			// n媛믪� �옉�슜�맂 �젅肄붾뱶
			if(n==1){
				session.commit();
				
			}
		}finally{
			session.close();
			return true;
		}
	}//end sinup
	
	@SuppressWarnings("finally")
	public int login(String member_id){
		int result = 0;
		SqlSession session = MySQLSessionFactory.openSession();
		//肄붾뱶 �뙣�꽩
		MemberBean bean = null;
		try{
			//id媛� 諛섎뱶�떆 �씪移�
			bean = session.selectOne("memberMappeing.login", member_id);
			
			if(bean!=null){
				result = 1;
			}
		}finally{
			session.close();
			return result;
		}
		
		
	}

	
	
}//end class
