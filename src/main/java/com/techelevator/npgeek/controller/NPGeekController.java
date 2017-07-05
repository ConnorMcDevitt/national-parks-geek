package com.techelevator.npgeek.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		List<Park> listOfParks = parkDao.getAllParks();
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
		if(!modelHolder.containsAttribute("survey")) {
			modelHolder.addAttribute("survey", new SurveyResult());
		}
		modelHolder.addAttribute("parksList", parkDao.getAllParks());
		
		return "survey";
	}
	
	@RequestMapping(path={"/survey"}, method=RequestMethod.POST)
	public String receiveSurveyForm(@Valid @ModelAttribute SurveyResult survey, BindingResult result, RedirectAttributes attr) {
		attr.addFlashAttribute("survey", survey);
		if(result.hasErrors()) {
			attr.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX +"survey", result);
			return "redirect:/survey";
		}
		surveyResultDao.saveSurvey(survey);
		
		return "redirect:/favoriteparks";
	}
	
	@RequestMapping(path={"/favoriteparks"}, method=RequestMethod.GET)
	public String showFavoriteParks(Model modelHolder) {
		
		modelHolder.addAttribute("topParksList", surveyResultDao.getTopParks());
		
		return "favoriteParks";
	}

}
