package com.techelevator.npgeek.dao;

import java.util.List;

import com.techelevator.npgeek.model.Weather;

public interface WeatherDao {

	List<Weather> getWeatherByCode(String parkCode);

}
