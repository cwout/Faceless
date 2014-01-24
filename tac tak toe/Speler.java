import tio.*;

public class Speler {

	public int id;
	public Veld veld;

	public Speler(int id, Veld veld) {
		this.id = id;
		this.veld = veld;
	}

	public void handleInput() {

		System.out.println("Geef input in (x,y):");
		Vakje vakje;
		do {
			int x = Console.in.readInt();
			vakje = veld.getVakjeWithX(x);
		} while (vakje == null);

		vakje.setStatus(id);
	}


}