public class Veld {

	//dit bevat alle vakjes in het spel;
	public Vakje[][] veld;

	public Speler speler1;
	public Speler speler2;

	public Veld() {
		veld = new Vakje[6][9];

		for (int i = 0 ; i < veld.length ; i++) {
			for (int k = 0 ; k < veld[i].length ; k++) {
				veld[i][k] = new Vakje();
			}
		}

		speler1 = new Speler(1, this);
		speler2 = new Speler(2, this);
	}

	public void gameLoop() {
		int playerWon = 0;

		printField();
		while (playerWon == 0) {
			speler1.handleInput();
			playerWon = checkIfWon();
			printField();
			if (playerWon != 0) break;
			speler2.handleInput();
			printField();
			playerWon = checkIfWon();
		}

		System.out.println("Player " + playerWon + " has won! And axel is gay.");
	}

	public void printField() {
		System.out.println("---------");
		for (int i = 0 ; i < veld.length ; i++) {
			for (int j = 0 ; j < veld[i].length ; j++) {
				switch(veld[i][j].getStatus()) {
					case 0:
						System.out.print(".");
						break;
					case 1:
						System.out.print("X");
						break;
					case 2:
						System.out.print("O");
						break;
				}
			}
			System.out.println("");
		}
		System.out.println("---------");
	}

	public int checkIfWon() {
		/*
		for (int i = 0 ; i < veld.length ; i++) {
			for (int j = 0 ; j < veld[i].length ; j++) {
				if (i < veld[0].length-4) {
					if (checkHorizontal(i,j) != 0) {
						return checkHorizontal(i,j);
					}
				}
				if (j < veld.length-4) {
					if (checkVertical(i,j) != 0) {
						return checkVertical(i,j);
					}
				}
				if (j < veld.length-4 && i < veld[0].length-3) {
					if (checkDiagonal1(i,j) != 0) {
						return checkDiagonal1(i,j);
					}
				}
				if (j < veld.length-4 && i > 3) {
					if (checkDiagonal2(i,j) != 0) {
						return checkDiagonal2(i,j);
					}
				}
			}
		}*/
		return 0;
	}

	public int checkHorizontal(int x, int y) {
		System.out.println(x);
		if (getVakje(x,y).getStatus() == getVakje(x + 1,y).getStatus()) {
		if (getVakje(x,y).getStatus() == getVakje(x + 2,y).getStatus()) {
		if (getVakje(x,y).getStatus() == getVakje(x + 3,y).getStatus()) {
		return getVakje(x,y).getStatus();	
		}
		}	
		}
		return 0;
	}

	public int checkVertical(int x, int y) {
		if (getVakje(x,y).getStatus() == getVakje(x,y + 1).getStatus()) {
		if (getVakje(x,y).getStatus() == getVakje(x,y + 2).getStatus()) {
		if (getVakje(x,y).getStatus() == getVakje(x,y + 3).getStatus()) {
		return getVakje(x,y).getStatus();	
		}
		}	
		}
		return 0;
	}

	public int checkDiagonal1(int x, int y) {
		if (getVakje(x,y).getStatus() == getVakje(x + 1,y + 1).getStatus()) {
		if (getVakje(x,y).getStatus() == getVakje(x + 2,y + 2).getStatus()) {
		if (getVakje(x,y).getStatus() == getVakje(x + 3,y + 3).getStatus()) {
		return getVakje(x,y).getStatus();	
		}
		}	
		}
		return 0;
	}

	public int checkDiagonal2(int x, int y) {
		if (getVakje(x,y).getStatus() == getVakje(x - 1,y + 1).getStatus()) {
		if (getVakje(x,y).getStatus() == getVakje(x - 2,y + 2).getStatus()) {
		if (getVakje(x,y).getStatus() == getVakje(x - 3,y + 3).getStatus()) {
		return getVakje(x,y).getStatus();	
		}
		}	
		}
		return 0;
	}

	public Vakje getVakjeWithX(int x) {

		Vakje v;

		for (int i = 0 ; i < veld.length ; i++) {
			v = getVakje(x,i);
			if (v.getStatus() != 0 && i != 0) {
				return getVakje(x,i-1);
			}
		}
		return getVakje(x, veld.length - 1);
		/*if (x < 0 || x >= veld.length) return null;
		Vakje v;
		for (int i = 0 ; i < veld.length ; i++) {
			v = getVakje(x,i);
			if (v.getStatus() != 0) {
				return getVakje(x,i-1);
			} 
		}
		return getVakje(x,veld[x].length - 1);*/
	}

	public Vakje getVakje(int x, int y) {
		if (x < 0 || y < 0 || x >= veld[0].length || y >= veld.length) {
			return null;
		}

		return veld[y][x];
	}

}