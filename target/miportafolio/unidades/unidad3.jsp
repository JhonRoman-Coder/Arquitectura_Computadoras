
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    request.setAttribute("numeroUnidad", "3");
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Unidad III | Mi Portafolio</title>

    <link rel="stylesheet" href="../css/estilos.css">
</head>

<body>

<aside class="sidebar">

    <div class="logo-container">
        <h2>MI PORTAFOLIO</h2>
        <span>Académico</span>
    </div>

    <nav class="menu">
        <a href="../index.jsp">🏠 Inicio</a>
        <a href="unidad1.jsp">📘 Unidad I</a>
        <a href="unidad2.jsp">📗 Unidad II</a>
        <a href="unidad3.jsp" class="active">📙 Unidad III</a>
        <a href="unidad4.jsp">📕 Unidad IV</a>
    </nav>

    <div class="sidebar-footer">
        <p>Ingeniería de Sistemas</p>
    </div>

</aside>

<main class="main-content">

    <header class="topbar">
        <div>
            <span class="section-label">PORTAFOLIO ACADÉMICO</span>
            <h1>Unidad III</h1>
        </div>

        <a href="../index.jsp" class="btn-primary">
            Volver al inicio
        </a>
    </header>

    <section class="welcome-section">

        <span class="section-label">TERCERA UNIDAD</span>

        <h2>Contenido de la Unidad III</h2>

        <p>
            Organiza tus trabajos, documentos y actividades
            de las semanas correspondientes.
        </p>

    </section>

    <section class="weeks-section">

        <h2>Semanas académicas</h2>

        <%
            for (int semana = 9; semana <= 12; semana++) {

                request.setAttribute("numeroSemana",
                        String.valueOf(semana));

                request.setAttribute("tituloSemana",
                        "Contenido y actividades académicas");
        %>

            <jsp:include page="/WEB-INF/vistas/semana.jsp"/>

        <%
            }
        %>

    </section>

    <footer class="footer">
        <p>© 2026 Mi Portafolio Académico</p>
    </footer>

</main>

</body>
</html>