//
// Created by NelosG.
//
import java.math.BigInteger;
import java.util.Scanner;

public class B {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = Integer.parseInt(sc.nextLine());
        for(int i = 0; i < n; ++i ) {
            BigInteger bint = new BigInteger(sc.nextLine());
            System.out.println(bint.isProbablePrime(10) ? "YES" : "NO");
        }
    }
}
