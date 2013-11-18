package org.nhnnext.web;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.codehaus.jackson.annotate.JsonIgnore;



@Entity
public class Comment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column(length = 1000, nullable = false )
	private String contents;
	
	@JsonIgnore
	@ManyToOne
	private Board board;
	
//	@ManyToOne
//	private User user;
	
	public Comment(){
		// there should be empty generator
	}
	
	
	public Comment(Board board, String contents){
		this.board = board;
		this.contents = contents;
	}
	
//	public void setUser(User user) {
//		this.user = user;
//	}
//	
//	public User getUser() {
//		return user;
//	}
	
	public Board getBoard(){
		return board;
	}
	
	public String getContents(){
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
}
