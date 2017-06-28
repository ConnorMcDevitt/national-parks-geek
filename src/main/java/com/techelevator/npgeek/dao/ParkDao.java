package com.techelevator.npgeek.dao;

import java.util.List;

import com.techelevator.npgeek.model.Park;

public interface ParkDao {

	List<Park> getAllParks();

	Park getParkByCode(String parkCode);

}
