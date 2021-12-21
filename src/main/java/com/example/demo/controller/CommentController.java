package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.CommentService;
import com.example.demo.vo.BoardVO;
import com.example.demo.vo.CommentVO;

@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	//댓글 목록 불러오기
	@RequestMapping("commentlist")
	@ResponseBody
	public String commentList(@RequestParam int bno) {
		List<CommentVO> commentList=commentService.commentList(bno);		
		JSONObject jo=new JSONObject();
		jo.put("commentList", commentList);		
		return jo.toString();
	
	}
	
	//댓글 insert
	@PostMapping("commentInsert")
	@ResponseBody
	public void commentInsert(@RequestParam String insertData,@RequestParam String id, HttpSession session) {
		CommentVO comment = new CommentVO();
		comment.setContent(insertData);
		BoardVO parentVO=(BoardVO) session.getAttribute("article");
		//session.setAttribute("coID", id);
		comment.setWriter(id);
		comment.setBno(parentVO.getNo());	
	  commentService.commentInsert(comment);

	}
	
	//댓글 삭제
	@PostMapping("commentDelete")
	@ResponseBody
	public void commentDelete(@RequestParam int cno) {
		commentService.commentDelete(cno);
	}
	
	//댓글 수정
	@PostMapping("commentUpdate")
	@ResponseBody
	public void commentUpdate(@RequestParam String updateContent ,@RequestParam int cno ) {
		CommentVO commentVO=new CommentVO();
		commentVO.setContent(updateContent);
		commentVO.setCno(cno);
		commentService.commentUpdate(commentVO);
	}

	
}
