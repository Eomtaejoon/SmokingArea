package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.swing.plaf.synth.SynthSpinnerUI;

import net.entity.MemberBean;

public class MemberDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public MemberDAO() {
		try{
			Context init = new InitialContext();
	  		DataSource ds = 
	  			(DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	  		con = ds.getConnection();
		}catch(Exception ex){
			System.out.println("DB ���� ���� : " + ex);
			return;
		}
	}
	
	public int isMember(MemberBean member){
		String sql="SELECT S_PW FROM S_MEMBER WHERE S_ID=?";
		int result=-1;
		System.out.println(member.getMember_id());
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getMember_id());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(rs.getString("S_PW").equals(
									member.getMember_pw())){
					result=1;//로그인.
				}else{
					result=0;//로그인 실패.
				}
			}else{
				result=-1;//비밀번호 불일치.
			}
		}catch(Exception ex){
			System.out.println("isMember 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		
		return result;
	}
	
	public boolean joinMember(MemberBean member){
		String sql="INSERT INTO S_MEMBER VALUES (?,?,?,?,?,sysdate)";
		int result = 0;
		int num = 0;
		try{
			pstmt=con.prepareStatement(
					"select max(S_NUM) from S_MEMBER");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, member.getMember_id());
			pstmt.setString(3, member.getMember_pw());
			pstmt.setString(4, member.getMember_phone());
			pstmt.setString(5, member.getMember_email());
			result=pstmt.executeUpdate();
			
			if(result!=0){
				return true;
			}
		}catch(Exception ex){
			System.out.println("joinMember 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		
		return false;
	}
	
	public List getMemberList(){
		String sql="SELECT * FROM BOARDMEMBER";
		List memberlist=new ArrayList();
		
		try{
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				MemberBean mb=new MemberBean();
				mb.setMember_id(rs.getString("MEMBER_ID"));
				mb.setMember_pw(rs.getString("MEMBER_PW"));

				mb.setMember_email(rs.getString("MEMBER_EMAIL"));
				
				memberlist.add(mb);
			}
			
			return memberlist;
		}catch(Exception ex){
			System.out.println("getDeatilMember 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		return null;
	}
	
	public MemberBean getDetailMember(String id){
		String sql="SELECT * FROM BOARDMEMBER WHERE MEMBER_ID=?";
		
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			rs.next();
			
			MemberBean mb=new MemberBean();
			mb.setMember_id(rs.getString("MEMBER_ID"));
			mb.setMember_pw(rs.getString("MEMBER_PW"));

			mb.setMember_email(rs.getString("MEMBER_EMAIL"));
			
			return mb;
		}catch(Exception ex){
			System.out.println("getDeatilMember 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		
		return null;
	}
	
	public boolean deleteMember(String id){
		String sql="DELETE FROM BOARDMEMBER WHERE MEMBER_ID=?";
		int result=0;
		
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result=pstmt.executeUpdate();
			
			if(result!=0){
				return true;
			}
		}catch(Exception ex){
			System.out.println("deleteMember 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		
		return false;
	}
}