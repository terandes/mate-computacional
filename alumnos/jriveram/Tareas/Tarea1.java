
/**
 *
 * @author Javier
 */
import static java.lang.Math.sqrt;
import java.util.LinkedList;

public class Tarea {

    public static long problema1(long n) {
	long a = (n - 1) / 3;
	long suma = a * (a + 1) / 2 * 3;
	a = (n - 1) / 5;
	suma += a * (a + 1) / 2 * 5;
	a = (n - 1) / 15;
	suma -= a * (a + 1) / 2 * 15;
	return suma;
    }

    public static long problema2(long n) {
	long a = 1;
	long b = 2;
	long temp;
	long suma = 0;

	for (long i = 2; i < n; i++) {
	    suma += (b % 2 == 0) ? b : 0;
	    temp = a;
	    a = b;
	    b = temp + a;
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

    private static long problema3(long n) {
	return problema3(n, new LinkedList<Long>());
    }

    public static long mcd(long m, long n) {
	if (m == 0) {
	    return n;
	}
	return (mcd(n % m, m));
    }

    public static void main(String args[]) {
	System.out.println("NOTA: LOS NÚMEROS SON DEMASIADO GRANDES Y NO CABEN EN UNA VARIABLE TIPO LONG");
	System.out.println("Problema 1: " + problema1(1000));
	System.out.println("Problema 2: " + problema2(4000000));
	System.out.println("Problema 3: " + problema3(60085147514));
    }
}
