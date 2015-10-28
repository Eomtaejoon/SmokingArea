package net.entity;

public class MemberBean {
	private String member_id;
	private String member_pw;
	private String member_phone;
	private String member_email;
	
	public MemberBean(){
		super();
	}
	
	public MemberBean(String member_id,String member_pw,String member_phone,String member_email){
		super();
		this.member_id=member_id;
		this.member_pw=member_pw;
		this.member_phone=member_phone;
		this.member_email=member_email;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
	public String toString(){
		return "MemberBean [member_id=" + member_id + ", member_pw=" + member_pw 
				+ ", member_phone=" + member_phone +", member_email=" + member_email +"]";
	}
	
	
}
