package net.board.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardService;
import net.entity.BoardBean;

 public class BoardDetailAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{ 
		request.setCharacterEncoding("euc-kr");
		HttpSession session=request.getSession();
		
		BoardBean boardlist=new BoardBean();
	   	BoardService service = new BoardService(); //서비스생성
	   	
	   	
		int num=Integer.parseInt(request.getParameter("num"));
		
		service.readCountUpdate(num);
		boardlist=service.detail(num);
	   	
		
	   	if(boardlist==null){
	   		System.out.println("실패");
	   		return null;
	   	}
	   	System.out.println("성공");
	   	
	   	request.setAttribute("boardlist", boardlist);
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(true);
	   	forward.setPath("./index.me");
   		session.setAttribute("ch", "1");
   		return forward;

	 }
}