import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        // Creació d'una llista per poder agrupar tots els clients creats amb la classe.(ArrayList<Customers>).
        List<Customer> customers;

        // Creació de Clients


        // Crear clients
        Customer cust1 = new Customer(
                "Anna",
                "García",
                "López",
                "12345678A",
                LocalDate.of(1990, 3, 15),
                "Dona",
                "Carrer Major, 10",
                "08001",
                "Barcelona"
        );

        Customer cust2 = new Customer(
                "Jordi",
                "Martí",
                "Serra",
                "87654321B",
                LocalDate.of(1985, 7, 2),
                "Home",
                "Av. Diagonal, 200",
                "08018",
                "Barcelona"
        );

        // Crear comptes per als clients
        Account acc1 = new Account("ES9820385778983000760236", LocalDate.of(2023, 5, 10), 1500.0f, true);
        Account acc2 = new Account("ES6600190020961234567890");
        Account acc3 = new Account("ES3100492356230000000001", LocalDate.of(2022, 1, 15), 2500.0f, true);

        // Afegir comptes als clients
        cust1.addAccount(acc1);
        cust1.addAccount(acc2);
        cust2.addAccount(acc3);

        // Mostrar informació dels comptes
        acc1.accountInfo();
        System.out.println("-----------------------------------");
        acc2.accountInfo();
        System.out.println("-----------------------------------");
        acc3.accountInfo();

        System.out.println("-----------------------------------");

        // Fer operacions amb un compte acc1. Saldo original 0 + 500 = 500 Eu.
        acc2.deposit(500.0f);
        System.out.println("Saldo després del deposit: " + acc2.getBalance() + "€");

        // Fer operacions amb un compte acc1. Saldo original 500 - 200 = 300 Eu.
        acc2.withdraw(200.0f);
        System.out.println("Saldo després del reintegrament: " + acc2.getBalance() + "€");

        System.out.println();
        System.out.println("-------------------------------------");
        System.out.println("Total de comptes creats: " + Account.getNumberOfAccounts());
        System.out.println("-------------------------------------");

        System.out.println();

        cust1.customerInfo();
        System.out.println("-------------------------------------");
        cust2.customerInfo();
        System.out.println("-------------------------------------");

        // Mostrar informació completa
        cust1.customerInfo();
        System.out.println("--------------------------------------");
        cust2.customerInfo();
        System.out.println();
        System.out.println("--------------------------------------");
        acc2.showTransactions();
    }
}

