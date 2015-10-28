package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.entity.MemberBean;
import net.member.action.ActionForward;
import net.member.db.MemberDAO;

public class MemberViewAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	ActionForward forward = new ActionForward();
		 	
		 	HttpSession session=request.getSession();
			MemberDAO memberdao=new MemberDAO();
	   		MemberBean member=new MemberBean();
	   		
	   		String id=(String)session.getAttribute("id");
	   		if(id==null){
				forward.setRedirect(true);
				forward.setPath("/member/MemberLogin.me");
				return forward;
	   		}else if(!id.equals("admin")){
	   			response.setContentType("text/html;charset=euc-kr");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('�����ڰ� �ƴմϴ�.');");
		   		out.println("location.href='./BoardList.bo';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
	   		}
	   		
	   		String viewId=request.getParameter("id");
	   		member=memberdao.getDetailMember(viewId);
	   		
	   		if(member==null){
	   			System.out.println("ȸ�� ���� ���� ����");
		   		return null;
		   	}
	   		
	   		request.setAttribute("member", member);
	   		
	   		forward.setRedirect(false);
	   		forward.setPath("member_info.jsp");
	   		return forward;
	}
}