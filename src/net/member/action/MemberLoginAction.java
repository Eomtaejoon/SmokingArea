package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.entity.MemberBean;
import net.member.action.ActionForward;
import net.member.db.MemberService;

public class MemberLoginAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	ActionForward forward = new ActionForward();
		 	
		 	HttpSession session=request.getSession();
	   		MemberBean member=new MemberBean();
	   		
	   		int result=-1;
	   		
	   		member.setMember_id(request.getParameter("MEMBER_ID"));
	   		member.setMember_pw(request.getParameter("MEMBER_PW"));
	   		
	   		MemberService service = new MemberService();
	   		
	   		result=service.login(member.getMember_id());
	   		
	   		if(result==0){
	   			response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('');");
		   		out.println("location.href='/last_project/logindex.me';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
	   		}else if(result==-1){
	   			response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('');");
		   		out.println("location.href='/last_project/logindex.me';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		   	}
	   		
	   		session.setAttribute("id", member.getMember_id());
	   		session.setAttribute("ch", "0");
	   		
	   		session.setMaxInactiveInterval(60*60);
	   		forward.setRedirect(true);
	   		forward.setPath("/last_project/index.me");
	   		return forward;
	}
}