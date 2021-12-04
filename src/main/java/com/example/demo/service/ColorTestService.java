package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ColorBoxDAO;
import com.example.demo.dao.ColorTestDAO;
import com.example.demo.vo.ColorBoxVO;
import com.example.demo.vo.ColorTestVO;

@Service
public class ColorTestService {
	@Autowired
	ColorTestDAO colorTestDAO;
	
	public String selectPeronalType(ColorTestVO colorTestVO) throws Exception {
		return colorTestDAO.selectPeronalType(colorTestVO);

	}
}
