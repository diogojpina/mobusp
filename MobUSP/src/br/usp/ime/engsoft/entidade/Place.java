package br.usp.ime.engsoft.entidade;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Place {
	@Id	@GeneratedValue	
	private Long id;
	//private List<Place> subplaces;
	private String name;
	private String address;
	private String description;
	private float lat;
	private float lon;
	
	@ManyToMany
	@JoinTable(name = "places_stations", joinColumns = { @JoinColumn(name = "id_place") }, inverseJoinColumns = { @JoinColumn(name = "id_station") })
	private List<Station> stations;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	/*
	public List<Place> getSubplaces() {
		return subplaces;
	}
	public void setSubplaces(List<Place> subplaces) {
		this.subplaces = subplaces;
	}
	*/
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public float getLon() {
		return lon;
	}
	public void setLon(float lon) {
		this.lon = lon;
	}
	
	public List<Station> getStations() {
		return stations;
	}
	public void setStations(List<Station> stations) {
		this.stations = stations;
	}

	
		
}
