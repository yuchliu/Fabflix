package controller;

public class Clauss {
	private String order = "movies.id";
	//movie attribute
	private String title = "";
	private String year = "";
	private String director = "";
	private String startBy = "";
	//star attribute
	private String firstName="";
	private String lastName="";
	//genre attribute
	private String genre="";
	private String source="search";
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}



	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		System.out.println("order="+order);
		System.out.println("before this.ordrer="+this.order);
		this.order = order;
		System.out.println("after this.ordrer="+this.order);
	}
	public String getStartBy() { return startBy; }
	public void setStartBy(String startBy) { this.startBy = startBy; }
}
