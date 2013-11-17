package org.nhnnext.web;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.support.FileUploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardRepository boardRepository;
	
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
		System.out.println("board" + board);
		FileUploader.upload(attachment);
		board.setFileName(attachment.getOriginalFilename());
		Board savedBoard = boardRepository.save(board);
		return "redirect:/board/"+ savedBoard.getId() ;
	}
	
	@RequestMapping("/list")
	public String showList(Model model) {
		Iterable<Board> boardAllData = boardRepository.findAll();
		model.addAttribute("boardAllData", boardAllData);
		return "list";
	}
	
	//.json일수도 있어 
		@RequestMapping(value = "/board.json", method = RequestMethod.POST)
		public @ResponseBody Board straightUpload(Board board, MultipartFile file){
			String fileName = FileUploader.upload(file);
			board.setFileName(fileName);
			System.out.println("/board/board.json으로 왔다");
			return boardRepository.save(board);
		}
	
	@RequestMapping("/revise/{id}")
	public String modify(@PathVariable Long id, Model model) {
		Board getBoardData = boardRepository.findOne(id);
		model.addAttribute("data", getBoardData);
		return "revise";
	}
	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable Long id, Model model) {
		boardRepository.delete(id);
		return "redirect:/board/list";
	}
}
