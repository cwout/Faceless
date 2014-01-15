public class Main {
	
	public static void main(String[] args) {
		Person jonny;
		jonny = new Person("jonny");
		jonny.age = 69;

		Person axel = new Person("axel");

		if (axel.isGay) {
			System.out.println("wow such gay, much homo");
		}

		jonny.printName();

		Bob bob = new Bob();
		bob.drinkAndDrive();

		Person iemand = bob;
		((Bob)iemand).drinkAndDrive();
	}
}