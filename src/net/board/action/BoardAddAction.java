package net.board.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardService;
import net.entity.BoardBean;

public class BoardAddAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
	   	ActionForward forward=new ActionForward();
	   	BoardBean boardbean = new BoardBean();
   		String saveFolder="C:\\Users\\12-718-8\\git\\SmokingArea\\WebContent\\boardupload\\";
   		HttpSession session=request.getSession();
   		
   		int fileSize=5*1024*1024; 
   		
   		boolean result=false;
   		
   		try{
   			MultipartRequest multi=null;
   			
   			
   			
   			multi=new MultipartRequest(request, saveFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());
   			   			
   			boardbean.setB_id(multi.getParameter("BOARD_ID"));
   			boardbean.setTitle(multi.getParameter("title"));
   			boardbean.setContent(multi.getParameter("content"));
   			
   			
/*   			System.out.println(multi.getParameter("BOARD_ID"));
   			System.out.println(multi.getParameter("title"));
   			System.out.println(multi.getParameter("content"));*/
   			
	   		
   			BoardService service = new BoardService(); //서비스 객체 생성
	   		result = service.insert(boardbean); 
	   				
	   		if(result==false){
	   			return null;
	   		}
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("./index.me");
	   		session.setAttribute("ch", "1");
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	
}