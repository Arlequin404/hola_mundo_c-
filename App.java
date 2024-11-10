import static spark.Spark.*;

public class App {
    public static void main(String[] args) {
        port(getHerokuAssignedPort());
        get("/", (req, res) -> "Hola Mundo desde Java!");
    }

    static int getHerokuAssignedPort() {
        String port = System.getenv("PORT");
        return port != null ? Integer.parseInt(port) : 4567;
    }
}
