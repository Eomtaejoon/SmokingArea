package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardDAO;
import net.board.db.BoardBean;

public class BoardAddAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		BoardDAO boarddao=new BoardDAO();
	   	BoardBean boarddata=new BoardBean();
	   	ActionForward forward=new ActionForward();
	   	
   		String saveFolder="c:\\upload\\";
   		
   		int fileSize=5*1024*1024;
   		
   		boolean result=false;
   		
   		try{
   			MultipartRequest multi=null;

   			
   			
   			multi=new MultipartRequest(request, saveFolder, fileSize, "euc-kr", new DefaultFileRenamePolicy());
   			
   			boarddata.setBOARD_ID(multi.getParameter("BOARD_ID"));
	   		boarddata.setBOARD_SUBJECT(multi.getParameter("BOARD_SUBJECT"));
	   		boarddata.setBOARD_CONTENT(multi.getParameter("BOARD_CONTENT"));
	   		boarddata.setBOARD_FILE(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
   			
	   		String[] str = multi.getParameterValues("SELECT");
   			String tmp ="";
   			for(int i=0;i<str.length;i++){
   				tmp=str[i]+","+tmp;
   				System.out.println(tmp);
   			}
	   		
	   		boarddata.setBOARD_YASIK(tmp);
	   		
	   		result=boarddao.boardInsert(boarddata);

	   		if(result==false){
	   			System.out.println("게시판 등록 실패");
	   			return null;
	   		}
	   		System.out.println("게시판 등록 완료");
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("BoardList.bo");
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	
}