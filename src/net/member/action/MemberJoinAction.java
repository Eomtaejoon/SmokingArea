package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.entity.MemberBean;
import net.member.action.ActionForward;
import net.member.db.MemberDAO;
import net.member.db.MemberService;

public class MemberJoinAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	request.setCharacterEncoding("utf-8");
		 	
		 	ActionForward forward = new ActionForward();
		 	
	   		MemberBean member=new MemberBean();
	   		
	   		boolean result=false;
	   		
	   		member.setMember_id(request.getParameter("MEMBER_ID"));
	   		member.setMember_pw(request.getParameter("MEMBER_PW"));
	   		member.setMember_phone(request.getParameter("MEMBER_PHONE"));
	   		member.setMember_email(request.getParameter("MEMBER_EMAIL"));
	   		
	   		/*System.out.println(request.getParameter("MEMBER_ID"));*/
	   		
	   		MemberService service = new MemberService();
	   		
	   		result=service.sinup(member);
	   		
	   		
	   		if(result==false){
	   			System.out.println("회원가입 실패");
		   		return null;
		   	}
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("logindex.me");
	   		return forward;
	}
}