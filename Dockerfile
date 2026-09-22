# =========================================================
# ETAPA 1: COMPILAR EL PROYECTO CON MAVEN
# =========================================================

FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

# Copiar el pom.xml
COPY pom.xml .

# Descargar dependencias
RUN mvn dependency:go-offline -B

# Copiar el código fuente
COPY src ./src

# Compilar y generar el WAR
RUN mvn clean package -DskipTests


# =========================================================
# ETAPA 2: EJECUTAR CON TOMCAT 11
# =========================================================

FROM tomcat:11-jdk17-temurin

# Eliminar aplicaciones de ejemplo de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar el WAR generado como ROOT
# La aplicación quedará disponible directamente en /
COPY --from=build /app/target/miportafolio.war \
    /usr/local/tomcat/webapps/ROOT.war

# Puerto utilizado por Render
EXPOSE 10000

# Puerto predeterminado para ejecución local
ENV PORT=10000

# =========================================================
# CONFIGURAR TOMCAT PARA USAR EL PUERTO DE RENDER
# =========================================================

CMD ["sh", "-c", "sed -i \"s/port=\\\"8080\\\"/port=\\\"${PORT}\\\"/\" /usr/local/tomcat/conf/server.xml && catalina.sh run"]