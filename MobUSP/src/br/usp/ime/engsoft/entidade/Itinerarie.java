package br.usp.ime.engsoft.entidade;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Itinerarie {
	@Id @GeneratedValue
	private Long id;
	private String name;
	private String code;
	private String description;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "itineraries_stations", joinColumns = { @JoinColumn(name = "id_itinerarie") }, inverseJoinColumns = { @JoinColumn(name = "id_station") })
	private List<Station> stations;
	
	
	
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	public List<Station> getStations() {
		return stations;
	}
	public void setStations(List<Station> stations) {
		this.stations = stations;
	}
	
	

	
	
}
