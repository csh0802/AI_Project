package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ColorBoxDAO;
import com.example.demo.dao.ColorCombDAO;
import com.example.demo.vo.ColorBoxVO;
import com.example.demo.vo.ColorCombVO;

@Service
public class ColorCombService {

	@Autowired
	ColorCombDAO colorCombDAO;
	
	public void insertColorBox(ColorCombVO colorCombVO) throws Exception {
		colorCombDAO.insertColorComb(colorCombVO);
	}
	public List<ColorCombVO> selectAllBasketList(ColorCombVO colorCombVO){
		return colorCombDAO.selectAllColorCombList(colorCombVO);
		
	}
}
