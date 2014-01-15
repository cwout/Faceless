

public class CooleKlasse extends Vrouw {
	
	public CooleKlasse()
	{
		super("Kaas");
	}
	
	public void printNaam()
	{
		System.out.println("ik ben cooler en mijn naam is:" + naam);
		super.printNaam();
	}
	
	public void benIkCool()
	{
		System.out.println("Ja, ik ben cool.");
	}
	
}
