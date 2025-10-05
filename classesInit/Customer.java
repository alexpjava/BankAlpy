import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;


public class Customer {

    // Variables de Classe
    private String name;
    private String firstLastName;
    private String secondLastName;
    private final String nif;
    private final LocalDate dateBirth;
    private final String sex;
    private String address;
    private String zipCode;
    private String city;

    // Podem fer que cada Customer tingui una llista de comptes (ArrayList<Account>).
    // Per això declarem una llista d'objectes Account que es dira accounts;
    private List<Account> accounts;

    private static int idCustomer = 1;
    private int idCus;

    // Constructor amb totes les variables de la classe.

    public Customer(String name,String firstLastName,String secondLastName,String nif,LocalDate dateBirth,
                    String sex, String address,String zipCode, String city){
        this.idCus = idCustomer;
        this.name = name;
        this.firstLastName = firstLastName;
        this.secondLastName = secondLastName;
        this.nif = nif;
        this.dateBirth = dateBirth;
        this.sex = sex;
        this.address = address;
        this.zipCode = zipCode;
        this.city = city;
        // Crea una llista buida dins de l'objecte customer per poder ser omplerta amb els comptes que pugui tenir
        this.accounts = new ArrayList<>();
        idCustomer++;

    }

    // Getters
    public String getName() {
        return name;
    }
    public String getFirstLastName() {
        return firstLastName;
    }

    public String getSecondLastName() {
        return secondLastName;
    }

    public String getNif() {
        return nif;
    }

    public LocalDate getDateBirth() {
        return dateBirth;
    }
    public String getSex(){
        return sex;
    }

    public String getAddress() {
        return address;
    }

    public String getZipCode() {
        return zipCode;
    }

    public String getCity() {
        return city;
    }

    // Setters

    public void setName(String name) {
        this.name = name;
    }

    public void setFirstLastName(String firstLastName) {
        this.firstLastName = firstLastName;
    }

    public void setSecondLastName(String secondLastName) {
        this.secondLastName = secondLastName;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCity(String city) {
        this.city = city;
    }

    // Afegir un compte al client
    public void addAccount(Account acc){
        this.accounts.add(acc);
    }

    // Obtenir tots els comptes
    public List<Account> getAccounts(){
        return accounts;
    }


    //Mètode void per sortida de pantalla de totes les dades del Customer.
    public void customerInfo() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d 'de' MMMM 'de' yyyy", new Locale("es", "ES"));
        String formattedDate = dateBirth.format(formatter);
        System.out.println("Customer con id " + idCus + "Name " + name + " " + firstLastName + " " + secondLastName +
                "\nNif " + nif +
                "\nDate of Birth " + dateBirth +
                "\nHis sex is: " + sex +
                "\nAddress " + address + " " + zipCode + " " + city);
        System.out.println("Comptes:");

        /*for (Tipus element : col·leccio) {
            // accions amb element
        }
        Account acc → cada vegada, la variable acc conté un compte de la llista.
        Accounts → és la col·lecció que volem recórrer (la llista de comptes del client).
        A cada iteració, podem utilitzar els mètodes getters de l’objecte Account per consultar informació.

         */
        for(Account acc : accounts){
            System.out.println("   - Nº Compte: " + acc.getAccountNumber() +
                    " | Saldo: " + acc.getBalance() + "€");
            for(Transaction tra : acc.getTransactions()){
                System.out.println("\t\t" + tra.getDate() + " | " + tra.getType() + " | " + tra.getAmount() + "€ | Saldo: " + tra.getBalanceAfter() + "€");

            }
        }
    }
}
