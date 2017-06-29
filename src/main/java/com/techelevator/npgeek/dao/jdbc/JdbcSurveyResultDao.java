package com.techelevator.npgeek.dao.jdbc;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.techelevator.npgeek.dao.ParkDao;
import com.techelevator.npgeek.dao.SurveyResultDao;
import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.SurveyResult;

@Component
public class JdbcSurveyResultDao implements SurveyResultDao {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private ParkDao parkDao;
	
	@Autowired
	public JdbcSurveyResultDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	@Transactional
	public void saveSurvey(SurveyResult survey) {
		String statement = "INSERT INTO survey_result (parkcode, emailaddress, state, activitylevel) VALUES (?, ?, ?, ?)";
		String parkCode = survey.getParkCode();
		String emailAddress = survey.getEmailAddress();
		String state = survey.getState();
		String activityLevel = survey.getActivityLevel();
		
		jdbcTemplate.update(statement, parkCode, emailAddress, state, activityLevel);
	}
	
	@Override
	public Map<Park, Integer> getTopParks() {
		Map<Park, Integer> topParks = new LinkedHashMap<>();
		String statement = "SELECT parkcode, COUNT(*) FROM survey_result GROUP BY parkcode ORDER BY COUNT(*) DESC"; 
		SqlRowSet results = jdbcTemplate.queryForRowSet(statement);
		while(results.next()) {
			String parkCode = results.getString("parkcode");
			Integer surveyAmount = results.getInt("count");
			Park newPark = parkDao.getParkByCode(parkCode);
			topParks.put(newPark, surveyAmount);
		}
		return topParks;
	}

}
