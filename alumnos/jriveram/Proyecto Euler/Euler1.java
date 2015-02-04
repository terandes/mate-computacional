
/**
 *
 * @author Javier
 */
import static java.lang.Math.sqrt;
import java.util.LinkedList;

public class Euler1 {

    public static int problema1(int n) {
	int a = (n - 1) / 3;		//cuento cuántos múltiplos de 3 hay antes de n
	int suma = a * (a + 1) / 2 * 3;	//sumo esos de múltiplos de 3
	a = (n - 1) / 5;		//cuento cuántos múltiplos de 5 hay...
	suma += a * (a + 1) / 2 * 5;	//sumo esos múltiplos de 5
	a = (n - 1) / 15;		//cuento cuántos múltiplos de 15 hay...
	suma -= a * (a + 1) / 2 * 15;	//resto esos múltiplos de 15 pues los sumé dos veces 
	return suma;
    }

    public static int problema2(int n) {
	int a = 1;				//variable que empieza en 1 por ser el primer término de la serie
	int b = 2;				//variable que empieza en 2 por ese el segundo término de la serie
	int temp;				//variable temporal
	int suma = 0;				//varaible que lleva la suma que pide le problema

	for (int i = 2; suma < n; i++) {	//ciclo que termina cuando la suma sea mayor que n, 4,000,000
	    suma += (b % 2 == 0) ? b : 0;	//si el término es par es agregado a la suma
	    temp = a;				
	    a = b;				//se recorre la serie
	    b = temp + a;			//se calcula el valor del siguiente término sumando los dos anteriores
	}
	return suma;
    }

    public static long problema3(long n, LinkedList<Long> primos) {
	long cota = (long) Math.floor(sqrt(n));

	prueba:
	for (long i = 2; i <= cota; i++) {

	    for (long x : primos) {
		if (mcd(x, i) != 1) {
		    if (n % i == 0) {
			return problema3(n / i, primos);
		    }
		    continue prueba;
		}
	    }

	    if (!primos.contains(i)) {
		primos.add(i);
	    }

	    if (n % i == 0) {
		return problema3(n / i, primos);
	    }
	}

	for (long x : primos) {
	    if (mcd(x, n) != 1) {
		break;
	    }
	    if (!primos.contains(n)) {
		primos.add(n);
		break;
	    }
	}

	return primos.getLast();
    }

    public static long problema3(long n) {
	return problema3(n, new LinkedList<Long>());
    }

    public static long mcd(long m, long n) {
	if (m == 0) {
	    return n;
	}
	return (mcd(n % m, m));
    }

    public static void main(String args[]) {
	System.out.println("Problema 1: " + problema1(1000));
	System.out.println("Problema 2: " + problema2(4000000));
	System.out.println(problema3(60085147514L));
    }
}
