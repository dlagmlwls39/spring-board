package com.exem.web.backend.vo;

public class Board {

	private int boardId;
	private String userId;
	private String boardName;
	private String boardEditDate;
	private String nickname;

	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getBoardEditDate() {
		return boardEditDate;
	}
	public void setBoardEditDate(String boardEditDate) {
		this.boardEditDate = boardEditDate;
	}
	
}
