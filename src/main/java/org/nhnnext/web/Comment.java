package org.nhnnext.web;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;


@Entity
public class Comment {
	
	@Column(length = 1000, nullable = false )
	private String contents;
	
	
	@ManyToOne
	private Board board;
	
	public Comment(){}
	
	public Comment(Board board, String contents){
		this.board = board;
		this.contents = contents;
	}
	
	
	public Board getBoard(){
		return board;
	}
	
}
