
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Path" %>

<%
    String contexto = request.getContextPath();

    // SEMANA 09: carpeta semana3 dentro de unidad3
    String rutaRelativa = "/assets/documentos/unidad3/semana3";
    String rutaFisica = application.getRealPath(rutaRelativa);

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
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Unidad III | Mi Portafolio Académico</title>

    <style>
        * {
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            margin: 0;
            background: #08111f;
            color: #f8fafc;
            font-family: Arial, sans-serif;
        }

        .main-content {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 25px;
        }

        .topbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            padding: 30px 0;
            border-bottom: 1px solid rgba(255,255,255,.08);
        }

        .topbar-subtitle {
            color: #60a5fa;
            font-size: .8rem;
            font-weight: bold;
            letter-spacing: 2px;
        }

        .topbar h1 {
            margin: 10px 0 0;
            font-size: 1.7rem;
            color: #ffffff;
        }

        .profile-badge {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 48px;
            height: 48px;
            flex-shrink: 0;
            border-radius: 50%;
            background: #2563eb;
            font-weight: bold;
        }

        .welcome-section {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 30px;
            margin: 35px 0;
            padding: 45px;
            border-radius: 20px;
            border: 1px solid rgba(96,165,250,.15);
            background: linear-gradient(
                135deg, #0d1b2a, #10243b
            );
        }

        .welcome-content {
            flex: 1;
        }

        .tag {
            display: inline-block;
            padding: 8px 15px;
            border-radius: 30px;
            background: rgba(37,99,235,.15);
            color: #60a5fa;
            font-size: .8rem;
            font-weight: bold;
        }

        .welcome-content h2 {
            margin: 20px 0;
            font-size: clamp(1.8rem, 4vw, 2.8rem);
        }

        .welcome-content h2 span {
            color: #60a5fa;
        }

        .welcome-content p {
            max-width: 700px;
            color: #cbd5e1;
            line-height: 1.8;
        }

        .graphic-circle {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 180px;
            height: 180px;
            flex-shrink: 0;
            border-radius: 50%;
            border: 5px solid rgba(96,165,250,.2);
            background: linear-gradient(
                135deg, #2563eb, #1e40af
            );
            box-shadow: 0 20px 50px rgba(0,0,0,.35);
        }

        .graphic-circle span {
            font-size: 3.5rem;
            font-weight: bold;
        }

        .graphic-circle strong {
            letter-spacing: 2px;
        }

        .primary-button {
            display: inline-block;
            padding: 12px 20px;
            border-radius: 10px;
            background: #2563eb;
            border: 1px solid #3b82f6;
            color: #ffffff;
            text-decoration: none;
            font-size: .9rem;
            font-weight: bold;
            transition: .2s;
            cursor: pointer;
        }

        .primary-button:hover {
            background: #1d4ed8;
            transform: translateY(-2px);
        }

        .secondary-button {
            background: transparent;
            color: #93c5fd;
            border-color: rgba(96,165,250,.4);
        }

        .secondary-button:hover {
            background: rgba(37,99,235,.15);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 45px;
        }

        .stat-card {
            display: flex;
            align-items: center;
            gap: 20px;
            padding: 25px;
            border-radius: 16px;
            background: #0d1b2a;
            border: 1px solid rgba(255,255,255,.07);
        }

        .stat-icon {
            font-size: 2rem;
            color: #60a5fa;
        }

        .stat-card h3 {
            margin: 0 0 5px;
            font-size: 1.8rem;
        }

        .stat-card p {
            margin: 0;
            color: #94a3b8;
            font-size: .9rem;
        }

        .section-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            margin-bottom: 25px;
        }

        .section-label {
            color: #60a5fa;
            font-size: .8rem;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .section-heading h2 {
            margin: 8px 0;
            font-size: 2rem;
        }

        .section-counter {
            padding: 9px 15px;
            border-radius: 20px;
            background: #0d1b2a;
            color: #cbd5e1;
        }

        .documents-panel {
            display: flex;
            align-items: flex-start;
            gap: 22px;
            margin-bottom: 25px;
            padding: 30px;
            border-radius: 18px;
            background: #0d1b2a;
            border: 1px solid rgba(255,255,255,.07);
        }

        .document-icon {
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
            font-weight: bold;
        }

        .panel-content {
            flex: 1;
            min-width: 0;
        }

        .panel-content h3 {
            margin: 12px 0;
            color: #ffffff;
            font-size: 1.4rem;
        }

        .panel-content h4 {
            margin: 30px 0 15px;
            color: #60a5fa;
        }

        .panel-content p {
            color: #cbd5e1;
            line-height: 1.8;
        }

        .file-card {
            display: flex;
            gap: 15px;
            align-items: flex-start;
            padding: 20px;
            margin-bottom: 12px;
            border-radius: 14px;
            background: #101f31;
            border: 1px solid rgba(96,165,250,.12);
        }

        .file-content {
            flex: 1;
            min-width: 0;
        }

        .file-content h3 {
            margin: 0 0 8px;
            font-size: 1rem;
            overflow-wrap: anywhere;
        }

        .file-content p {
            margin: 0;
            font-size: .85rem;
            color: #94a3b8;
        }

        .file-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 15px;
        }

        .empty-message {
            padding: 20px;
            border-radius: 12px;
            background: #101f31;
            color: #94a3b8;
            border: 1px dashed rgba(96,165,250,.3);
        }

        .footer {
            margin-top: 50px;
            padding: 30px 0;
            border-top: 1px solid rgba(255,255,255,.07);
            text-align: center;
            color: #94a3b8;
            font-size: .9rem;
        }

        .file-type-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 48px;
            height: 48px;
            padding: 0 8px;
            flex-shrink: 0;
            border-radius: 12px;
            background: rgba(37,99,235,.18);
            color: #93c5fd;
            font-size: .72rem;
            font-weight: bold;
        }

        /* VISOR DE ARCHIVOS */

        .preview-modal {
            display: none;
            position: fixed;
            inset: 0;
            z-index: 1000;
            padding: 24px;
            background: rgba(0,0,0,.82);
        }

        .preview-modal.active {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .preview-window {
            display: flex;
            flex-direction: column;
            width: min(1100px, 100%);
            height: min(850px, 92vh);
            overflow: hidden;
            border: 1px solid rgba(96,165,250,.25);
            border-radius: 16px;
            background: #0d1b2a;
        }

        .preview-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            padding: 15px 20px;
            color: #fff;
            border-bottom: 1px solid rgba(255,255,255,.1);
        }

        .preview-header strong {
            overflow-wrap: anywhere;
        }

        .preview-close {
            padding: 8px 13px;
            border: 0;
            border-radius: 8px;
            background: #2563eb;
            color: white;
            cursor: pointer;
        }

        .preview-frame {
            width: 100%;
            height: 100%;
            flex: 1;
            border: 0;
            background: #fff;
        }

        .preview-note {
            margin-top: 12px;
            color: #94a3b8;
            font-size: .82rem;
            line-height: 1.5;
        }

        @media (max-width: 800px) {
            .welcome-section {
                padding: 30px;
            }

            .graphic-circle {
                display: none;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 600px) {
            .main-content {
                padding: 0 15px;
            }

            .topbar h1 {
                font-size: 1.2rem;
            }

            .welcome-section {
                padding: 25px;
            }

            .documents-panel {
                padding: 20px;
                gap: 12px;
            }

            .documents-panel > .document-icon {
                display: none;
            }

            .file-card {
                flex-direction: column;
            }

            .section-heading {
                align-items: flex-start;
                flex-direction: column;
            }

            .file-actions .primary-button {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>

<body>

<main class="main-content">

    <!-- ENCABEZADO -->

    <header class="topbar">

        <div>
            <p class="topbar-subtitle">
                PORTAFOLIO ACADÉMICO
            </p>

            <h1>
                Comunicación e Integración de
                Arquitecturas de Software
            </h1>
        </div>

        <div class="profile-badge">JS</div>

    </header>

    <!-- PRESENTACIÓN DE LA UNIDAD -->

    <section class="welcome-section">

        <div class="welcome-content">

            <span class="tag">UNIDAD III</span>

            <h2>
                Desarrollo de Interfaces con
                <span>React JS</span>
            </h2>

            <p>
                En esta unidad se presenta el desarrollo
                del primer requerimiento funcional del
                proyecto Pequeños Exploradores LMS,
                correspondiente a la ventana de ingreso
                o Login utilizando React JS.
            </p>

            <a href="#semanas" class="primary-button">
                Explorar semana →
            </a>

        </div>

        <div class="graphic-circle">
            <span>03</span>
            <strong>DEV</strong>
        </div>

    </section>

    <!-- ESTADÍSTICAS -->

    <section class="stats-grid">

        <div class="stat-card">
            <div class="stat-icon">▦</div>
            <div>
                <h3>01</h3>
                <p>Semana académica</p>
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
                <h3>React</h3>
                <p>Desarrollo de Login</p>
            </div>
        </div>

    </section>

    <!-- SEMANA 09 -->

    <section id="semanas">

        <div class="section-heading">

            <div>
                <span class="section-label">
                    CONTENIDO DE LA UNIDAD
                </span>

                <h2>Unidad III</h2>
            </div>

            <span class="section-counter">
                01 semana
            </span>

        </div>

        <article class="documents-panel">

            <div class="document-icon">09</div>

            <div class="panel-content">

                <span class="section-label">
                    SEMANA 09
                </span>

                <h3>
                    Codificación del primer requerimiento
                    en React JS: ventana de ingreso (Login)
                </h3>

                <p>
                    Durante esta semana se desarrolló la
                    codificación del primer requerimiento
                    funcional del sistema Pequeños
                    Exploradores LMS, correspondiente
                    a la ventana de ingreso o Login.

                    Para su implementación se utilizó
                    React JS, aplicando componentes
                    reutilizables, manejo de estados
                    y validación de formularios.

                    Se implementaron campos para el
                    ingreso de credenciales, selección
                    de perfiles de usuario y presentación
                    de mensajes de validación.

                    Este desarrollo constituye una primera
                    versión funcional de la interfaz
                    de autenticación, preparada para
                    su posterior integración con
                    los servicios del sistema.
                </p>

                <!-- DOCUMENTOS DE SEMANA 09 -->

                <h4>Trabajos académicos</h4>

                <%
                    if (archivos != null && archivos.length > 0) {

                        for (File archivo : archivos) {

                            String nombre = archivo.getName();

                            String nombreCodificado =
                                URLEncoder.encode(
                                    nombre,
                                    "UTF-8"
                                ).replace("+", "%20");

                            String urlArchivo =
                                contexto + rutaRelativa + "/" +
                                nombreCodificado;

                            int punto = nombre.lastIndexOf('.');

                            String extension = punto >= 0
                                ? nombre.substring(punto + 1).toLowerCase()
                                : "";

                            String extensionMostrar = extension.isEmpty()
                                ? "ARCHIVO"
                                : extension.toUpperCase();

                            String mimeType = "application/octet-stream";

                            try {
                                Path rutaArchivo = archivo.toPath();

                                String mimeDetectado =
                                    Files.probeContentType(rutaArchivo);

                                if (mimeDetectado != null) {
                                    mimeType = mimeDetectado;
                                }

                            } catch (Exception ignored) {
                                // Se conserva el tipo genérico.
                            }

                            boolean vistaPrevia =
                                extension.matches(
                                    "pdf|png|jpg|jpeg|gif|webp|bmp|svg|txt|csv|json|xml|mp4|webm|ogg|mp3|wav|m4a"
                                );

                            String nombreSeguro = nombre
                                .replace("&", "&amp;")
                                .replace("<", "&lt;")
                                .replace(">", "&gt;")
                                .replace("\"", "&quot;")
                                .replace("'", "&#39;");
                %>

                <div class="file-card">

                    <div class="file-type-badge">
                        <%= extensionMostrar %>
                    </div>

                    <div class="file-content">

                        <h3><%= nombreSeguro %></h3>

                        <p>
                            Archivo académico ·
                            Formato <%= extensionMostrar %> ·
                            <%= mimeType %>
                        </p>

                        <div class="file-actions">

                            <% if (vistaPrevia) { %>

                                <button
                                    type="button"
                                    class="primary-button"
                                    data-url="<%= urlArchivo %>"
                                    data-nombre="<%= nombreSeguro %>"
                                    onclick="abrirVisor(this.dataset.url, this.dataset.nombre)">

                                    Ver archivo →

                                </button>

                            <% } else { %>

                                <span class="preview-note">
                                    Este formato no tiene vista previa
                                    integrada en el navegador.
                                </span>

                            <% } %>

                            <a
                                href="<%= urlArchivo %>"
                                download="<%= nombreSeguro %>"
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
                    para la Semana 09.
                </p>

                <%
                    }
                %>

            </div>

        </article>

    </section>

    <!-- VOLVER AL INICIO -->

    <section>

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

    <!-- PIE DE PÁGINA -->

    <footer class="footer">

        <p>© 2026 Mi Portafolio Académico</p>

        <p>
            Comunicación e Integración de
            Arquitecturas de Software
        </p>

    </footer>

</main>

<!-- VENTANA DEL VISOR -->

<div
    id="previewModal"
    class="preview-modal"
    role="dialog"
    aria-modal="true"
    aria-label="Vista previa del archivo"
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
            title="Vista previa del documento">
        </iframe>

    </div>

</div>

<script>

    function abrirVisor(url, nombre) {

        const modal = document.getElementById('previewModal');

        const frame = document.getElementById('previewFrame');

        document.getElementById('previewTitle').textContent = nombre;

        frame.src = url;

        modal.classList.add('active');

        document.body.style.overflow = 'hidden';
    }


    function cerrarVisor() {

        const modal = document.getElementById('previewModal');

        const frame = document.getElementById('previewFrame');

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
