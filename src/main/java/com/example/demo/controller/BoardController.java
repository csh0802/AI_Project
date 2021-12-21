package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;


import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.example.demo.service.BoardService;

import com.example.demo.vo.BoardVO;
import com.example.demo.vo.ScrapVO;


@Controller
public class BoardController {


	
	@Autowired
	BoardService boardService;

	//글목록 가져오기
	@RequestMapping("boardList")
	public ModelAndView boardList() {
		List<BoardVO> list=boardService.boardList();
		ModelAndView mav=new ModelAndView("boardList");
		mav.addObject("boardList", list);
		return mav;
	}
	
	
	//글쓰기 화면 제공	
	@RequestMapping("boardWriteForm")
	public String boardWriteForm() {
		return "boardWriteForm";
	}
	
	//글등록	
	@RequestMapping("boardWrite")
	public RedirectView boardWrite(BoardVO boardVO,MultipartFile file) {
		String fileName=file.getOriginalFilename();
		if(!fileName.equals("")) {
			boardVO.setFileName(fileName);
			try {

				file.transferTo(new File("C:\\0AI\\5_backend\\springBoot_workspace\\AI_FinalProject_4\\src\\main\\webapp\\uploadImg\\"+fileName));

			} catch (IllegalStateException | IOException e) {
				
				e.printStackTrace();
			}
			
		}
		
		if(boardVO.getId()=="error" || boardVO.getNo()==-1 ||
				boardVO.getTitle()=="error"||boardVO.getContent()=="error")
			{
				return new RedirectView("boardWriteForm");
			}else {
				boardService.boardWrite(boardVO);
			}
		return new RedirectView("boardList");
	}
	
	//글 상세보기
	@RequestMapping("viewArticle")
	public String viewArticle(@RequestParam int no,HttpSession session ) {
		BoardVO boardVO=boardService.viewArticle(no);
		session.setAttribute("article", boardVO);
		return "viewArticle";
	}
	
	
	//글 삭제
	@RequestMapping("delete")
	@ResponseBody
	public String delete(@RequestParam String id,HttpSession session) {
		BoardVO parentVO=(BoardVO) session.getAttribute("article");	
			if(parentVO.getId().equals(id)) {		
				boardService.delete(parentVO.getNo());
				return "ok";
			}else {
				return "error";				
			}		
	}
	
	//수정 폼
	@RequestMapping("updateArticleForm")
	public String updateForm() {
		return "updateArticleForm";
	}
	
	//글 수정
	@RequestMapping("updateArticle")
	@ResponseBody
	public RedirectView update(@RequestParam int no,String title,String content,MultipartFile file,BoardVO updateVO) {
		updateVO.setContent(content);
		updateVO.setTitle(title);
		String fileName=file.getOriginalFilename();
			if(!fileName.equals("")) {
				updateVO.setFileName(fileName);
				try {
	
					file.transferTo(new File("C:\\0AI\\5_backend\\springBoot_workspace\\AI_FinalProject_4\\src\\main\\webapp\\uploadImg\\"+fileName));
	
				} catch (IllegalStateException | IOException e) {
					
					e.printStackTrace();
				}
				
			}
			
			boardService.update(updateVO);
			return new RedirectView("boardList");
	}
	
	//검색기능
	@RequestMapping("search")
	@ResponseBody
	public List<BoardVO> search(@RequestParam String searchType,String keyword,BoardVO boardVO) {
			boardVO.setSearchType(searchType);
			boardVO.setKeyword(keyword);			
			List<BoardVO> searchList=boardService.search(boardVO);		
				return searchList;
	}
	
	//스크랩 insert
	@RequestMapping("scrapArticle")
	@ResponseBody
	public String scrap(@RequestParam int no,String id,String cookieId ,BoardVO boardVO,ScrapVO scrapVO) {
			boardVO.setId(id);
			boardVO.setNo(no);
			boardService.selectScrap(boardVO);
			scrapVO.setBid(id);
			scrapVO.setNo(no);
			scrapVO.setId(cookieId);
			scrapVO.setContent(boardService.selectScrap(boardVO).get(0).getContent());
			scrapVO.setFileName(boardService.selectScrap(boardVO).get(0).getFileName());
			scrapVO.setTitle(boardService.selectScrap(boardVO).get(0).getTitle());		
			boardService.insertScrap(scrapVO);
			return "ok";
		
	}
	
	//스크랩 목록 불러오기
	@RequestMapping("scrapList")
	public ModelAndView scrapList(HttpSession session,ScrapVO scrapVO) {
		String id= (String)session.getAttribute("id");
		scrapVO.setId(id);
		List<ScrapVO> scrapList=boardService.scrapList(scrapVO);
		ModelAndView mav=new ModelAndView("scrapList");
		mav.addObject("scrapList", scrapList);
		return mav;
	}
	
	//글 상세보기
	@RequestMapping("viewScrapArticle")
	public String viewScrapArticle(@RequestParam int no,HttpSession session ) {
			ScrapVO scrapVO=boardService.viewScrapArticle(no);		
			session.setAttribute("scrapArticle", scrapVO);
			return "viewScrapArticle";
		}
	
	//스크랩게시글 삭제
	@RequestMapping("deleteScrap")
	@ResponseBody
	public String deleteScrap(@RequestParam int no) {
			boardService.deleteScrap(no);
			return "ok";
		}
}
