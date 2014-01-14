

public class Spion extends Vrouw {
	
	private String agency = "";
	
	public static String spel;
	
	public Spion(String naam)
	{
		super(naam);
	}
	
	public String get_agency()
	{
		return agency;
	}
	
	public void set_agency(String agency)
	{
		this.agency = agency;
	}
	
}
