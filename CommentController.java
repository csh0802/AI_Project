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
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.CommentService;
import com.example.demo.vo.BoardVO;
import com.example.demo.vo.CommentVO;

@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	@RequestMapping("commentlist")
	@ResponseBody
	public String commentList(@RequestParam int bno) {
		//System.out.println("commentList()호출");
		List<CommentVO> commentList=commentService.commentList(bno);
		//System.out.println(commentList);		
	
		
		JSONObject jo=new JSONObject();
		jo.put("commentList", commentList);
		return jo.toString();
	
		}
	
	@PostMapping("commentInsert")
	@ResponseBody
	public void commentInsert(@RequestParam String insertData, HttpSession session) {
		//System.out.println("commentInsert()호출");
		CommentVO comment = new CommentVO();
		comment.setContent(insertData);
		BoardVO parentVO=(BoardVO) session.getAttribute("article");
		comment.setWriter(parentVO.getId());
		
		comment.setBno(parentVO.getNo());
		//System.out.println(comment);
	  commentService.commentInsert(comment);
	}
	
	
	@PostMapping("commentDelete")
	@ResponseBody
	public void commentDelete(@RequestParam int cno) {
		//System.out.println("commentDelete()호출");
		commentService.commentDelete(cno);
	}
	
	@PostMapping("commentUpdate")
	@ResponseBody
	public void commentUpdate(@RequestParam String updateContent ,@RequestParam int cno ) {
		CommentVO commentVO=new CommentVO();
		commentVO.setContent(updateContent);
		commentVO.setCno(cno);
		commentService.commentUpdate(commentVO);
	}
	
	
	
	
}
