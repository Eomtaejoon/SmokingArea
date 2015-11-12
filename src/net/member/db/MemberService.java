package net.member.db;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import net.dao.MySQLSessionFactory;
import net.entity.BoardBean;
import net.entity.MemberBean;
import net.entity.mapBean;

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
	
	//페이징
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
	}// end selectByPage
	
}//end class
