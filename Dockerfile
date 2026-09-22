# =========================================================
# ETAPA 1: COMPILAR EL PROYECTO CON MAVEN
# =========================================================

FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

# Copiar primero el pom para aprovechar la caché de Docker
COPY pom.xml .

# Descargar dependencias
RUN mvn dependency:go-offline -B

# Copiar código fuente
COPY src ./src

# Compilar y generar WAR
RUN mvn clean package -DskipTests


# =========================================================
# ETAPA 2: EJECUTAR CON TOMCAT 11
# =========================================================

FROM tomcat:11-jdk17-temurin

# Eliminar aplicaciones por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar nuestro WAR como ROOT
# Esto hará que la página abra directamente en /
COPY --from=build /app/target/miportafolio.war \
    /usr/local/tomcat/webapps/ROOT.war

# Puerto utilizado por Tomcat
EXPOSE 8080

# Iniciar Tomcat
CMD ["catalina.sh", "run"]