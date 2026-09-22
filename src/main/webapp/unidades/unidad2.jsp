<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.io.File" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Unidad II - Mi Portafolio</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">

</head>


<body>


<header>

    <h1>MI PORTAFOLIO</h1>

    <p>Espacio académico digital</p>

</header>


<main>

    <h2>Unidad II</h2>

    <p>
        Modelado de la Arquitectura de Software mediante POO
    </p>


    <section>

        <h3>Semana 5</h3>

        <p>
            Contenido académico de la Semana 5.
        </p>

        <h4>Trabajos académicos</h4>

        <%

        for (int semana = 1; semana <= 4; semana++) {

            String nombreSemana = "semana" + semana;

            String ruta = application.getRealPath(
                "/assets/documentos/unidad2/" + nombreSemana
            );

            File carpeta = new File(ruta);

            File[] archivos = carpeta.listFiles();

        %>

        <%

            if (semana > 1) {

        %>

        <h3>Semana <%= semana + 4 %></h3>

        <p>
            Contenido académico correspondiente a esta semana.
        </p>

        <h4>Trabajos académicos</h4>

        <%

            }

            if (archivos != null && archivos.length > 0) {

                for (File archivo : archivos) {

                    if (archivo.isFile()) {

                        String nombre = archivo.getName();

                        String nombreCodificado = URLEncoder.encode(
                            nombre,
                            StandardCharsets.UTF_8
                        ).replace("+", "%20");

        %>

        <div>

            <p>
                <strong><%= nombre %></strong>
            </p>

            <a
                href="../assets/documentos/unidad2/<%= nombreSemana %>/<%= nombreCodificado %>"
                target="_blank">
                Ver archivo
            </a>

            &nbsp;

            <a
                href="../assets/documentos/unidad2/<%= nombreSemana %>/<%= nombreCodificado %>"
                download>
                Descargar
            </a>

        </div>

        <%

                    }

                }

            } else {

        %>

        <p>
            Todavía no hay trabajos cargados en esta semana.
        </p>

        <%

            }

        }

        %>


    </section>


    <p>

        <a href="../index.jsp">
            ← Volver al inicio
        </a>

    </p>


</main>


</body>

</html>