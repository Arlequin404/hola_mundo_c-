# Usa una imagen base de OpenJDK
FROM openjdk:11

# Crea un directorio de trabajo
WORKDIR /app

# Copia los archivos de la aplicación
COPY . .

# Descarga Spark Java y SLF4J
RUN curl -o spark.jar https://repo1.maven.org/maven2/com/sparkjava/spark-core/2.9.3/spark-core-2.9.3.jar && \
    curl -o slf4j-api.jar https://repo1.maven.org/maven2/org/slf4j/slf4j-api/1.7.30/slf4j-api-1.7.30.jar && \
    curl -o slf4j-simple.jar https://repo1.maven.org/maven2/org/slf4j/slf4j-simple/1.7.30/slf4j-simple-1.7.30.jar

# Compila la aplicación y especifica el classpath
RUN javac -cp .:spark.jar:slf4j-api.jar:slf4j-simple.jar App.java

# Ejecuta la aplicación especificando el classpath
CMD ["java", "-cp", ".:spark.jar:slf4j-api.jar:slf4j-simple.jar", "App"]
