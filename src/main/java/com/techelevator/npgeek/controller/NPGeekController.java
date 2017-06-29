package com.techelevator.npgeek.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.npgeek.dao.ParkDao;
import com.techelevator.npgeek.dao.SurveyResultDao;
import com.techelevator.npgeek.dao.WeatherDao;
import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.SurveyResult;

@Controller
public class NPGeekController {
	
	@Autowired
	ParkDao parkDao;
	
	@Autowired
	WeatherDao weatherDao;
	
	@Autowired
	SurveyResultDao surveyResultDao;
	
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
	
	@RequestMapping(path={"/details/{parkCode}"}, method=RequestMethod.POST)
	public String chooseTempScale(HttpSession session, @RequestParam Boolean isCelsius) {
		session.setAttribute("isCelsius", isCelsius);
		
		return "redirect:/details/{parkCode}";
	}
	
	@RequestMapping(path={"/survey"}, method=RequestMethod.GET)
	public String showSurveyForm(Model modelHolder) {

		modelHolder.addAttribute("parksList", parkDao.getAllParks());
		
		return "survey";
	}
	
	@RequestMapping(path={"/survey"}, method=RequestMethod.POST)
	public String receiveSurveyForm(@ModelAttribute SurveyResult survey) {
		
		surveyResultDao.saveSurvey(survey);
		
		return "redirect:/favoriteparks";
	}
	
	@RequestMapping(path={"/favoriteparks"}, method=RequestMethod.GET)
	public String showFavoriteParks(Model modelHolder) {
		
		modelHolder.addAttribute("topParksList", surveyResultDao.getTopParks());
		
		return "favoriteParks";
	}

}
