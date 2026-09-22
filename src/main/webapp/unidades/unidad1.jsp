<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.io.File" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Unidad I | Arquitectura de Computadoras</title>

    <!-- CSS PRINCIPAL -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/estilos.css">

    <!-- =========================================================
         ESTILOS ESPECÍFICOS DE LAS UNIDADES
         ========================================================= -->

    <style>

        /* =====================================================
           BASE
           ===================================================== */

        .unit-page {
            background: #08111f !important;
            color: #f8fafc !important;
            min-height: 100vh;
        }

        .unit-page body {
            background: #08111f !important;
        }

        .unit-page .app-container {
            min-height: 100vh;
            background: #08111f;
        }


        /* =====================================================
           OCULTAR BARRA LATERAL
           ===================================================== */

        .unit-page .sidebar {
            display: none !important;
        }

        .unit-page .main-content {
            margin-left: 0 !important;
            width: 100% !important;
            max-width: 100% !important;
            min-height: 100vh;
            background: #08111f;
            color: #f8fafc;
        }

        .unit-page .menu-toggle {
            display: none !important;
        }


        /* =====================================================
           BARRA SUPERIOR
           ===================================================== */

        .unit-page .topbar {
            width: 100%;
            box-sizing: border-box;
            background: #0d1b2a !important;
            border-bottom: 1px solid rgba(255,255,255,0.08);
            color: #ffffff !important;
        }

        .unit-page .topbar h1 {
            color: #ffffff !important;
        }

        .unit-page .topbar-subtitle {
            color: #60a5fa !important;
        }

        .unit-page .profile-badge {
            background: #2563eb !important;
            color: #ffffff !important;
        }


        /* =====================================================
           PRESENTACIÓN
           ===================================================== */

        .unit-page .welcome-section {
            background: linear-gradient(
                135deg,
                #0d1b2a 0%,
                #10243b 100%
            ) !important;

            color: #ffffff !important;

            border: 1px solid rgba(96,165,250,0.12);
            border-radius: 20px;
            box-sizing: border-box;
        }

        .unit-page .welcome-content {
            color: #ffffff !important;
        }

        .unit-page .welcome-content h2 {
            color: #ffffff !important;
        }

        .unit-page .welcome-content h2 span {
            color: #60a5fa !important;
        }

        .unit-page .welcome-content p {
            color: #cbd5e1 !important;
        }

        .unit-page .tag {
            color: #60a5fa !important;
            background: rgba(37,99,235,0.12);
            border: 1px solid rgba(96,165,250,0.2);
        }


        /* =====================================================
           BOTONES
           ===================================================== */

        .unit-page .primary-button {
            background: #2563eb !important;
            color: #ffffff !important;
            border: 1px solid #3b82f6 !important;
            text-decoration: none !important;
        }

        .unit-page .primary-button:hover {
            background: #1d4ed8 !important;
            color: #ffffff !important;
        }


        /* =====================================================
           CÍRCULO CPU
           ===================================================== */

        .unit-page .welcome-graphic {
            color: #ffffff;
        }

        .unit-page .graphic-circle {
            background: linear-gradient(
                135deg,
                #2563eb,
                #1e40af
            ) !important;

            border: 5px solid rgba(96,165,250,0.18);
            color: #ffffff !important;
            box-shadow: 0 20px 50px rgba(0,0,0,0.35);
        }

        .unit-page .graphic-circle span,
        .unit-page .graphic-circle strong {
            color: #ffffff !important;
        }


        /* =====================================================
           ESTADÍSTICAS
           ===================================================== */

        .unit-page .stat-card {
            background: #0d1b2a !important;
            border: 1px solid rgba(255,255,255,0.07) !important;
            color: #ffffff !important;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
        }

        .unit-page .stat-card h3 {
            color: #ffffff !important;
        }

        .unit-page .stat-card p {
            color: #94a3b8 !important;
        }

        .unit-page .stat-icon {
            color: #60a5fa !important;
        }


        /* =====================================================
           SECCIONES
           ===================================================== */

        .unit-page .content-section {
            width: 100%;
            box-sizing: border-box;
            color: #f8fafc;
        }

        .unit-page .section-label {
            color: #60a5fa !important;
        }

        .unit-page .section-heading h2 {
            color: #ffffff !important;
        }

        .unit-page .section-counter {
            color: #cbd5e1 !important;
            background: #0d1b2a !important;
            border: 1px solid rgba(255,255,255,0.08);
        }


        /* =====================================================
           TARJETAS DE SEMANAS
           ===================================================== */

        .unit-page .documents-panel {
            width: 100%;
            box-sizing: border-box;

            background: #0d1b2a !important;

            color: #ffffff !important;

            border: 1px solid rgba(255,255,255,0.07) !important;

            border-radius: 18px;

            box-shadow:
                0 10px 30px rgba(0,0,0,0.18);

            margin-bottom: 20px;
        }

        .unit-page .documents-panel:hover {
            border-color: rgba(96,165,250,0.25) !important;
        }

        .unit-page .documents-panel h3 {
            color: #ffffff !important;
            overflow-wrap: anywhere;
            word-break: break-word;
        }

        .unit-page .documents-panel h4 {
            color: #60a5fa !important;
        }

        .unit-page .documents-panel p {
            color: #cbd5e1 !important;
            line-height: 1.6;
        }

        .unit-page .document-icon {
            color: #ffffff !important;

            background: linear-gradient(
                135deg,
                #2563eb,
                #1e40af
            ) !important;

            flex-shrink: 0;
        }


        /* =====================================================
           TARJETAS DE ARCHIVOS
           ===================================================== */

        .unit-page .documents-panel .documents-panel {
            background: #101f31 !important;

            border: 1px solid rgba(96,165,250,0.12) !important;

            border-radius: 14px;

            box-shadow: none;

            margin-top: 14px;
            margin-bottom: 10px;
        }

        .unit-page .documents-panel .documents-panel:hover {
            background: #13263d !important;
            border-color: rgba(96,165,250,0.3) !important;
        }


        /* =====================================================
           NOMBRES DE ARCHIVOS
           ===================================================== */

        .unit-page .documents-panel .documents-panel h3 {
            color: #f8fafc !important;
            font-size: 1rem;
        }

        .unit-page .documents-panel .documents-panel p {
            color: #94a3b8 !important;
            font-size: 0.9rem;
        }


        /* =====================================================
           ENLACES
           ===================================================== */

        .unit-page a {
            color: #60a5fa;
        }

        .unit-page a:hover {
            color: #93c5fd;
        }


        /* =====================================================
           FOOTER
           ===================================================== */

        .unit-page .footer {
            background: #08111f !important;
            color: #94a3b8 !important;

            border-top: 1px solid rgba(255,255,255,0.06);
        }

        .unit-page .footer p {
            color: #94a3b8 !important;
        }


        /* =====================================================
           RESPONSIVE - TABLET
           ===================================================== */

        @media (max-width: 900px) {

            .unit-page .main-content {
                width: 100% !important;
                padding-left: 20px;
                padding-right: 20px;
                box-sizing: border-box;
            }

            .unit-page .welcome-section {
                flex-direction: column;
                gap: 30px;
            }

            .unit-page .welcome-content {
                width: 100%;
            }

            .unit-page .welcome-graphic {
                width: 100%;
                display: flex;
                justify-content: center;
            }

            .unit-page .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .unit-page .documents-panel {
                width: 100%;
            }
        }


        /* =====================================================
           RESPONSIVE - CELULAR
           ===================================================== */

        @media (max-width: 600px) {

            .unit-page .main-content {
                width: 100% !important;
                padding-left: 12px;
                padding-right: 12px;
                box-sizing: border-box;
            }


            /* Barra superior */

            .unit-page .topbar {
                padding: 15px 5px;
            }

            .unit-page .topbar h1 {
                font-size: 1.2rem;
                line-height: 1.3;
            }

            .unit-page .topbar-subtitle {
                font-size: 0.68rem;
            }

            .unit-page .profile-badge {
                display: none;
            }


            /* Presentación */

            .unit-page .welcome-section {
                padding: 20px;
                border-radius: 16px;
            }

            .unit-page .welcome-content h2 {
                font-size: 1.65rem;
                line-height: 1.25;
            }

            .unit-page .welcome-content p {
                font-size: 0.92rem;
                line-height: 1.6;
            }

            .unit-page .welcome-graphic {
                display: none;
            }


            /* Estadísticas */

            .unit-page .stats-grid {
                grid-template-columns: 1fr;
                gap: 12px;
            }

            .unit-page .stat-card {
                width: 100%;
                box-sizing: border-box;
            }


            /* Encabezado */

            .unit-page .section-heading {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }

            .unit-page .section-heading h2 {
                font-size: 1.5rem;
            }

            .unit-page .section-counter {
                align-self: flex-start;
            }


            /* Semanas */

            .unit-page .documents-panel {
                padding: 18px;
                width: 100%;
                box-sizing: border-box;
                border-radius: 15px;
            }


            /* Archivos */

            .unit-page .documents-panel .documents-panel {
                padding: 14px;
            }

            .unit-page .documents-panel .documents-panel .document-icon {
                display: none;
            }


            /* Botones */

            .unit-page .primary-button {
                display: inline-block;
                margin-top: 6px;
                margin-bottom: 6px;
                text-align: center;
            }


            /* Footer */

            .unit-page .footer {
                text-align: center;
                padding: 25px 10px;
            }
        }


        /* =====================================================
           CELULARES MUY PEQUEÑOS
           ===================================================== */

        @media (max-width: 400px) {

            .unit-page .main-content {
                padding-left: 8px;
                padding-right: 8px;
            }

            .unit-page .welcome-section {
                padding: 15px;
            }

            .unit-page .welcome-content h2 {
                font-size: 1.4rem;
            }

            .unit-page .welcome-content p {
                font-size: 0.88rem;
            }

            .unit-page .documents-panel {
                padding: 14px;
            }

            .unit-page .documents-panel h3 {
                font-size: 1rem;
            }

            .unit-page .documents-panel p {
                font-size: 0.88rem;
            }

            .unit-page .primary-button {
                width: 100%;
                box-sizing: border-box;
            }
        }

    </style>

</head>


<body class="unit-page">

<div class="app-container">


    <!-- =====================================================
         CONTENIDO PRINCIPAL
         ===================================================== -->

    <main class="main-content">


        <!-- =================================================
             BARRA SUPERIOR
             ================================================= -->

        <header class="topbar">

            <div>

                <p class="topbar-subtitle">
                    PORTAFOLIO ACADÉMICO
                </p>

                <h1>
                    Arquitectura de Computadoras
                </h1>

            </div>

            <div class="profile-badge">
                JS
            </div>

        </header>


        <!-- =================================================
             PRESENTACIÓN
             ================================================= -->

        <section class="welcome-section">

            <div class="welcome-content">

                <span class="tag">
                    UNIDAD I
                </span>

                <h2>

                    Fundamentos de la
                    <span>Arquitectura</span>

                </h2>

                <p>

                    En esta unidad se estudian los fundamentos de la
                    arquitectura de software, los atributos de calidad,
                    estándares internacionales y conceptos fundamentales
                    relacionados con el desarrollo de sistemas.

                </p>

                <a href="#semanas"
                   class="primary-button">

                    Explorar semanas →

                </a>

            </div>


            <div class="welcome-graphic">

                <div class="graphic-circle">

                    <span>01</span>

                    <strong>
                        CPU
                    </strong>

                </div>

            </div>

        </section>


        <!-- =================================================
             ESTADÍSTICAS
             ================================================= -->

        <section class="stats-grid">

            <div class="stat-card">

                <div class="stat-icon">
                    ▦
                </div>

                <div>

                    <h3>
                        04
                    </h3>

                    <p>
                        Semanas académicas
                    </p>

                </div>

            </div>


            <div class="stat-card">

                <div class="stat-icon">
                    ▤
                </div>

                <div>

                    <h3>
                        I
                    </h3>

                    <p>
                        Unidad académica
                    </p>

                </div>

            </div>


            <div class="stat-card">

                <div class="stat-icon">
                    ✓
                </div>

                <div>

                    <h3>
                        100%
                    </h3>

                    <p>
                        Contenido organizado
                    </p>

                </div>

            </div>

        </section>


        <!-- =================================================
             SEMANAS
             ================================================= -->

        <section class="content-section"
                 id="semanas">


            <!-- ENCABEZADO -->

            <div class="section-heading">

                <div>

                    <span class="section-label">
                        CONTENIDO DE LA UNIDAD
                    </span>

                    <h2>
                        Unidad I
                    </h2>

                </div>

                <span class="section-counter">
                    04 semanas
                </span>

            </div>


            <!-- =================================================
                 SEMANA 1
                 ================================================= -->

            <div class="documents-panel">

                <div class="document-icon">
                    01
                </div>

                <div>

                    <span class="section-label">
                        SEMANA 1
                    </span>

                    <h3>
                        Fundamentos de arquitectura de software
                    </h3>

                    <p>

                        Fundamentos de arquitectura de software,
                        atributos de calidad, estándares y conceptos
                        fundamentales.

                    </p>

                    <h4>
                        Trabajos académicos
                    </h4>


                    <%

                        String rutaSemana1 = application.getRealPath(
                            "/assets/documentos/unidad1/semana1"
                        );

                        File carpetaSemana1 =
                            new File(rutaSemana1);

                        File[] archivosSemana1 =
                            carpetaSemana1.listFiles();

                        if (archivosSemana1 != null &&
                            archivosSemana1.length > 0) {

                            for (File archivo : archivosSemana1) {

                                if (archivo.isFile()) {

                                    String nombre =
                                        archivo.getName();

                                    String nombreCodificado =
                                        URLEncoder.encode(
                                            nombre,
                                            StandardCharsets.UTF_8
                                        ).replace("+", "%20");

                    %>


                    <!-- ARCHIVO -->

                    <div class="documents-panel">

                        <div class="document-icon">
                            ▱
                        </div>

                        <div>

                            <h3>
                                <%= nombre %>
                            </h3>

                            <p>
                                Material académico de la Semana 1.
                            </p>

                            <a
                                href="${pageContext.request.contextPath}/assets/documentos/unidad1/semana1/<%= nombreCodificado %>"
                                target="_blank"
                                class="primary-button">

                                Ver archivo →

                            </a>

                            <a
                                href="${pageContext.request.contextPath}/assets/documentos/unidad1/semana1/<%= nombreCodificado %>"
                                download
                                class="primary-button">

                                Descargar

                            </a>

                        </div>

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

                </div>

            </div>


            <!-- =================================================
                 SEMANA 2
                 ================================================= -->

            <div class="documents-panel">

                <div class="document-icon">
                    02
                </div>

                <div>

                    <span class="section-label">
                        SEMANA 2
                    </span>

                    <h3>
                        Contenido académico de la Semana 2
                    </h3>

                    <p>
                        Actividades, materiales y evidencias
                        correspondientes a la segunda semana.
                    </p>

                    <h4>
                        Trabajos académicos
                    </h4>


                    <%

                        String rutaSemana2 = application.getRealPath(
                            "/assets/documentos/unidad1/semana2"
                        );

                        File carpetaSemana2 =
                            new File(rutaSemana2);

                        File[] archivosSemana2 =
                            carpetaSemana2.listFiles();

                        if (archivosSemana2 != null &&
                            archivosSemana2.length > 0) {

                            for (File archivo : archivosSemana2) {

                                if (archivo.isFile()) {

                                    String nombre =
                                        archivo.getName();

                                    String nombreCodificado =
                                        URLEncoder.encode(
                                            nombre,
                                            StandardCharsets.UTF_8
                                        ).replace("+", "%20");

                    %>


                    <div class="documents-panel">

                        <div class="document-icon">
                            ▱
                        </div>

                        <div>

                            <h3>
                                <%= nombre %>
                            </h3>

                            <p>
                                Material académico de la Semana 2.
                            </p>

                            <a
                                href="${pageContext.request.contextPath}/assets/documentos/unidad1/semana2/<%= nombreCodificado %>"
                                target="_blank"
                                class="primary-button">

                                Ver archivo →

                            </a>

                            <a
                                href="${pageContext.request.contextPath}/assets/documentos/unidad1/semana2/<%= nombreCodificado %>"
                                download
                                class="primary-button">

                                Descargar

                            </a>

                        </div>

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

                </div>

            </div>


            <!-- =================================================
                 SEMANA 3
                 ================================================= -->

            <div class="documents-panel">

                <div class="document-icon">
                    03
                </div>

                <div>

                    <span class="section-label">
                        SEMANA 3
                    </span>

                    <h3>
                        Contenido académico de la Semana 3
                    </h3>

                    <p>
                        Actividades, informes y materiales
                        correspondientes a la tercera semana.
                    </p>

                    <h4>
                        Trabajos académicos
                    </h4>


                    <%

                        String rutaSemana3 = application.getRealPath(
                            "/assets/documentos/unidad1/semana3"
                        );

                        File carpetaSemana3 =
                            new File(rutaSemana3);

                        File[] archivosSemana3 =
                            carpetaSemana3.listFiles();

                        if (archivosSemana3 != null &&
                            archivosSemana3.length > 0) {

                            for (File archivo : archivosSemana3) {

                                if (archivo.isFile()) {

                                    String nombre =
                                        archivo.getName();

                                    String nombreCodificado =
                                        URLEncoder.encode(
                                            nombre,
                                            StandardCharsets.UTF_8
                                        ).replace("+", "%20");

                    %>


                    <div class="documents-panel">

                        <div class="document-icon">
                            ▱
                        </div>

                        <div>

                            <h3>
                                <%= nombre %>
                            </h3>

                            <p>
                                Material académico de la Semana 3.
                            </p>

                            <a
                                href="${pageContext.request.contextPath}/assets/documentos/unidad1/semana3/<%= nombreCodificado %>"
                                target="_blank"
                                class="primary-button">

                                Ver archivo →

                            </a>

                            <a
                                href="${pageContext.request.contextPath}/assets/documentos/unidad1/semana3/<%= nombreCodificado %>"
                                download
                                class="primary-button">

                                Descargar

                            </a>

                        </div>

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

                </div>

            </div>


            <!-- =================================================
                 SEMANA 4
                 ================================================= -->

            <div class="documents-panel">

                <div class="document-icon">
                    04
                </div>

                <div>

                    <span class="section-label">
                        SEMANA 4
                    </span>

                    <h3>
                        Contenido académico de la Semana 4
                    </h3>

                    <p>
                        Actividades, materiales y evidencias
                        correspondientes a la cuarta semana.
                    </p>

                    <h4>
                        Trabajos académicos
                    </h4>


                    <%

                        String rutaSemana4 = application.getRealPath(
                            "/assets/documentos/unidad1/semana4"
                        );

                        File carpetaSemana4 =
                            new File(rutaSemana4);

                        File[] archivosSemana4 =
                            carpetaSemana4.listFiles();

                        if (archivosSemana4 != null &&
                            archivosSemana4.length > 0) {

                            for (File archivo : archivosSemana4) {

                                if (archivo.isFile()) {

                                    String nombre =
                                        archivo.getName();

                                    String nombreCodificado =
                                        URLEncoder.encode(
                                            nombre,
                                            StandardCharsets.UTF_8
                                        ).replace("+", "%20");

                    %>


                    <div class="documents-panel">

                        <div class="document-icon">
                            ▱
                        </div>

                        <div>

                            <h3>
                                <%= nombre %>
                            </h3>

                            <p>
                                Material académico de la Semana 4.
                            </p>

                            <a
                                href="${pageContext.request.contextPath}/assets/documentos/unidad1/semana4/<%= nombreCodificado %>"
                                target="_blank"
                                class="primary-button">

                                Ver archivo →

                            </a>

                            <a
                                href="${pageContext.request.contextPath}/assets/documentos/unidad1/semana4/<%= nombreCodificado %>"
                                download
                                class="primary-button">

                                Descargar

                            </a>

                        </div>

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

                </div>

            </div>


        </section>


        <!-- =================================================
             VOLVER A LAS UNIDADES
             ================================================= -->

        <section class="content-section">

            <div class="section-heading">

                <div>

                    <span class="section-label">
                        NAVEGACIÓN
                    </span>

                    <h2>
                        Continuar explorando
                    </h2>

                </div>

            </div>


            <div class="documents-panel">

                <div class="document-icon">
                    ←
                </div>

                <div>

                    <h3>
                        Volver a las unidades
                    </h3>

                    <p>
                        Regresa al inicio para consultar
                        las demás unidades académicas.
                    </p>

                    <a
                        href="${pageContext.request.contextPath}/index.jsp#unidades"
                        class="primary-button">

                        ← Ver unidades

                    </a>

                </div>

            </div>

        </section>


        <!-- =================================================
             FOOTER
             ================================================= -->

        <footer class="footer">

            <p>
                © 2026 Mi Portafolio Académico
            </p>

            <p>
                Arquitectura de Computadoras
            </p>

        </footer>


    </main>

</div>


</body>

</html>