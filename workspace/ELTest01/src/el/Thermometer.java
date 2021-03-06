package el;

import java.util.HashMap;

import com.sun.javafx.collections.MappingChange.Map;

public class Thermometer {
	private Map<String, Double> locationCelsiusMap = null;
	
	public Thermometer(String location, Double value) {
		locationCelsiusMap = new HashMap<String, Double>();
	}
	public void setCelsius(String location, Double value) {
		locationCelsiusMap.put(location, value);
	}
	public Double getCelsius(String location) {
		return locationCelsiusMap.get(location);
	}
	public Double getFahrenheit(String location) {
		Double celsius = getCelsius(location);
		if(celsius == null) return null;
	}
	
	
}
