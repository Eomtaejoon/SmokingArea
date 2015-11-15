package net.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardService;
import net.entity.CommendBean;

public class ComdListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	   	ActionForward forward=new ActionForward();
	   	CommendBean commdBean = new CommendBean();
   		HttpSession session=request.getSession();
   		session.setAttribute("id", "aa");
   		
   		List comtlist=new ArrayList();
   		
   		boolean result=false;
   		try{
   			
   			
   			//boardService 객체 생성
   			BoardService service = new BoardService();
	   		
   			comtlist = service.comtselect();
	   		request.setAttribute("comtlist", comtlist);
	   		forward.setRedirect(false);
	   		forward.setPath("./comt2/index.jsp");
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	
}
