package com.exem.web.backend.vo;

public class Post {

	private int postId;
	private int boardId;
	private String userId;
	private String postTitle;
	private String postContent;
	private String postWriteDate;
	private String postEditDate;
	private String nickname;
	
	public Post(int boardId, String userId, String postTitle, String postContent) {
		super();
		this.boardId = boardId;
		this.userId = userId;
		this.postTitle = postTitle;
		this.postContent = postContent;
	}
	
	public Post() {
		super();
	}
	

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
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
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getPostWriteDate() {
		return postWriteDate;
	}
	public void setPostWriteDate(String postWriteDate) {
		this.postWriteDate = postWriteDate;
	}
	public String getPostEditDate() {
		return postEditDate;
	}
	public void setPostEditDate(String postEditDate) {
		this.postEditDate = postEditDate;
	}

	@Override
	public String toString() {
		return "Post [postId=" + postId + ", boardId=" + boardId + ", userId=" + userId + ", postTitle=" + postTitle
				+ ", postContent=" + postContent + ", postWriteDate=" + postWriteDate + ", postEditDate=" + postEditDate
				+ "]";
	}

	
}
