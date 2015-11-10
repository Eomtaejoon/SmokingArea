package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		ActionForward forward = new ActionForward();
	 	
		System.out.println("id="+session.getAttribute("id"));
		
		try{
			session.invalidate();
						
	   		forward.setRedirect(true);
	   		forward.setPath("./logindex.me");
	   		return forward;
		}catch(Exception ex){
   			ex.printStackTrace();
   		}
		return null;
		
	}

}
