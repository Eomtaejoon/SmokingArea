package net.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardService;
import net.entity.CommendBean;

public class ComdAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ActionForward forward=new ActionForward();
	   	CommendBean commdBean = new CommendBean();
   		HttpSession session=request.getSession();

   		List comtlist=new ArrayList();
   		
   		boolean result=false;
   		try{
   			
   			
            //DB처리부
   			commdBean.setId(request.getParameter("comt_id"));
   			commdBean.setComments(request.getParameter("comment"));
   			commdBean.setB_num(Integer.parseInt(request.getParameter("b_num")));
   			//boardService 객체 생성
   			BoardService service = new BoardService();
	   		
   			
   			result = service.commdinsert(commdBean); 
	   				 
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
