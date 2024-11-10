# Usa una imagen base de .NET SDK para compilar la aplicación
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo del proyecto .csproj y restaura las dependencias
COPY MiProyecto.csproj ./
RUN dotnet restore

# Copia el resto de los archivos y construye el proyecto
COPY . ./
RUN dotnet publish -c Release -o /app/publish

# Usa la imagen base de ASP.NET Core para ejecutar la aplicación
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base

WORKDIR /app
EXPOSE 80

# Copia los archivos compilados desde la etapa anterior
COPY --from=build /app/publish .

# Define el comando de inicio de la aplicación
ENTRYPOINT ["dotnet", "MiProyecto.dll"]
