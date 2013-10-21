package org.nhnnext.web;


import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Board {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column(length=20, nullable=false)
	private String title;
	
	@Column(length=150, nullable=false)
	private String contents;
	
	@Column(length=30, nullable=true)
	private String fileName;
	
	@OneToMany(mappedBy = "board", fetch = FetchType.EAGER)
	private List<Comment> comments;
	
//	@ManyToOne
//	private User user;
//	
//	public void setUser(User user){
//		this.user = user;
//	}
//	
//	public User getUser(){
//		return user;
//	}
//	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public List<Comment> getComments() {
		return comments;
	}
	
	
//	public boolean matchId(String id) {
//		return id.equals(user.getUserId());
//	}
//	
	
	@Override
	public String toString() {
		return "BoardData [id=" + id + ", title=" + title + ", contents="
				+ contents + ", fileName=" + fileName + "]";
	}
}
