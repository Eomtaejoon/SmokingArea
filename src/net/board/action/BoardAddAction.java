package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardDAO;
import net.entity.BoardBean;

public class BoardAddAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
	   	BoardBean boarddata=new BoardBean();
	   	ActionForward forward=new ActionForward();
	   	
   		String saveFolder="C:\\Users\\12-718-8\\git\\SmokingArea\\WebContent\\boardupload\\";
   		
   		int fileSize=5*1024*1024;
   		
   		boolean result=false;
   		
   		try{
   			MultipartRequest multi=null;

   			
   			
   			multi=new MultipartRequest(request, saveFolder, fileSize, "euc-kr", new DefaultFileRenamePolicy());
   			
   			boarddata.setId(multi.getParameter("BOARD_ID"));
	   		boarddata.setTitle(multi.getParameter("BOARD_SUBJECT"));
	   		boarddata.setContent(multi.getParameter("BOARD_CONTENT"));
   			
	   		/*result=boarddao.boardInsert(boarddata);*/

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