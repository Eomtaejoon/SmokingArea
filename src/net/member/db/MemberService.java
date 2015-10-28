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
	public boolean insert(MemberBean member){
		SqlSession session = MySQLSessionFactory.openSession();
		//코드 패턴
		try{
			//id값 반드시 일치
			int n = session.insert("memberMappeing.Insert", member);
			// n값은 작용된 레코드
			if(n==1){
				session.commit();
				
			}
		}finally{
			session.close();
			return true;
		}
		
	}//end insert

	
	
}//end class
