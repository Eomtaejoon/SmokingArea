package net.board.action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardService;
import net.entity.BoardBean;
import net.entity.mapBean;

public class BoardAddAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
	   	ActionForward forward=new ActionForward();
	   	BoardBean boardbean = new BoardBean();
	   	mapBean mapbean = new mapBean();
   		HttpSession session=request.getSession();
   		
   		String saveFolder=request.getSession().getServletContext().getRealPath("/boardupload"); //파일 저장 경로
   		
   		System.out.println("saveFolder="+saveFolder);
   		int fileSize=5*1024*1024; 
   		
   		boolean result=false;
   		boolean result1=false;
   		try{
   			MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());
   			
   			System.out.println("lat= "+multi.getParameter("lat")); 
   			
   			Enumeration formNames=multi.getFileNames();  // 폼의 이름 반환 
   			String formName=(String)formNames.nextElement(); 
   			String fileName=multi.getFilesystemName(formName); // 파일의 이름 얻기 
   			
   			
   			String file_ext = fileName.substring(fileName.lastIndexOf('.') + 1); 
   			if(!( file_ext.equalsIgnoreCase("jpg") || file_ext.equalsIgnoreCase("gif")))
   				System.out.println("업로드 금지 파일"); 
   			
   			
   			if(fileName == null)
   				System.out.println("파일 업로드 실패");
   			else
   				fileName=new String(fileName.getBytes("8859_1"),"euc-kr"); // 한글인코딩 
   			
            //DB처리부
   			boardbean.setB_id(multi.getParameter("BOARD_ID"));
   			boardbean.setTitle(multi.getParameter("title"));
   			boardbean.setContent(multi.getParameter("content"));
   			boardbean.setImg(fileName);
   			
   			
   			mapbean.setTitle(multi.getParameter("title"));
   			mapbean.setLat(multi.getParameter("lat"));
   			mapbean.setLng(multi.getParameter("lng"));
   			/*System.out.println(multi.getFilesystemName("uploadFile"));*/
   			
   			//boardService 객체 생성
   			BoardService service = new BoardService();
	   		
   			
   			result1 = service.mapinsert(mapbean);
   			System.out.println("re1="+result1);  
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