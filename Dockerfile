# =========================================================
# ETAPA 1: COMPILAR EL PROYECTO
# =========================================================

FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

# Copiar configuración Maven
COPY pom.xml .

# Descargar dependencias
RUN mvn dependency:go-offline -B

# Copiar código fuente
COPY src ./src

# Compilar WAR
RUN mvn clean package -DskipTests


# =========================================================
# ETAPA 2: EJECUTAR TOMCAT
# =========================================================

FROM tomcat:11-jdk17-temurin

# Eliminar aplicaciones predeterminadas
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar aplicación como ROOT
COPY --from=build /app/target/miportafolio.war \
    /usr/local/tomcat/webapps/ROOT.war

# Render utiliza PORT=10000 por defecto
EXPOSE 10000

# Iniciar Tomcat
CMD ["catalina.sh", "run"]