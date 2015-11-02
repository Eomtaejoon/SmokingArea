package net.board.db;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import net.dao.MySQLSessionFactory;
import net.entity.BoardBean;

//MySQLSessionFactory
public class BoardService {
	
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

	public List<BoardBean> selectByPage(int page, int limit) {

		SqlSession session = MySQLSessionFactory.openSession();
		// list객체 생성
		List<BoardBean> list = null;
		int startrow=(page-1)*5;
		try {
			// 페이징
			list = session.selectList("boardMappeing.boardByPage",
					null, new RowBounds(startrow, limit)); // id값
																						// /
																						// parameter값
		} finally {
			session.close();
		}
		return list;
	}// end selectByPage
	
}//end class
