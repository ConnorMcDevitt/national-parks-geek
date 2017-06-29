package com.techelevator.npgeek.dao;

import java.util.Map;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.SurveyResult;

public interface SurveyResultDao {

	void saveSurvey(SurveyResult survey);

	Map<Park, Integer> getTopParks();

}
