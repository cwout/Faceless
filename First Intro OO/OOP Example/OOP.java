public class OOP {
	
	public static void main(String[] args)
	{
		Vrouw kaas;
		Vrouw soep;
		
		kaas = new Vrouw("kaas");
		soep = new Vrouw("soep");
		
		kaas.printNaam();
		soep.printNaam();
		
		kaas.naam = "kanker-kaas";

		kaas.printNaam();
		soep.printNaam();
		
		CooleKlasse coolkaas = new CooleKlasse();
		coolkaas.printNaam();
		coolkaas.naam = "oncoole kaas";
		coolkaas.printNaam();
		coolkaas.benIkCool();
		
		Vrouw polymorphehaas = new CooleKlasse();
		polymorphehaas.printNaam();
		((CooleKlasse)polymorphehaas).benIkCool();
		
		Spion protagonist = new Spion("Cate Archer");
		protagonist.set_agency("NOLF");
		System.out.println(protagonist.naam);
		
		Spion antagonist = new Spion("Volkov");
		antagonist.set_agency("HARM");
		System.out.println(antagonist.get_agency());

		protagonist.spel = "No one Lives Forever";
		System.out.println(protagonist.spel);
		System.out.println(antagonist.spel);
		
		antagonist.spel = "No one Lives Forever 2";
		System.out.println(protagonist.spel);
		System.out.println(antagonist.spel);
		
		Spion.spel = "No one Lives Forever 3? :(";
		System.out.println(protagonist.spel);
		System.out.println(antagonist.spel);
		
		Alleen.mijnZin = "Axel houdt van penis!";
		Alleen.zegDeZinTrut();
	}
	
}
