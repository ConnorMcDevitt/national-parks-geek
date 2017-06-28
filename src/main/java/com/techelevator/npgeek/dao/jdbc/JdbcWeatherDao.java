package com.techelevator.npgeek.dao.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.npgeek.dao.WeatherDao;
import com.techelevator.npgeek.model.Weather;

@Component
public class JdbcWeatherDao implements WeatherDao {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JdbcWeatherDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Weather> getWeatherByCode(String parkCode) {
		List<Weather> weatherList = new ArrayList<>();
		String statement = "SELECT * FROM weather WHERE parkcode = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(statement, parkCode);

		while(result.next()) {
			weatherList.add(mapRowToWeather(result));
		}
		return weatherList;
	}

private Weather mapRowToWeather(SqlRowSet result) {
		Weather currentWeather = new Weather();
		currentWeather.setParkCode(result.getString("parkcode"));
		currentWeather.setFiveDayForecastValue(result.getInt("fivedayforecastvalue"));
		currentWeather.setLow(result.getInt("low"));
		currentWeather.setHigh(result.getInt("high"));
		currentWeather.setForecast(result.getString("forecast"));
		
		return currentWeather;
	}

}