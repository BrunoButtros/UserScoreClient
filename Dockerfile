# Etapa 1: Construir a aplicação usando Maven
FROM maven:3.8.4-openjdk-17 AS build

# Configurar o diretório de trabalho para /app
WORKDIR /app

# Copiar o arquivo pom.xml e instalar as dependências
COPY pom.xml .

# Baixar as dependências Maven
RUN mvn dependency:go-offline

# Copiar o restante do código fonte do projeto
COPY src ./src

# Construir a aplicação
RUN mvn clean package

# Etapa 2: Executar a aplicação usando OpenJDK
FROM openjdk:17-jdk-slim

# Configurar o diretório de trabalho para /app
WORKDIR /app

# Copiar o arquivo JAR gerado na etapa de build para o diretório de trabalho
COPY --from=build /app/target/Score-API-Server-0.0.1-SNAPSHOT.jar app.jar

# Expor a porta da aplicação
EXPOSE 8081

# Comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
