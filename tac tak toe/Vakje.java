public class Vakje {

	/**
	* 0 = neutraal
	* 1 = speler 1
	* 2 = speler 2
	*/
	private int status;

	public Vakje() {
		status = 0;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}