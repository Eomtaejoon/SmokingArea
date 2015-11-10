package net.board.action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardDAO;
import net.board.db.BoardService;
import net.member.db.MemberService;

 public class BoardListAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward= new ActionForward();
		HttpSession session=request.getSession();
		session.removeAttribute("ch");
		session.setAttribute("ch", "0");
		String id=(String)session.getAttribute("id");
		List boardlist=new ArrayList();
	  	
		int page=1;  //기본적으로 1페이지 부터 시작.
		int limit=3; //페이지당 개수 제한.
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		BoardService service = new BoardService();
		int listcount=service.selectCount(); //총 리스트 수
		boardlist = service.selectByPage(page,limit); //실질적인 리스트 받아오는
		//총 페이지 수
		int maxpage=(int)((double)listcount/limit+0.95); //현재 페이지에 보여줄 시작 페이지 수
   		
   		int startpage = (((int) ((double)page / 3 + 0.9)) - 1) * 3 + 1;//현재 페이지에 보여줄 마지막 페이지 수
   		
   		int endpage = maxpage;
   		
   		if (endpage>startpage+3-1) endpage=startpage+3-1;
   		
   		request.setAttribute("page", page);		  //현재 페이지 수
   		request.setAttribute("maxpage", maxpage); // 최대 페이지 수
   		request.setAttribute("startpage", startpage); //현재 페이지에 표시할 첫 페이지 수
   		request.setAttribute("endpage", endpage);     //현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("listcount",listcount);  //글 수.
		request.setAttribute("boardlist", boardlist);
		
		
	   	forward.setRedirect(false);
   		forward.setPath("/board/qna_board_list.jsp");
   		return forward;
	 }
 }