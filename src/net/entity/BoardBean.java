package net.entity;

import java.sql.Date;

public class BoardBean {
	private int num;
	private String title;
	private String content;
	private String b_id;
	private Date today;
	private String gps;
	private int hit;
	private String img;
	private int re_lev;
	public BoardBean(){
		super();
	}
	
	public BoardBean(int num,String title ,String content ,String b_id ,Date today ,String gps,int hit,String img,int re_lev ){
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.b_id = b_id;
		this.today = today;
		this.gps = gps;
		this.hit = hit;
		this.img = img;
		this.re_lev = re_lev;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getId() {
		return b_id;
	}

	public void setId(String id) {
		this.b_id = id;
	}

	public String getGps() {
		return gps;
	}

	public void setGps(String gps) {
		this.gps = gps;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	public int getRe_lev() {
		return re_lev;
	}

	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}

	public Date getToday() {
		return today;
	}

	public void setToday(Date today) {
		this.today = today;
	}

	public String toString(){
		return "BoardBean [num=" + num + ", title=" + title 
				+ ", content=" + content +", gps=" + gps +", hit=" + hit +", img=" + img +"]";
	}
	
}