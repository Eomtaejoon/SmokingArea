package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardDAO;
import net.board.db.BoardService;
import net.entity.BoardBean;

public class BoardAddAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
	   	ActionForward forward=new ActionForward();
	   	BoardBean boardbean = new BoardBean();
	   	
   		String saveFolder="C:\\Users\\12-718-8\\git\\SmokingArea\\WebContent\\boardupload\\";
   		
   		int fileSize=5*1024*1024; 
   		
   		boolean result=false;
   		
   		try{
   			MultipartRequest multi=null;
   			
   			
   			
   			multi=new MultipartRequest(request, saveFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());
   			   			
   			boardbean.setB_id(multi.getParameter("BOARD_ID"));
   			boardbean.setTitle(multi.getParameter("title"));
   			boardbean.setContent(multi.getParameter("content"));
   			
   			System.out.println(multi.getParameter("BOARD_ID"));
   			System.out.println(multi.getParameter("title"));
   			System.out.println(multi.getParameter("content"));
   			
	   		/*result=boarddao.boardInsert(boarddata);*/
	   		
   			BoardService service = new BoardService();
	   		result = service.insert(boardbean); 
	   				
	   		if(result==false){
	   			return null;
	   		}
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("./BoardList.bo");
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	
}