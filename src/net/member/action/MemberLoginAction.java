package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.entity.MemberBean;
import net.member.action.ActionForward;
import net.member.db.MemberDAO;
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
	   		System.out.println("loginaction= "+ request.getParameter("MEMBER_ID"));
	   		
	   		result=service.login(member.getMember_id());
	   		
	   		/*result=memberdao.isMember(member);*/
	   		
	   		
	   		
	   		if(result==0){
	   			response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('비밀번호 불일치.');");
		   		out.println("location.href='/last_project/logindex.me';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
	   		}else if(result==-1){
	   			response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('회원이 없습니다..');");
		   		out.println("location.href='/last_project/logindex.me';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		   	}
	   		
	   		//로그인 성공
	   		session.setAttribute("id", member.getMember_id()); //세션에 id등록
	   		
	   		forward.setRedirect(true); //접속끊었다가 다시 연결하면서 새로운 정보를 보여준다
	   		forward.setPath("/last_project/index.me");
	   		return forward;
	}
}