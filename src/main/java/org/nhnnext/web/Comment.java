package org.nhnnext.web;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.nhnnext.web.Board;


@Entity
public class Comment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
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
	
	public String getContents(){
		return contents;
	}
	
	public int getId(){
		return id;
	}
	
}
