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
		
		String id=(String)session.getAttribute("id");
		
		
   		if(id==null){
			forward.setRedirect(true);
			forward.setPath("./index.me");
			return forward;
   		}
   		
   				
		List boardlist=new ArrayList();
		
	  	int page=1;  //湲곕낯�쟻�쑝濡� 1�럹�씠吏� 遺��꽣 �떆�옉.
		int limit=5; //�럹�씠吏��떦 媛쒖닔 �젣�븳.
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount=boarddao.getListCount(); 
		boardlist = boarddao.getBoardList(page,limit); 
   		int maxpage=(int)((double)listcount/limit+0.95);
		BoardService service = new BoardService();
		
		int listcount=service.selectCount(); //珥� 由ъ뒪�듃 �닔
		
		boardlist = service.selectByPage(page,limit); //�떎吏덉쟻�씤 由ъ뒪�듃 諛쏆븘�삤�뒗
		
		int maxpage=(int)((double)listcount/limit+0.95); //�쁽�옱 �럹�씠吏��뿉 蹂댁뿬以� �떆�옉 �럹�씠吏� �닔
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;//�쁽�옱 �럹�씠吏��뿉 蹂댁뿬以� 留덉�留� �럹�씠吏� �닔
   		int endpage = maxpage;
   		if (endpage>startpage+10-1) endpage=startpage+10-1;
   		request.setAttribute("page", page);		  
   		request.setAttribute("maxpage", maxpage); 
   		request.setAttribute("startpage", startpage);
   		request.setAttribute("endpage", endpage);     
		request.setAttribute("listcount",listcount); 
   		request.setAttribute("page", page);		  //�쁽�옱 �럹�씠吏� �닔
   		request.setAttribute("maxpage", maxpage); // 理쒕� �럹�씠吏� �닔
   		request.setAttribute("startpage", startpage); //�쁽�옱 �럹�씠吏��뿉 �몴�떆�븷 泥� �럹�씠吏� �닔
   		request.setAttribute("endpage", endpage);     //�쁽�옱 �럹�씠吏��뿉 �몴�떆�븷 �걹 �럹�씠吏� �닔
		request.setAttribute("listcount",listcount);  //湲� �닔.
		request.setAttribute("boardlist", boardlist);
		
		
	   	forward.setRedirect(false);
   		forward.setPath("/board/qna_board_list.jsp");
   		return forward;
	 }
 }