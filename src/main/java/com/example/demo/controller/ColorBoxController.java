package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.ColorBoxService;
import com.example.demo.service.PersonDetectionService;
import com.example.demo.service.ObjectDetectionService;
import com.example.demo.vo.ColorBoxVO;
import com.example.demo.vo.MemberVO;

@Controller
public class ColorBoxController {
	
	@Autowired
	ColorBoxService colorBoxService;
	
	List<ColorBoxVO> blist;
	

	
	@PostMapping("insertColorBox")
	@ResponseBody
	public String insertColorBox(ColorBoxVO colorBoxVO, HttpSession session) {
		JSONObject jo = new JSONObject();
//		System.out.println(colorBoxVO);

		try {
			MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
			System.out.println(memberVO);
			if(memberVO!=null) {
				colorBoxVO.setId(memberVO.getId());
				if(colorBoxVO.toString().contains("error")) {
					System.out.println("colorBoxVO NullPointException");
					jo.put("msg", "NullPointError");
				}else {
					colorBoxService.insertColorBox(colorBoxVO);				
					System.out.println("colorInsert");
				}
				
			}else {
				jo.put("msg", "로그인 하세요") ;
			}
		} catch (Exception e) {
			jo.put("msg", "error");
		}
		return jo.toString();
	}
	@RequestMapping("basketList")
	public ModelAndView showBasket(HttpSession session, ColorBoxVO colorBoxVO) {
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		ModelAndView mav = new ModelAndView();
		if(memberVO!=null) {
			colorBoxVO.setId(memberVO.getId());
		}else {
			System.out.println("로그인안됨");
		}
		try {
		
			blist = colorBoxService.selectAllBasketList(colorBoxVO);
			System.out.println(blist);
			if(blist.size()==0) {
				session.setAttribute("msg", "no");
			}else {
				session.setAttribute("blist", blist);
				session.setAttribute("id",memberVO.getId());
				mav.addObject("blist",blist);
				mav.addObject("id",memberVO.getId());
//				System.out.println(blist);
			}
			
		}catch(Exception e) {
//			e.printStackTrace();
			System.out.println("가져온 멤버정보 없음");
		}	
		
		
		return mav;
	}
	
}


