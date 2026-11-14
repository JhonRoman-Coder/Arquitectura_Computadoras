
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Path" %>

<%!
    // Obtener el número de una carpeta: semana1, semana2, etc.
    private int obtenerNumeroSemana(File carpeta) {
        String nombre = carpeta.getName();

        try {
            return Integer.parseInt(
                nombre.replaceFirst("(?i)^semana", "")
            );
        } catch (Exception e) {
            return Integer.MAX_VALUE;
        }
    }

    // Escapar nombres para mostrarlos correctamente en HTML.
    private String escaparHTML(String texto) {
        if (texto == null) return "";

        return texto
            .replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;")
            .replace("'", "&#39;");
    }

    // Detectar el tipo MIME según la extensión.
    private String obtenerMime(String extension, File archivo) {
        String ext = extension.toLowerCase();

        switch (ext) {
            case "pdf": return "application/pdf";

            case "jpg":
            case "jpeg": return "image/jpeg";

            case "png": return "image/png";
            case "gif": return "image/gif";
            case "webp": return "image/webp";
            case "svg": return "image/svg+xml";

            case "txt": return "text/plain";
            case "csv": return "text/csv";
            case "json": return "application/json";
            case "xml": return "application/xml";

            case "mp4": return "video/mp4";
            case "webm": return "video/webm";
            case "mp3": return "audio/mpeg";
            case "wav": return "audio/wav";
            case "ogg": return "audio/ogg";

            case "doc": return "application/msword";
            case "docx": return "application/vnd.openxmlformats-officedocument.wordprocessingml.document";

            case "xls": return "application/vnd.ms-excel";
            case "xlsx": return "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

            case "ppt": return "application/vnd.ms-powerpoint";
            case "pptx": return "application/vnd.openxmlformats-officedocument.presentationml.presentation";

            case "zip": return "application/zip";
            case "rar": return "application/vnd.rar";

            default:
                try {
                    String mime = Files.probeContentType(archivo.toPath());
                    return mime != null ? mime : "application/octet-stream";
                } catch (Exception e) {
                    return "application/octet-stream";
                }
        }
    }

    // Determinar si el navegador puede mostrar el archivo.
    private boolean admiteVistaPrevia(String extension) {
        return extension.matches(
            "(?i)pdf|png|jpg|jpeg|gif|webp|svg|bmp|txt|csv|json|xml|mp4|webm|mp3|wav|ogg|m4a"
        );
    }
%>

<%
    String contexto = request.getContextPath();

    // Carpeta principal de la Unidad III.
    String rutaBase = "/assets/documentos/unidad3";

    String rutaFisica = application.getRealPath(rutaBase);

    File carpetaBase = rutaFisica != null
        ? new File(rutaFisica)
        : null;

    // Detectar automáticamente las carpetas semana1, semana2...
    File[] semanas = null;

    if (carpetaBase != null && carpetaBase.isDirectory()) {
        semanas = carpetaBase.listFiles(
            carpeta -> carpeta.isDirectory()
                && carpeta.getName().matches("(?i)semana\\d+")
        );
    }

    if (semanas != null) {
        Arrays.sort(
            semanas,
            Comparator.comparingInt(
                carpeta -> obtenerNumeroSemana(carpeta)
            )
        );
    }

    int cantidadSemanas = semanas != null ? semanas.length : 0;

    // La Unidad III comienza en la Semana 09.
    int semanaInicial = 9;
%>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Unidad III | Mi Portafolio Académico</title>

    <link rel="stylesheet"
          href="<%= contexto %>/css/estilos.css">

    <style>

        /* =========================================
           BASE
        ========================================= */

        .unit-page {
            background: #08111f !important;
            color: #f8fafc !important;
            min-height: 100vh;
        }

        .unit-page .sidebar,
        .unit-page .menu-toggle {
            display: none !important;
        }

        .unit-page .app-container {
            min-height: 100vh;
            background: #08111f;
        }

        .unit-page .main-content {
            margin-left: 0 !important;
            width: 100% !important;
            max-width: 100% !important;
            min-height: 100vh;
            padding: 0 30px;
            box-sizing: border-box;
            background: #08111f;
            color: #f8fafc;
        }

        /* =========================================
           BARRA SUPERIOR
        ========================================= */

        .unit-page .topbar {
            width: 100%;
            box-sizing: border-box;
            background: #0d1b2a !important;
            border-bottom: 1px solid rgba(255,255,255,.08);
            color: #fff !important;
        }

        .unit-page .topbar h1 {
            color: #fff !important;
        }

        .unit-page .topbar-subtitle,
        .unit-page .section-label {
            color: #60a5fa !important;
        }

        .unit-page .profile-badge {
            background: #2563eb !important;
            color: #fff !important;
        }

        /* =========================================
           PRESENTACIÓN
        ========================================= */

        .unit-page .welcome-section {
            background: linear-gradient(
                135deg, #0d1b2a, #10243b
            ) !important;

            border: 1px solid rgba(96,165,250,.15);
            border-radius: 20px;
            color: #fff !important;
        }

        .unit-page .welcome-content h2 {
            color: #fff !important;
        }

        .unit-page .welcome-content h2 span {
            color: #60a5fa !important;
        }

        .unit-page .welcome-content p {
            color: #cbd5e1 !important;
        }

        .unit-page .tag {
            color: #60a5fa !important;
            background: rgba(37,99,235,.12);
            border: 1px solid rgba(96,165,250,.2);
        }

        .unit-page .graphic-circle {
            background: linear-gradient(
                135deg, #2563eb, #1e40af
            ) !important;

            border: 5px solid rgba(96,165,250,.18);
            color: #fff !important;
        }

        /* =========================================
           BOTONES
        ========================================= */

        .unit-page .primary-button {
            display: inline-block;
            padding: 11px 17px;
            margin: 5px 5px 5px 0;
            border-radius: 9px;
            background: #2563eb !important;
            border: 1px solid #3b82f6 !important;
            color: #fff !important;
            text-decoration: none !important;
            cursor: pointer;
            font-size: .88rem;
            transition: .2s;
        }

        .unit-page .primary-button:hover {
            background: #1d4ed8 !important;
            transform: translateY(-2px);
        }

        .unit-page .secondary-button {
            background: transparent !important;
            color: #93c5fd !important;
        }

        /* =========================================
           ESTADÍSTICAS
        ========================================= */

        .unit-page .stats-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin: 35px 0;
        }

        .unit-page .stat-card {
            background: #0d1b2a !important;
            border: 1px solid rgba(255,255,255,.07) !important;
            color: #fff !important;
        }

        .unit-page .stat-card h3 {
            color: #fff !important;
        }

        .unit-page .stat-card p {
            color: #94a3b8 !important;
        }

        .unit-page .stat-icon {
            color: #60a5fa !important;
        }

        /* =========================================
           SECCIONES
        ========================================= */

        .unit-page .content-section {
            width: 100%;
            color: #f8fafc;
        }

        .unit-page .section-heading h2 {
            color: #fff !important;
        }

        .unit-page .section-counter {
            background: #0d1b2a !important;
            color: #cbd5e1 !important;
            border: 1px solid rgba(255,255,255,.08);
            padding: 9px 15px;
            border-radius: 20px;
        }

        /* =========================================
           TARJETAS DE SEMANAS
        ========================================= */

        .unit-page .week-card {
            display: flex;
            gap: 22px;
            padding: 27px;
            margin-bottom: 20px;
            border-radius: 18px;
            background: #0d1b2a !important;
            border: 1px solid rgba(255,255,255,.07);
            box-sizing: border-box;
            transition: .2s;
        }

        .unit-page .week-card:hover {
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
            ) !important;
            color: #fff !important;
            font-weight: bold;
            font-size: 1.1rem;
        }

        .unit-page .week-content {
            flex: 1;
            min-width: 0;
        }

        .unit-page .week-content h3 {
            color: #fff !important;
            margin: 10px 0;
            overflow-wrap: anywhere;
        }

        .unit-page .week-content h4 {
            color: #60a5fa !important;
            margin: 25px 0 15px;
        }

        .unit-page .week-content p {
            color: #cbd5e1 !important;
            line-height: 1.7;
        }

        /* =========================================
           ARCHIVOS
        ========================================= */

        .unit-page .file-card {
            display: flex;
            align-items: flex-start;
            gap: 15px;
            padding: 17px;
            margin: 12px 0;
            border-radius: 13px;
            background: #101f31 !important;
            border: 1px solid rgba(96,165,250,.12);
        }

        .unit-page .file-card:hover {
            background: #13263d !important;
            border-color: rgba(96,165,250,.3);
        }

        .unit-page .file-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            min-width: 48px;
            height: 48px;
            padding: 0 5px;
            box-sizing: border-box;
            border-radius: 10px;
            background: rgba(37,99,235,.18);
            color: #93c5fd;
            font-size: .7rem;
            font-weight: bold;
            overflow: hidden;
        }

        .unit-page .file-info {
            flex: 1;
            min-width: 0;
        }

        .unit-page .file-info h3 {
            font-size: 1rem;
            margin: 0 0 8px;
            color: #f8fafc !important;
            overflow-wrap: anywhere;
            word-break: break-word;
        }

        .unit-page .file-info p {
            font-size: .82rem;
            color: #94a3b8 !important;
            margin: 0;
            overflow-wrap: anywhere;
        }

        .unit-page .file-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 7px;
            margin-top: 12px;
        }

        .unit-page .empty-message {
            padding: 18px;
            border: 1px dashed rgba(96,165,250,.3);
            border-radius: 12px;
            background: #101f31;
            color: #94a3b8 !important;
        }

        /* =========================================
           VISOR DE DOCUMENTOS
        ========================================= */

        .preview-modal {
            display: none;
            position: fixed;
            inset: 0;
            z-index: 9999;
            padding: 20px;
            background: rgba(0,0,0,.85);
            box-sizing: border-box;
        }

        .preview-modal.active {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .preview-window {
            display: flex;
            flex-direction: column;
            width: 100%;
            max-width: 1100px;
            height: 90vh;
            overflow: hidden;
            border-radius: 15px;
            background: #0d1b2a;
            border: 1px solid rgba(96,165,250,.25);
        }

        .preview-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            padding: 15px 20px;
            color: white;
            border-bottom: 1px solid rgba(255,255,255,.1);
        }

        .preview-header strong {
            overflow-wrap: anywhere;
        }

        .preview-close {
            padding: 9px 15px;
            background: #2563eb;
            border: 0;
            border-radius: 8px;
            color: white;
            cursor: pointer;
        }

        .preview-frame {
            width: 100%;
            flex: 1;
            border: 0;
            background: white;
        }

        /* =========================================
           FOOTER
        ========================================= */

        .unit-page .footer {
            background: #08111f !important;
            color: #94a3b8 !important;
            border-top: 1px solid rgba(255,255,255,.06);
        }

        /* =========================================
           RESPONSIVE
        ========================================= */

        @media(max-width: 900px) {
            .unit-page .stats-grid {
                grid-template-columns: repeat(2,1fr);
            }
        }

        @media(max-width: 600px) {

            .unit-page .main-content {
                padding: 0 12px;
            }

            .unit-page .topbar h1 {
                font-size: 1.2rem;
            }

            .unit-page .profile-badge {
                display: none;
            }

            .unit-page .welcome-section {
                padding: 20px;
            }

            .unit-page .welcome-content h2 {
                font-size: 1.65rem;
            }

            .unit-page .welcome-graphic {
                display: none;
            }

            .unit-page .stats-grid {
                grid-template-columns: 1fr;
                gap: 12px;
            }

            .unit-page .week-card {
                padding: 17px;
                gap: 12px;
            }

            .unit-page .week-card > .document-icon {
                width: 42px;
                height: 42px;
                font-size: .9rem;
            }

            .unit-page .file-card {
                padding: 12px;
            }

            .unit-page .file-icon {
                display: none;
            }

            .unit-page .file-actions {
                flex-direction: column;
            }

            .unit-page .file-actions .primary-button {
                width: 100%;
                box-sizing: border-box;
                text-align: center;
            }
        }

    </style>

</head>

<body class="unit-page">

<div class="app-container">

    <main class="main-content">

        <!-- =====================================
             BARRA SUPERIOR
        ====================================== -->

        <header class="topbar">

            <div>
                <p class="topbar-subtitle">
                    PORTAFOLIO ACADÉMICO
                </p>

                <h1>
                    Comunicación e Integración de Arquitecturas de Software
                </h1>
            </div>

            <div class="profile-badge">
                JS
            </div>

        </header>

        <!-- =====================================
             PRESENTACIÓN
        ====================================== -->

        <section class="welcome-section">

            <div class="welcome-content">

                <span class="tag">
                    UNIDAD III
                </span>

                <h2>
                    Desarrollo de Interfaces con
                    <span>React JS</span>
                </h2>

                <p>
                    En esta unidad se desarrolla el primer
                    requerimiento funcional del proyecto
                    Pequeños Exploradores LMS, utilizando
                    React JS para implementar la ventana
                    de ingreso o Login.
                </p>

                <a href="#semanas" class="primary-button">
                    Explorar semanas →
                </a>

            </div>

            <div class="welcome-graphic">
                <div class="graphic-circle">
                    <span>03</span>
                    <strong>REACT</strong>
                </div>
            </div>

        </section>

        <!-- =====================================
             ESTADÍSTICAS DINÁMICAS
        ====================================== -->

        <section class="stats-grid">

            <div class="stat-card">

                <div class="stat-icon">▦</div>

                <div>
                    <h3><%= String.format("%02d", cantidadSemanas) %></h3>
                    <p>Semanas registradas</p>
                </div>

            </div>

            <div class="stat-card">

                <div class="stat-icon">▤</div>

                <div>
                    <h3>III</h3>
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

        <!-- =====================================
             CONTENIDO DE LAS SEMANAS
        ====================================== -->

        <section class="content-section" id="semanas">

            <div class="section-heading">

                <div>
                    <span class="section-label">
                        CONTENIDO DE LA UNIDAD
                    </span>

                    <h2>Unidad III</h2>
                </div>

                <span class="section-counter">
                    <%= cantidadSemanas %> semanas
                </span>

            </div>

            <%

                if (semanas != null && semanas.length > 0) {

                    for (File carpetaSemana : semanas) {

                        int numeroCarpeta =
                            obtenerNumeroSemana(carpetaSemana);

                        int numeroReal =
                            semanaInicial + numeroCarpeta - 1;

                        String nombreSemana =
                            String.format("%02d", numeroReal);

                        File[] archivos =
                            carpetaSemana.listFiles(
                                archivo -> archivo.isFile()
                            );

                        if (archivos != null) {

                            Arrays.sort(
                                archivos,
                                Comparator.comparing(
                                    File::getName,
                                    String.CASE_INSENSITIVE_ORDER
                                )
                            );
                        }

            %>

            <!-- =================================
                 TARJETA AUTOMÁTICA DE SEMANA
            ================================== -->

            <article class="week-card">

                <div class="document-icon">
                    <%= String.format("%02d", numeroCarpeta) %>
                </div>

                <div class="week-content">

                    <span class="section-label">
                        SEMANA <%= nombreSemana %>
                    </span>

                    <h3>
                        Material académico de la Semana
                        <%= nombreSemana %>
                    </h3>

                    <p>
                        En esta sección se encuentran
                        los documentos, actividades,
                        trabajos y materiales correspondientes
                        a la Semana <%= nombreSemana %>
                        de la Unidad III.
                    </p>

                    <h4>Trabajos académicos</h4>

                    <%

                        if (archivos != null && archivos.length > 0) {

                            for (File archivo : archivos) {

                                String nombre = archivo.getName();

                                int punto = nombre.lastIndexOf('.');

                                String extension = punto >= 0
                                    ? nombre.substring(punto + 1).toLowerCase()
                                    : "";

                                String nombreCodificado =
                                    URLEncoder.encode(
                                        nombre,
                                        StandardCharsets.UTF_8.name()
                                    ).replace("+", "%20");

                                String rutaArchivo =
                                    contexto + rutaBase + "/" +
                                    carpetaSemana.getName() + "/" +
                                    nombreCodificado;

                                String nombreSeguro =
                                    escaparHTML(nombre);

                                String mime =
                                    obtenerMime(extension, archivo);

                                boolean tieneVista =
                                    admiteVistaPrevia(extension);

                    %>

                    <!-- ARCHIVO DETECTADO AUTOMÁTICAMENTE -->

                    <div class="file-card">

                        <div class="file-icon">
                            <%= extension.isEmpty()
                                ? "FILE"
                                : escaparHTML(extension.toUpperCase()) %>
                        </div>

                        <div class="file-info">

                            <h3>
                                <%= nombreSeguro %>
                            </h3>

                            <p>
                                Semana <%= nombreSemana %>
                                · Formato <%= extension.toUpperCase() %>
                                · <%= mime %>
                            </p>

                            <div class="file-actions">

                                <% if (tieneVista) { %>

                                    <button
                                        type="button"
                                        class="primary-button"
                                        data-url="<%= escaparHTML(rutaArchivo) %>"
                                        data-nombre="<%= nombreSeguro %>"
                                        onclick="abrirVisor(
                                            this.dataset.url,
                                            this.dataset.nombre
                                        )">

                                        Ver archivo →

                                    </button>

                                <% } %>

                                <a
                                    href="<%= escaparHTML(rutaArchivo) %>"
                                    download="<%= nombreSeguro %>"
                                    class="primary-button secondary-button">

                                    Descargar

                                </a>

                            </div>

                            <% if (!tieneVista) { %>

                                <p>
                                    Este formato se encuentra disponible
                                    para descarga. Para visualizarlo
                                    necesitarás una aplicación compatible.
                                </p>

                            <% } %>

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

                } else {

            %>

                <div class="week-card">

                    <div class="week-content">

                        <h3>No se encontraron semanas</h3>

                        <p>
                            No se encontraron carpetas de semanas
                            dentro de la carpeta de la Unidad III.
                            Verifica que existan las carpetas
                            semana1, semana2, semana3, etc.
                        </p>

                    </div>

                </div>

            <%

                }

            %>

        </section>

        <!-- =====================================
             VOLVER A LAS UNIDADES
        ====================================== -->

        <section class="content-section">

            <div class="section-heading">

                <div>
                    <span class="section-label">
                        NAVEGACIÓN
                    </span>

                    <h2>Continuar explorando</h2>
                </div>

            </div>

            <div class="week-card">

                <div class="document-icon">
                    ←
                </div>

                <div class="week-content">

                    <h3>Volver a las unidades</h3>

                    <p>
                        Regresa al inicio para consultar
                        las demás unidades académicas.
                    </p>

                    <a
                        href="<%= contexto %>/index.jsp#unidades"
                        class="primary-button">

                        ← Ver unidades

                    </a>

                </div>

            </div>

        </section>

        <!-- =====================================
             FOOTER
        ====================================== -->

        <footer class="footer">

            <p>© 2026 Mi Portafolio Académico</p>

            <p>
                Comunicación e Integración de
                Arquitecturas de Software
            </p>

        </footer>

    </main>

</div>

<!-- =========================================
     VISOR DE ARCHIVOS
========================================= -->

<div
    id="previewModal"
    class="preview-modal"
    role="dialog"
    aria-modal="true"
    aria-label="Vista previa del documento"
    onclick="cerrarVisorFondo(event)">

    <div class="preview-window">

        <div class="preview-header">

            <strong id="previewTitle">
                Vista previa
            </strong>

            <button
                type="button"
                class="preview-close"
                onclick="cerrarVisor()">

                Cerrar ✕

            </button>

        </div>

        <iframe
            id="previewFrame"
            class="preview-frame"
            title="Vista previa del archivo">
        </iframe>

    </div>

</div>

<script>

    function abrirVisor(url, nombre) {

        const modal =
            document.getElementById('previewModal');

        const frame =
            document.getElementById('previewFrame');

        const titulo =
            document.getElementById('previewTitle');

        titulo.textContent = nombre;

        frame.src = url;

        modal.classList.add('active');

        document.body.style.overflow = 'hidden';
    }

    function cerrarVisor() {

        const modal =
            document.getElementById('previewModal');

        const frame =
            document.getElementById('previewFrame');

        modal.classList.remove('active');

        frame.src = 'about:blank';

        document.body.style.overflow = '';
    }

    function cerrarVisorFondo(event) {

        if (event.target.id === 'previewModal') {
            cerrarVisor();
        }
    }

    document.addEventListener('keydown', function(event) {

        if (event.key === 'Escape') {
            cerrarVisor();
        }

    });

</script>

</body>
</html>
