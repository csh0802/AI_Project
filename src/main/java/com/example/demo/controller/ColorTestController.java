package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.service.CelebrityDetectionService;
import com.example.demo.service.ColorBoxService;
import com.example.demo.service.ColorTestService;
import com.example.demo.service.ObjectDetectionService;
import com.example.demo.service.PColorDetectionService;
import com.example.demo.service.PersonDetectionService;
import com.example.demo.vo.ColorBoxVO;
import com.example.demo.vo.ColorTestVO;
import com.example.demo.vo.MemberVO;

@Controller
public class ColorTestController {
	
	@Autowired
	PColorDetectionService getColorService;
	
	@Autowired
	ColorTestService colorTestService;
	
	List<ColorTestVO> testList;
	
	@Autowired
	PersonDetectionService personDetectionService;
	
	@Autowired
	ObjectDetectionService objectDetectionService;
	
	@Autowired
	CelebrityDetectionService clerbrityDetection;
	
	@Autowired
	ColorBoxService colorBoxService;
	
	String pColor;
	
	@PostMapping("celebrityDetect")
	@ResponseBody
	public String celebrityDetect(MultipartFile image) {

		System.out.println(image.getOriginalFilename());
		try {
			File uploadFile = new File("C:\\temp2\\" + image.getOriginalFilename());
			image.transferTo(uploadFile);
			return clerbrityDetection.celebrityDetect(uploadFile);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "upload fail!!!";
		}

	}
	@PostMapping("personDetect")
	@ResponseBody
	public String detectPerson(MultipartFile image) {
//		System.out.println(image.getOriginalFilename());
		JSONObject jo = new JSONObject();
		try {
			File uploadFile=new File("C:\\temp2\\"+image.getOriginalFilename());
			image.transferTo(uploadFile);
			
			jo.put("result", personDetectionService.detectPerson(uploadFile));
			
//			System.out.println(jo.get("result"));
			return jo.toString();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			return "upload fail!!!";
		} 
	}

	 
	     
	@PostMapping("objectDetect")
	@ResponseBody
	public String objectDetection(MultipartFile image){
//		System.out.println(image.getOriginalFilename());
		JSONObject jo = new JSONObject();
		try {
			File uploadFile=new File("C:\\temp2\\"+image.getOriginalFilename());
			image.transferTo(uploadFile);
			return objectDetectionService.objectDetect(uploadFile);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			return "upload fail!!!";
		} 
	}
	@PostMapping("getPcolor")
	@ResponseBody
	public String getPcolor(MultipartFile image,HttpSession session) {
		System.out.println(image.getOriginalFilename());
		int no = 0, sum=0, temp = 1000;
		int [] a = new int[3];
		JSONObject jo = new JSONObject();
		///home/ubuntu/0csh/git_registry/test-1/media
		
		File uploadFile=new File("C:\\temp2\\"+image.getOriginalFilename());
		try {
			testList = colorTestService.selectAllType();
			image.transferTo(uploadFile);
			a = getColorService.getColor(uploadFile); 
			if(testList!=null) {
				for(int i=0;i<8;i++) {
					sum += Math.abs(testList.get(i).getRed() - a[0]);
					sum += Math.abs(testList.get(i).getBlue() - a[2]);
					sum += Math.abs(testList.get(i).getGreen() - a[1]);
					
					
//					System.out.println(sum);
					if(sum<temp) {
						temp = sum;
						no = i+1;
//						System.out.println("no"+no);
//						System.out.println("sum"+sum);
					}
					sum=0;
				}
			}else {
				System.out.println("colorTestVO is null");
				jo.put("msg", "퍼스널컬러 기준 테이블 없음");
			}
//			System.out.println(colorTestService.selectPeronalType(no));
			pColor = colorTestService.selectPeronalType(no);
			jo.put("pColor", pColor);
			if(session.getAttribute("memberVO")!=null) {
				session.setAttribute("pColor", pColor);
			}
		} catch (IllegalStateException e1) {
			// TODO Auto-generated catch block
//			e1.printStackTrace();
			jo.put("msg", "ISEerror");
		} catch (IOException e1) {
			// TODO Auto-generated catch block
//			e1.printStackTrace();
			jo.put("msg", "IOEerror");
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			jo.put("msg", "error");
		}
		
		return jo.toString();
	}
	@PostMapping("insertPcolorInColorBox")
	@ResponseBody
	public String insertColorBox(ColorBoxVO colorBoxVO, HttpSession session) {
		JSONObject jo = new JSONObject();
//		System.out.println(colorBoxVO);
		
		try {
			MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
			System.out.println(memberVO);
			pColor = (String)session.getAttribute("pColor");
			if(memberVO!=null && pColor!=null) {
				
				colorBoxVO.setId(memberVO.getId());
				colorBoxVO.setPColor(pColor);
				if(colorBoxVO.toString().contains("error")) {
					System.out.println("colorBoxVO NullPointException");
					jo.put("msg", "NullPointError");
				}else {
					colorBoxService.insertColorBox(colorBoxVO);				
					System.out.println("colorInsert");
					jo.put("success", pColor+"colorInsert");
				}
				
			}else {
				jo.put("msg", "로그인 하세요") ;
			}
		} catch (Exception e) {
			jo.put("msg", "error");
		}
		return jo.toString();
	}
	
	
}
