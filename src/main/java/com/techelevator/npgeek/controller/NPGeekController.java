package com.techelevator.npgeek.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.npgeek.dao.ParkDao;
import com.techelevator.npgeek.dao.WeatherDao;
import com.techelevator.npgeek.model.Park;

@Controller
public class NPGeekController {
	
	@Autowired
	ParkDao parkDao;
	
	@Autowired
	WeatherDao weatherDao;
	
	@RequestMapping(path={"/", "/home"}, method=RequestMethod.GET)
	public String showHomePage(Model modelHolder) {
		List<Park> listOfParks = new ArrayList<>();
		listOfParks = parkDao.getAllParks();
		modelHolder.addAttribute("parksList", listOfParks);
		
		return "homePage";
	}

	@RequestMapping(path={"/details/{parkCode}"}, method=RequestMethod.GET)
	public String showParkDetails(Model modelHolder, @PathVariable String parkCode) {
		modelHolder.addAttribute("park", parkDao.getParkByCode(parkCode));
		modelHolder.addAttribute("weatherList", weatherDao.getWeatherByCode(parkCode));
		
		return "details";
	}
	
	@RequestMapping(path={"/survey"}, method=RequestMethod.GET)
	public String showSurveyForm(Model modelHolder) {
		
		return "survey";
	}
	
	@RequestMapping(path={"/survey"}, method=RequestMethod.POST)
	public String receiveSurveyForm(Model modelHolder) {
		
		return "redirect:/favoriteparks";
	}
	
	@RequestMapping(path={"/favoriteparks"}, method=RequestMethod.GET)
	public String showFavoriteParks(Model modelHolder) {
		
		return "favoriteParks";
	}

}
