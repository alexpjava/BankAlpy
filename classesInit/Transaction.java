import java.time.LocalDateTime;

public class Transaction {

    private final Type type;
    private final float amount;
    private final LocalDateTime date;
    private final float balanceAfter; // saldo tras la operación
    public enum Type { DEPOSIT, WITHDRAWAL }

    // Constructor
    public Transaction(Type type, float amount, float balanceAfter) {
        this.type = type;
        this.amount = amount;
        this.date = LocalDateTime.now();
        this.balanceAfter = balanceAfter;
    }
    // Getters
    public Type getType() {
        return type;
    }
    public float getAmount() {
        return amount;
    }
    public LocalDateTime getDate() {
        return date;
    }
    public float getBalanceAfter() {
        return balanceAfter;
    }

    // Mostrar info de la transacción
    public void transactionInfo() {
        System.out.println(date + " | " + type + " | " + amount + "€ | Saldo: " + balanceAfter + "€");
    }
}

