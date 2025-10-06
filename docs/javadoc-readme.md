# Documentación del Proyecto Java con Javadoc

## 📄 ¿Qué es Javadoc?

[Javadoc](https://docs.oracle.com/en/java/javase/17/docs/specs/javadoc/doc-comment-spec.html) es una herramienta de Java que **genera documentación en formato HTML** directamente desde los comentarios del código.
Permite describir clases, métodos, variables, parámetros y valores de retorno de forma clara y profesional.

---

## 🛠 Cómo usar Javadoc

### 1. Comentar el código

Los comentarios de Javadoc empiezan con `/**` y terminan con `*/`.
Se colocan **sobre clases, constructores o métodos**.

**Ejemplo:**

```java
/**
 * Representa un cliente del banco con información personal y cuentas.
 */
public class Customer {

    /** Nombre del cliente */
    private String name;

    /** Lista de cuentas del cliente */
    private List<Account> accounts;

    /**
     * Constructor que inicializa el nombre del cliente.
     *
     * @param name Nombre del cliente
     */
    public Customer(String name) {
        this.name = name;
        this.accounts = new ArrayList<>();
    }

    /**
     * Devuelve el nombre del cliente.
     *
     * @return El nombre del cliente
     */
    public String getName() {
        return name;
    }
}
```

---

### 2. Generar la documentación

1. Abre la terminal en la carpeta del proyecto.
2. Ejecuta el comando:

```bash
javadoc -d docs *.java
```

* `-d docs` → carpeta donde se generará la documentación HTML.
* `*.java` → todos los archivos Java de la carpeta.

3. Abre `docs/index.html` en un navegador para ver la documentación generada.

---

## ✅ Beneficios de Javadoc

* La documentación está **cerca del código**, fácil de actualizar.
* Genera documentación profesional y navegable en HTML.
* Facilita que otros desarrolladores comprendan y utilicen tu código rápidamente.
