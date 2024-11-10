# Usa una imagen base de OpenJDK
FROM openjdk:11

# Crea un directorio de trabajo
WORKDIR /app

# Copia los archivos de la aplicación
COPY . .

# Descarga Spark Java
RUN curl -o spark.jar https://repo1.maven.org/maven2/com/sparkjava/spark-core/2.9.3/spark-core-2.9.3.jar

# Compila y ejecuta la aplicación
RUN javac -cp .:spark.jar App.java
CMD ["java", "-cp", ".:spark.jar", "App"]
