package com.techelevator.npgeek.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.npgeek.dao.ParkDao;
import com.techelevator.npgeek.model.Park;

public class JdbcParkDao implements ParkDao {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JdbcParkDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Park> getAllPark() {
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * FROM park");
		List<Park> parksList = new ArrayList<>();
		
		while(results.next()) {
			parksList.add(mapRowToPark(results));
		}
		
		return parksList;
	}

	private Park mapRowToPark(SqlRowSet result) {
		Park currentPark = new Park();
		currentPark.setParkCode(result.getString("parkcode"));
		currentPark.setParkName(result.getString("parkname"));
		currentPark.setState(result.getString("state"));
		currentPark.setAcreage(result.getInt("acreage"));
		currentPark.setElevationInFeet(result.getInt("elevationinfeet"));
		currentPark.setMilesOfTrail(result.getDouble("milesoftrail"));
		currentPark.setNumberOfCampsites(result.getInt("numberofcampsites"));
		currentPark.setClimate(result.getString("climate"));
		currentPark.setYearFounded(result.getInt("yearfounded"));
		currentPark.setAnnualVisitorCount(result.getInt("annualvisitorcounter"));
		currentPark.setInspirationalQuote(result.getString("inspirationalquote"));
		currentPark.setInspirationalQuoteSource(result.getString("inspirationalquotesource"));
		currentPark.setParkDescription(result.getString("parkdescription"));
		currentPark.setEntryFee(result.getInt("entryfee"));
		currentPark.setNumberOfAnimalSpecies(result.getInt("numberofanimalspecies"));
		
		return currentPark;
	}

}
