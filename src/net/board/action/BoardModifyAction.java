package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.*;
import net.entity.BoardBean;

 public class BoardModifyAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 request.setCharacterEncoding("euc-kr");
		 ActionForward forward = new ActionForward();
		 HttpSession session=request.getSession();
		 String id=(String)session.getAttribute("id");
		 BoardBean boarddata = new BoardBean();
		 
		 boolean result = false;
		 boolean usercheck=false;
		 
		 int num=Integer.parseInt(request.getParameter("BOARD_NUM"));
		 
		 System.out.println("num="+num);
		 
		 BoardService service = new BoardService(); //서비스 객체 생성
	   	 
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
		 try{
			 boarddata.setNum(num);
			 boarddata.setTitle(
					 			request.getParameter("title"));
			 boarddata.setContent(
					 			request.getParameter("content"));
			 
			 service.boardModify(boarddata);

		   	 System.out.println("수정 완료");
		   	 
		   	 forward.setRedirect(true);
		   	 forward.setPath(
		   			 	"./BoardDetailAction.bo?num="+boarddata.getNum());
		   	 return forward;
	   	 }catch(Exception ex){
	   			ex.printStackTrace();	 
		 }
		 
		 return null;
	 }
}