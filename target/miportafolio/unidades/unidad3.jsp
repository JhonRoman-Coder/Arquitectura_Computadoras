<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.io.File" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Unidad III - Mi Portafolio</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">

</head>


<body>


<header>

    <h1>MI PORTAFOLIO</h1>

    <p>Espacio académico digital</p>

</header>


<main>

    <h2>Unidad III</h2>

    <p>
        Comunicación e Integración de Arquitecturas de Software
    </p>


    <%

    for (int semana = 1; semana <= 4; semana++) {

        String nombreSemana = "semana" + semana;

        String ruta = application.getRealPath(
            "/assets/documentos/unidad3/" + nombreSemana
        );

        File carpeta = new File(ruta);

        File[] archivos = carpeta.listFiles();

        int numeroSemana = semana + 8;

    %>


    <section>

        <h3>Semana <%= numeroSemana %></h3>

        <p>
            Contenido académico correspondiente a la Semana <%= numeroSemana %>.
        </p>


        <h4>Trabajos académicos</h4>


        <%

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
                href="../assets/documentos/unidad3/<%= nombreSemana %>/<%= nombreCodificado %>"
                target="_blank">
                Ver archivo
            </a>


            &nbsp;


            <a
                href="../assets/documentos/unidad3/<%= nombreSemana %>/<%= nombreCodificado %>"
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

        %>


    </section>


    <%

    }

    %>


    <p>

        <a href="../index.jsp">
            ← Volver al inicio
        </a>

    </p>


</main>


</body>

</html>