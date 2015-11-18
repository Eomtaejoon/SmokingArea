package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardService;
import net.entity.BoardBean;

public class BoardModifyView implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 	ActionForward forward = new ActionForward();
		 	request.setCharacterEncoding("euc-kr");
	   		
			BoardBean boardlist=new BoardBean();
			BoardService service = new BoardService(); //서비스생성
			int num=Integer.parseInt(request.getParameter("num"));
		   
			boardlist=service.detail(num);
		   	
		   	if(boardlist==null){
		   		System.out.println("(63번)수정 실패");
		   		return null;
		   	}
		   	System.out.println("(63번)수정 시작");
		   	
		   	request.setAttribute("boardlist", boardlist);
		   	forward.setRedirect(false);
	   		forward.setPath("/board/qna_board_modify.jsp");
	   		return forward;
	 }
}