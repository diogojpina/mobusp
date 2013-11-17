package br.usp.ime.engsoft.entidade;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Station {
	@Id	@GeneratedValue	
	private Long id;
	private String name;
	private String address;
	private String description;
	private float lat;
	private float lon;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "itineraries_stations", joinColumns = { @JoinColumn(name = "id_station") }, inverseJoinColumns = { @JoinColumn(name = "id_itinerarie") })
	private List<Itinerarie> itineraries;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "places_stations", joinColumns = { @JoinColumn(name = "id_station") }, inverseJoinColumns = { @JoinColumn(name = "id_place") })
	private List<Place> places;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
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
	public List<Itinerarie> getItineraries() {
		return itineraries;
	}
	public void setItineraries(List<Itinerarie> itineraries) {
		this.itineraries = itineraries;
	}
	
	public List<Place> getPlaces() {
		return places;
	}
	public void setPlaces(List<Place> places) {
		this.places = places;
	}
	
	
	
	
	
}
