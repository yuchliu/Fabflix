package domain;

import java.util.LinkedList;

public class Movie {
	private int id = 0;
	private String title = null;
	private String director = null;
	private String bannerUrl = null;
	private String trailerUrl = null;
	private String year = null;
	private LinkedList<String> genre = null;
	private LinkedList<String> stars = null;
	
	public Movie(){
		this.genre = new LinkedList<String>();
		this.stars = new LinkedList<String>();
	}
	
	public int getId() {
		return id;
	}
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getBannerUrl() {
		return bannerUrl;
	}
	public void setBannerUrl(String bannerUrl) {
		this.bannerUrl = bannerUrl;
	}
	public LinkedList<String> getGenre() {
		return genre;
	}
	public void setGenre(LinkedList<String> genre) {
		this.genre = genre;
	}
	public LinkedList<String> getStars() {
		return stars;
	}
	public void setStars(LinkedList<String> stars) {
		this.stars = stars;
	}

	public String getTrailerUrl() {
		return trailerUrl;
	}

	public void setTrailerUrl(String trailerUrl) {
		this.trailerUrl = trailerUrl;
	}
	
}
