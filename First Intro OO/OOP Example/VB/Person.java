/**
 * General person class describing a human being or a woman.
 * @author weledelgeboren Heer Ridder Olivier Dimitri Lea Guillain Marie de Schaetzen
 */
public class Person {

	public String name = "Jan";
	public int age;
	public boolean isGay;

	public Person(int age) {
		this.age = age;
	}

	public Person(String name) {
		this.name = name;
		if (name.equals("axel")) {
			isGay = true;
		}
	}

	public void printName() {
		System.out.println("my name is " + name + " and axel is gay!");
	}

}