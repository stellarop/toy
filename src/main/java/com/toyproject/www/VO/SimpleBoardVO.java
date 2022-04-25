package com.toyproject.www.VO;

public class SimpleBoardVO {
	private int board_seq;
	private String type;
	private String title;
	private String writer;
	private String content;
	
	public int getBoard_idx() {
		return board_seq;
	}
	public void setBoard_idx(int board_idx) {
		this.board_seq = board_idx;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
