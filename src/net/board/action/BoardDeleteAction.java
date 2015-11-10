package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.*;
import net.entity.BoardBean;

public class BoardDeleteAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("euc-kr");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

	   	boolean result=false;
	   	boolean usercheck=false;
	   	int num=Integer.parseInt(request.getParameter("num"));
	   	
	   	System.out.println("num=" + num);
	   	
	   	BoardService service = new BoardService(); //서비스 객체 생성
   		
	 
	   	/*BoardDAO boarddao=new BoardDAO();
	   	usercheck=boarddao.isBoardWriter(num, id);*/
	   	if(id!="admin"){
	   	  	usercheck = service.isBoardWriter(num, id); 
		   	if(usercheck==false){
		   		response.setContentType("text/html;charset=euc-kr");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('글쓴이가 아닙니다.');");
		   		out.println("location.href='./index.me';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		   	}
	   	}
	   	service.delete(num); 
	    	   	
	   	forward.setRedirect(true);
   		forward.setPath("./index.me");
   		session.setAttribute("ch", "1");
   		return forward;
	 }
}