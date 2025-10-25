# Quarto Project Documentacion

## 📄 What is Quarto?

[Javadoc](https://docs.oracle.com/en/java/javase/17/docs/specs/javadoc/doc-comment-spec.html) is a tool in Java that **generates HTML documentation** directly from comments in your source code. It allows you to describe classes, methods, variables, parameters, and return values in a clear and professional way.

---

## 🛠 How to Use Javadoc

### 1. Comment Your Code

Javadoc comments start with `/**` and end with `*/`. They are placed **above classes, constructors, or methods**.

**Example:**

```java
/**
 * Represents a bank customer with personal information and accounts.
 */
public class Customer {

    /** Customer's name */
    private String name;

    /** List of customer's accounts */
    private List<Account> accounts;

    /**
     * Constructor that initializes the customer's name.
     *
     * @param name Customer's name
     */
    public Customer(String name) {
        this.name = name;
        this.accounts = new ArrayList<>();
    }

    /**
     * Returns the customer's name.
     *
     * @return Customer's name
     */
    public String getName() {
        return name;
    }
}
```



---

### 2. Generate Documentation

1. Open the terminal in your project folder.
2. Run the command:

```bash
javadoc -d docs *.java
```

* `-d docs` → folder where the HTML documentation will be created.
* `*.java` → all Java files in the folder.

3. Open `docs/index.html` in a web browser to view the generated documentation.

---

## ✅ Benefits of Javadoc

* Documentation stays **close to the code**, making it easy to update.
* Generates professional, navigable **HTML documentation**.
* Helps other developers quickly understand and use your code.

