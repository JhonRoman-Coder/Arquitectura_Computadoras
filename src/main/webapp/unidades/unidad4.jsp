
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Comparator" %>

<%
    String contexto = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Unidad IV | Mi Portafolio Académico</title>

    <link rel="stylesheet"
          href="<%= contexto %>/css/estilos.css">

    <style>
        * {
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body.unit-page {
            margin: 0;
            min-height: 100vh;
            background: #08111f !important;
            color: #f8fafc !important;
            font-family: Arial, sans-serif;
        }

        .unit-page .app-container {
            min-height: 100vh;
            background: #08111f;
        }

        .unit-page .sidebar,
        .unit-page .menu-toggle {
            display: none !important;
        }

        .unit-page .main-content {
            width: 100%;
            max-width: 100%;
            min-height: 100vh;
            margin-left: 0 !important;
            padding: 0 40px;
            background: #08111f;
        }

        /* BARRA SUPERIOR */

        .unit-page .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            padding: 28px 10px;
            background: #0d1b2a !important;
            border-bottom: 1px solid rgba(255,255,255,.08);
        }

        .unit-page .topbar h1 {
            margin: 8px 0 0;
            color: #ffffff !important;
            font-size: 1.8rem;
        }

        .unit-page .topbar-subtitle {
            margin: 0;
            color: #60a5fa !important;
            font-size: .78rem;
            font-weight: bold;
            letter-spacing: 2px;
        }

        .unit-page .profile-badge {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 48px;
            height: 48px;
            flex-shrink: 0;
            border-radius: 50%;
            background: #2563eb !important;
            color: #ffffff !important;
            font-weight: bold;
        }

        /* PRESENTACIÓN */

        .unit-page .welcome-section {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 35px;
            margin: 35px 0;
            padding: 45px;
            border: 1px solid rgba(96,165,250,.15);
            border-radius: 20px;
            background: linear-gradient(
                135deg, #0d1b2a, #10243b
            ) !important;
        }

        .unit-page .welcome-content {
            flex: 1;
            min-width: 0;
        }

        .unit-page .tag {
            display: inline-block;
            padding: 8px 14px;
            border-radius: 30px;
            border: 1px solid rgba(96,165,250,.2);
            background: rgba(37,99,235,.12);
            color: #60a5fa !important;
            font-size: .75rem;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .unit-page .welcome-content h2 {
            margin: 22px 0;
            color: #ffffff !important;
            font-size: clamp(1.8rem, 4vw, 2.8rem);
            line-height: 1.2;
        }

        .unit-page .welcome-content h2 span {
            color: #60a5fa !important;
        }

        .unit-page .welcome-content p {
            max-width: 700px;
            margin-bottom: 25px;
            color: #cbd5e1 !important;
            line-height: 1.8;
        }

        /* GRÁFICO */

        .unit-page .welcome-graphic {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 240px;
            flex-shrink: 0;
        }

        .unit-page .graphic-circle {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 190px;
            height: 190px;
            border-radius: 50%;
            border: 5px solid rgba(96,165,250,.18);
            background: linear-gradient(
                135deg, #2563eb, #1e40af
            );
            box-shadow: 0 20px 50px rgba(0,0,0,.35);
            color: white;
        }

        .unit-page .graphic-circle span {
            font-size: 3.5rem;
            font-weight: bold;
        }

        .unit-page .graphic-circle strong {
            font-size: 1.2rem;
            letter-spacing: 3px;
        }

        /* BOTONES */

        .unit-page .primary-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px 20px;
            border: 1px solid #3b82f6 !important;
            border-radius: 10px;
            background: #2563eb !important;
            color: #ffffff !important;
            text-decoration: none !important;
            font-weight: bold;
            font-size: .9rem;
            transition: .2s ease;
        }

        .unit-page .primary-button:hover {
            background: #1d4ed8 !important;
            transform: translateY(-2px);
        }

        .unit-page .secondary-button {
            background: transparent !important;
            color: #93c5fd !important;
            border-color: rgba(96,165,250,.4) !important;
        }

        .unit-page .secondary-button:hover {
            background: rgba(37,99,235,.16) !important;
            color: white !important;
        }

        /* ESTADÍSTICAS */

        .unit-page .stats-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0,1fr));
            gap: 20px;
            margin-bottom: 45px;
        }

        .unit-page .stat-card {
            display: flex;
            align-items: center;
            gap: 20px;
            padding: 24px;
            border: 1px solid rgba(255,255,255,.07);
            border-radius: 16px;
            background: #0d1b2a !important;
            box-shadow: 0 10px 30px rgba(0,0,0,.15);
        }

        .unit-page .stat-icon {
            color: #60a5fa !important;
            font-size: 2rem;
        }

        .unit-page .stat-card h3 {
            margin: 0 0 5px;
            color: #ffffff !important;
            font-size: 1.8rem;
        }

        .unit-page .stat-card p {
            margin: 0;
            color: #94a3b8 !important;
            font-size: .9rem;
        }

        /* SECCIONES */

        .unit-page .content-section {
            width: 100%;
            margin-bottom: 40px;
        }

        .unit-page .section-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            margin-bottom: 25px;
        }

        .unit-page .section-label {
            color: #60a5fa !important;
            font-size: .8rem;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .unit-page .section-heading h2 {
            margin: 8px 0 0;
            color: #ffffff !important;
            font-size: 2rem;
        }

        .unit-page .section-counter {
            padding: 9px 15px;
            border: 1px solid rgba(255,255,255,.08);
            border-radius: 20px;
            background: #0d1b2a;
            color: #cbd5e1 !important;
            white-space: nowrap;
        }

        /* TARJETAS DE SEMANAS */

        .unit-page .documents-panel {
            display: flex;
            align-items: flex-start;
            gap: 22px;
            width: 100%;
            margin-bottom: 20px;
            padding: 28px;
            border: 1px solid rgba(255,255,255,.07);
            border-radius: 18px;
            background: #0d1b2a !important;
            box-shadow: 0 10px 30px rgba(0,0,0,.18);
            transition: border-color .2s;
        }

        .unit-page .documents-panel:hover {
            border-color: rgba(96,165,250,.3);
        }

        .unit-page .document-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 55px;
            height: 55px;
            flex-shrink: 0;
            border-radius: 14px;
            background: linear-gradient(
                135deg, #2563eb, #1e40af
            );
            color: #ffffff !important;
            font-size: 1.1rem;
            font-weight: bold;
        }

        .unit-page .panel-content {
            flex: 1;
            min-width: 0;
        }

        .unit-page .documents-panel h3 {
            margin: 10px 0;
            color: #ffffff !important;
            overflow-wrap: anywhere;
        }

        .unit-page .documents-panel h4 {
            margin: 24px 0 14px;
            color: #60a5fa !important;
        }

        .unit-page .documents-panel p {
            color: #cbd5e1 !important;
            line-height: 1.7;
        }

        /* ARCHIVOS */

        .unit-page .file-card {
            display: flex;
            align-items: center;
            gap: 16px;
            margin: 12px 0;
            padding: 18px;
            border: 1px solid rgba(96,165,250,.12);
            border-radius: 14px;
            background: #101f31;
        }

        .unit-page .file-card:hover {
            background: #13263d;
            border-color: rgba(96,165,250,.3);
        }

        .unit-page .file-card .document-icon {
            width: 45px;
            height: 45px;
            font-size: 1.2rem;
        }

        .unit-page .file-content {
            flex: 1;
            min-width: 0;
        }

        .unit-page .file-content h3 {
            margin: 0 0 6px;
            font-size: 1rem;
        }

        .unit-page .file-content p {
            margin: 0;
            color: #94a3b8 !important;
            font-size: .85rem;
        }

        .unit-page .file-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 14px;
        }

        .unit-page .empty-message {
            padding: 18px;
            border: 1px dashed rgba(96,165,250,.25);
            border-radius: 12px;
            background: #101f31;
            color: #94a3b8 !important;
        }

        /* FOOTER */

        .unit-page .footer {
            padding: 30px 10px;
            border-top: 1px solid rgba(255,255,255,.06);
            background: #08111f !important;
            text-align: center;
        }

        .unit-page .footer p {
            color: #94a3b8 !important;
            font-size: .9rem;
        }

        /* RESPONSIVE */

        @media (max-width: 900px) {
            .unit-page .main-content {
                padding: 0 20px;
            }

            .unit-page .welcome-section {
                flex-direction: column;
                align-items: stretch;
                padding: 30px;
            }

            .unit-page .welcome-graphic {
                width: 100%;
            }

            .unit-page .stats-grid {
                grid-template-columns: repeat(2, minmax(0,1fr));
            }
        }

        @media (max-width: 600px) {
            .unit-page .main-content {
                padding: 0 12px;
            }

            .unit-page .topbar {
                padding: 18px 5px;
            }

            .unit-page .topbar h1 {
                font-size: 1.25rem;
            }

            .unit-page .profile-badge,
            .unit-page .welcome-graphic {
                display: none;
            }

            .unit-page .welcome-section {
                padding: 22px;
            }

            .unit-page .stats-grid {
                grid-template-columns: 1fr;
                gap: 12px;
            }

            .unit-page .section-heading {
                flex-direction: column;
                align-items: flex-start;
            }

            .unit-page .section-heading h2 {
                font-size: 1.5rem;
            }

            .unit-page .documents-panel {
                padding: 18px;
                gap: 12px;
            }

            .unit-page .documents-panel > .document-icon {
                display: none;
            }

            .unit-page .file-card {
                flex-direction: column;
                align-items: flex-start;
                padding: 14px;
            }

            .unit-page .file-card .document-icon {
                display: none;
            }

            .unit-page .primary-button {
                width: 100%;
            }
        }
    </style>
</head>

<body class="unit-page">

<div class="app-container">
<main class="main-content">

    <!-- BARRA SUPERIOR -->

    <header class="topbar">

        <div>
            <p class="topbar-subtitle">
                PORTAFOLIO ACADÉMICO
            </p>

            <h1>
                Frameworks y Estándares para la
                Implementación de Arquitecturas
            </h1>
        </div>

        <div class="profile-badge">JS</div>

    </header>

    <!-- PRESENTACIÓN -->

    <section class="welcome-section">

        <div class="welcome-content">

            <span class="tag">UNIDAD IV</span>

            <h2>
                Frameworks, Estándares e
                <span>Implementación de Software</span>
            </h2>

            <p>
                En esta unidad se estudian los frameworks,
                estándares y buenas prácticas utilizados
                para implementar arquitecturas de software.

                Se desarrollan actividades relacionadas
                con la construcción de componentes,
                integración de funcionalidades y validación
                de soluciones tecnológicas.
            </p>

            <a href="#semanas" class="primary-button">
                Explorar semanas →
            </a>

        </div>

        <div class="welcome-graphic">
            <div class="graphic-circle">
                <span>04</span>
                <strong>DEV</strong>
            </div>
        </div>

    </section>

    <!-- ESTADÍSTICAS -->

    <section class="stats-grid">

        <div class="stat-card">
            <div class="stat-icon">▦</div>
            <div>
                <h3>04</h3>
                <p>Semanas académicas</p>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-icon">▤</div>
            <div>
                <h3>IV</h3>
                <p>Unidad académica</p>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-icon">✓</div>
            <div>
                <h3>100%</h3>
                <p>Contenido organizado</p>
            </div>
        </div>

    </section>

    <!-- SEMANAS -->

    <section class="content-section" id="semanas">

        <div class="section-heading">
            <div>
                <span class="section-label">
                    CONTENIDO DE LA UNIDAD
                </span>
                <h2>Unidad IV</h2>
            </div>

            <span class="section-counter">
                04 semanas
            </span>
        </div>

        <%
            for (int semana = 1; semana <= 4; semana++) {

                int numeroSemana = semana + 12;
                String nombreSemana = "semana" + semana;

                String rutaRelativa =
                    "/assets/documentos/unidad4/" + nombreSemana;

                String rutaFisica =
                    application.getRealPath(rutaRelativa);

                File[] archivos = null;

                if (rutaFisica != null) {
                    File carpeta = new File(rutaFisica);

                    if (carpeta.isDirectory()) {
                        archivos = carpeta.listFiles(
                            archivo -> archivo.isFile()
                        );
                    }
                }

                if (archivos != null) {
                    Arrays.sort(
                        archivos,
                        Comparator.comparing(
                            File::getName,
                            String.CASE_INSENSITIVE_ORDER
                        )
                    );
                }

                String rutaWeb = contexto + rutaRelativa;
        %>

        <article class="documents-panel">

            <div class="document-icon">
                <%= String.format("%02d", semana) %>
            </div>

            <div class="panel-content">

                <span class="section-label">
                    SEMANA <%= numeroSemana %>
                </span>

                <!-- ===================================== -->
                <!-- TÍTULOS Y DESCRIPCIONES EDITABLES -->
                <!-- ===================================== -->

                <% if (semana == 1) { %>

                    <!-- SEMANA 13 -->

                    <h3>
                        Frameworks para la implementación
                        de arquitecturas
                    </h3>

                    <p>
                        En esta semana se estudian los
                        fundamentos de los frameworks
                        utilizados para implementar
                        arquitecturas de software.

                        Se analizan sus principales
                        características, ventajas y
                        aplicaciones en el desarrollo
                        de sistemas informáticos.
                    </p>

                <% } else if (semana == 2) { %>

                    <!-- SEMANA 14 -->

                    <h3>
                        Estándares y buenas prácticas
                        de desarrollo
                    </h3>

                    <p>
                        Se estudian y aplican estándares
                        de desarrollo de software,
                        considerando principios de
                        organización, mantenibilidad,
                        reutilización y calidad del código.

                        Asimismo, se revisan buenas prácticas
                        para mejorar la estructura y
                        funcionamiento de las aplicaciones.
                    </p>

                <% } else if (semana == 3) { %>

                    <!-- SEMANA 15 -->

                    <h3>
                        Integración y desarrollo
                        de componentes
                    </h3>

                    <p>
                        Se desarrollan actividades
                        relacionadas con la integración
                        de componentes de software,
                        considerando la comunicación
                        entre las distintas capas
                        de una aplicación.

                        Se busca mejorar la interoperabilidad
                        y la organización funcional
                        del sistema.
                    </p>

                <% } else if (semana == 4) { %>

                    <!-- SEMANA 16 -->

                    <h3>
                        Pruebas, validación y
                        presentación del sistema
                    </h3>

                    <p>
                        Se realizan actividades de evaluación
                        y validación de los componentes
                        desarrollados, verificando su
                        funcionamiento de acuerdo con
                        los requerimientos establecidos.

                        Finalmente, se organiza la
                        documentación y presentación
                        de los resultados obtenidos.
                    </p>

                <% } %>

                <!-- DOCUMENTOS AUTOMÁTICOS -->

                <h4>Trabajos académicos</h4>

                <%
                    if (archivos != null && archivos.length > 0) {

                        for (File archivo : archivos) {

                            String nombre = archivo.getName();

                            String nombreCodificado =
                                URLEncoder.encode(
                                    nombre,
                                    StandardCharsets.UTF_8
                                ).replace("+", "%20");

                            int punto = nombre.lastIndexOf('.');

                            String extension = "";

                            if (punto >= 0) {
                                extension = nombre.substring(
                                    punto + 1
                                ).toUpperCase();
                            }

                            String urlArchivo =
                                rutaWeb + "/" + nombreCodificado;

                            String nombreSeguro = nombre
                                .replace("&", "&amp;")
                                .replace("<", "&lt;")
                                .replace(">", "&gt;")
                                .replace("\"", "&quot;")
                                .replace("'", "&#39;");
                %>

                <div class="file-card">

                    <div class="document-icon">▤</div>

                    <div class="file-content">

                        <h3><%= nombreSeguro %></h3>

                        <p>
                            Archivo académico
                            <%= extension.isEmpty()
                                ? ""
                                : " · Formato " + extension %>
                        </p>

                        <div class="file-actions">

                            <a href="<%= urlArchivo %>"
                               target="_blank"
                               rel="noopener noreferrer"
                               class="primary-button">
                                Ver archivo →
                            </a>

                            <a href="<%= urlArchivo %>"
                               download
                               class="primary-button secondary-button">
                                Descargar
                            </a>

                        </div>

                    </div>

                </div>

                <%
                        }
                    } else {
                %>

                <p class="empty-message">
                    Todavía no hay trabajos cargados
                    en esta semana.
                </p>

                <%
                    }
                %>

            </div>

        </article>

        <%
            }
        %>

    </section>

    <!-- NAVEGACIÓN -->

    <section class="content-section">

        <div class="section-heading">
            <div>
                <span class="section-label">NAVEGACIÓN</span>
                <h2>Continuar explorando</h2>
            </div>
        </div>

        <div class="documents-panel">

            <div class="document-icon">←</div>

            <div class="panel-content">

                <h3>Volver a las unidades</h3>

                <p>
                    Regresa al inicio para consultar
                    las demás unidades académicas
                    de tu portafolio.
                </p>

                <a href="<%= contexto %>/index.jsp#unidades"
                   class="primary-button">
                    ← Ver unidades
                </a>

            </div>

        </div>

    </section>

    <footer class="footer">
        <p>© 2026 Mi Portafolio Académico</p>
        <p>
            Frameworks y Estándares para la
            Implementación de Arquitecturas
        </p>
    </footer>

</main>
</div>

</body>
</html>
