package hf.bean;

public class usabean {
	private int u_uid;
	private String u_date;
	private String state;
	private String county;
	private int cases;
	private int deaths;
	private String dr;

	public usabean() {
	}

	public usabean(int u_uid, String u_date, String state, String county, int cases, int deaths, String dr) {
		this.u_uid = u_uid;
		this.u_date = u_date;
		this.state = state;
		this.county = county;
		this.cases = cases;
		this.deaths = deaths;
		this.dr = dr;
	}

	public int getU_uid() {
		return u_uid;
	}

	public void setU_uid(int u_uid) {
		this.u_uid = u_uid;
	}

	public String getU_date() {
		return u_date;
	}

	public void setU_date(String u_date) {
		this.u_date = u_date;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public int getCases() {
		return cases;
	}

	public void setCases(int cases) {
		this.cases = cases;
	}

	public int getDeaths() {
		return deaths;
	}

	public void setDeaths(int deaths) {
		this.deaths = deaths;
	}

	public String getDr() {
		return dr;
	}

	public void setDr(String dr) {
		this.dr = dr;
	}

	@Override
	public String toString() {
		return "usabean{" +
				"u_uid=" + u_uid +
				", u_date='" + u_date + '\'' +
				", state='" + state + '\'' +
				", county='" + county + '\'' +
				", cases=" + cases +
				", deaths=" + deaths +
				", dr='" + dr + '\'' +
				'}';
	}
}

