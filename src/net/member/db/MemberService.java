package net.member.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import net.dao.MySQLSessionFactory;
import net.entity.MemberBean;
import net.entity.mapBean;

//MySQLSessionFactory
public class MemberService {
	
	@SuppressWarnings("finally")
	//sinup
	public boolean sinup(MemberBean member){
		SqlSession session = MySQLSessionFactory.openSession();
		try{
			int n = session.insert("memberMappeing.sinup", member);
			System.out.println(n);
			if(n==1){
				session.commit();
				
			}
		}finally{
			session.close();
			return true;
		}
	}//end sinup
	
	//login
	@SuppressWarnings("finally")
	public int login(String member_id){
		int result = 0;
		SqlSession session = MySQLSessionFactory.openSession();
		MemberBean bean = null;
		try{
			bean = session.selectOne("memberMappeing.login", member_id);
			
			if(bean!=null){
				result = 1;
			}
		}finally{
			session.close();
			return result;
		}
	}
	
	//mapselect
	public List<mapBean> mapSelect() {

		SqlSession session = MySQLSessionFactory.openSession();
		// list객체 생성
		List<mapBean> list = null;
		try {
			// 페이징
			list = session.selectList("memberMappeing.mapselect");
		} finally {
			session.close();
		}
		return list;
	}// end mapselect
	
}//end class
