package org.nhnnext.web;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.nhnnext.support.FileUploader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@RequestMapping(value = "/newPost")
	public String selectPhoto(){
		return "newPost";
	}
	
	@RequestMapping("/{id}")
	public String show(@PathVariable Long id , Model model){
		Board LatestSavedBoard  = boardRepository.findOne(id);
		model.addAttribute("board", LatestSavedBoard);
		return "confirm";
	}


	@RequestMapping(value = "/selected", method = RequestMethod.POST) //default is GET
	public String create(Board board, MultipartFile attachment){
		log.debug("board:{}",board);
		//
		System.out.println("board" + board);
		FileUploader.upload(attachment);
		board.setFileName(attachment.getOriginalFilename());
		Board savedBoard = boardRepository.save(board);
		//return "redirect:/board/"+ savedBoard.getId() ;
		return "redirect:/board/list";
	}
	
	@RequestMapping("/list")
	public String showList(Model model) {
		Iterable<Board> boardAllData = boardRepository.findAll();
		Collections.reverse((List<Board>) boardAllData);
		
		model.addAttribute("boardAllData", boardAllData);
		return "list";
	}
	
	//.json일수도 있어 
		@RequestMapping(value = "/board.json", method = RequestMethod.POST)
		public @ResponseBody Board straightUpload(Board board, MultipartFile file){
			log.debug("board:{}", board);
			String fileName = FileUploader.upload(file);
			board.setFileName(fileName);
			//System.out.println("/board/board.json으로 왔다");
			return boardRepository.save(board);
		}
	
	@RequestMapping("/revise/{id}")
	public String modify(@PathVariable Long id, Model model) {
		Board getBoardData = boardRepository.findOne(id);
		model.addAttribute("data", getBoardData);
		return "revise";
	}
	
	@RequestMapping("/revise/confirm/{id}")
	public String modifyConfirm(@PathVariable Long id, Board board) {
		//Board getBoardData = boardRepository.findOne(id);
		boardRepository.save(board);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable Long id, Model model) {
		List<Comment> list = boardRepository.findOne(id).getComments();
		
		for (Comment comment : list) {
			commentRepository.delete(comment.getId());
		}
		
		boardRepository.delete(id);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/uploadFromIOS", method=RequestMethod.POST)
	public @ResponseBody String uploadFromIOS(Board boardData, MultipartFile file) {
			log.debug("Param boardData : {}", boardData);			
			
			String uploadFileName = FileUploader.upload(file);
			boardData.setFileName(uploadFileName);
			
			Board savedBoardData = boardRepository.save(boardData);
			
			log.debug("savedBoardData : {}", savedBoardData.toString());
			
		
			HashMap<String, String> result = new HashMap<String, String>();
			result.put("result", "NO");
			result.put("code", "400");
		
		if ( savedBoardData != null) {
				result.put("result", "OK");
				result.put("code", "200");
		}
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}
}
