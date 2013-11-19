package org.nhnnext.web;

//import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ResponseBody;
import org.junit.runner.Request;
import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.http.MediaType;


@Controller
@RequestMapping("/board")
public class CommentController {
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@RequestMapping(value ="/{id}/comment_ok.json", method = RequestMethod.POST)
	public @ResponseBody Comment write_comment(@PathVariable Long id, String contents){
		Board board = boardRepository.findOne(id);
		Comment comment = new Comment(board, contents);

		return commentRepository.save(comment);
	}
	
//	@RequestMapping(value ="/delete_comment/{id}")
//	public String delete_comment(@PathVariable Long id){
//		commentRepository.delete(id);
//		return "redirect:/board/list";
//	}
	
	@RequestMapping(value="/delete_comment/{id}.json",method=RequestMethod.POST)
	public void delete_commentJson(@PathVariable Long id){
		commentRepository.delete(id);
	}
//	@RequestMapping(value ="/{id}/comment_ok.json", method = RequestMethod.POST)  
//	public @ResponseBody Comment write_comment(@PathVariable Long id, String contents, String modify, HttpSession session){
//		Board board = boardRepository.findOne(id);
//		Comment comment = new Comment(board, contents);
////		comment.setUser(user);
//		
//		return commentRepository.save(comment);
//	}
	
	
	

}
