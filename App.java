import static spark.Spark.*;

public class App {
    public static void main(String[] args) {
        // Usa el puerto asignado por Railway a través de la variable de entorno PORT
        port(getHerokuAssignedPort());

        get("/", (req, res) -> "Hola Mundo desde Java!");
    }

    static int getHerokuAssignedPort() {
        String port = System.getenv("PORT"); // Railway asigna el puerto aquí
        return port != null ? Integer.parseInt(port) : 8080; // Usa 8080 como puerto por defecto si no se asigna
    }
}
