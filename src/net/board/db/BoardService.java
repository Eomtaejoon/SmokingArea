package net.board.db;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import net.dao.MySQLSessionFactory;
import net.entity.BoardBean;
import net.entity.MemberBean;

//MySQLSessionFactory
public class BoardService {
	//게시글 수
	public int selectCount() {

		SqlSession session = MySQLSessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("boardMappeing.boardCount"); // id값 / parameter값
			
		} finally {
			session.close();
		}
		return count;
	}// end select

	//페이징
	public List<BoardBean> selectByPage(int page, int limit) {

		SqlSession session = MySQLSessionFactory.openSession();
		// list객체 생성
		List<BoardBean> list = null;
		int startrow=(page-1)*3;
		try {
			// 페이징
			list = session.selectList("boardMappeing.boardByPage",
					null, new RowBounds(startrow, limit));
		} finally {
			session.close();
		}
		return list;
	}// end selectByPage
	
	//글등록
	@SuppressWarnings("finally")
	public boolean insert(BoardBean board){
		SqlSession session = MySQLSessionFactory.openSession();
		//코드 패턴
		try{
			//id값 반드시 일치
			int n = session.insert("boardMappeing.insert", board);
			// n값은 작용된 레코드
			if(n==1){
				session.commit();
				
			}
		}finally{
			session.close();
			return true;
		}
	}//end insert
	
	
	//list readcountupdate
	@SuppressWarnings("finally")
	public void readCountUpdate(int num){
		SqlSession session = MySQLSessionFactory.openSession();
		//코드 패턴
		try{
			//id값 반드시 일치
			int n = session.update("boardMappeing.readCountUpdate", num);
			// n값은 작용된 레코드
			System.out.println("n="+n);
			if(n==1){
				session.commit();
			}
		}finally{
			session.close();
		}
	}//end readCountUpdate
	
	//list readcount
	@SuppressWarnings("finally")
	public BoardBean detail(int num){
		SqlSession session = MySQLSessionFactory.openSession();
		//코드 패턴
		BoardBean bean = null;
		System.out.println("detail="+num);
		try{
			//id값 반드시 일치
			bean = session.selectOne("boardMappeing.detail", num);
		}finally{
			session.close();
		}return bean;
	}//end readCountUpdate
	
}//end class
