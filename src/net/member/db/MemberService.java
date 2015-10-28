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
		//코드 패턴
		try{
			//id값 반드시 일치
			int n = session.insert("memberMappeing.sinup", member);
			// n값은 작용된 레코드
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
		//코드 패턴
		MemberBean bean = null;
		try{
			//id값 반드시 일치
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
