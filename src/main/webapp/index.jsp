<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Arquitectura de Computadoras | Portafolio</title>

    <link rel="stylesheet" href="css/estilos.css">
</head>

<body>

<div class="app-container">

    <!-- =====================================================
         BARRA LATERAL
         ===================================================== -->

    <aside class="sidebar" id="sidebar">

        <div class="logo-container">

            <div class="logo-icon">
                AC
            </div>

            <div>
                
                <span>Portafolio académico</span>
                <h2>ROMAN ROQUE JHON SMITH</h2>
            </div>

        </div>


        <nav class="menu">

            <!-- INICIO -->
            <a href="index.jsp" class="menu-link active">
                <span>⌂</span>
                Inicio
            </a>


            <!-- UNIDADES -->
            <a href="#unidades" class="menu-link">
                <span>▦</span>
                Unidades
            </a>


            <!-- RESUMEN -->
            <a href="#resumen" class="menu-link">
                <span>▤</span>
                Resumen
            </a>


            <!-- DOCUMENTOS -->
            <a href="#documentos" class="menu-link">
                <span>▱</span>
                Documentos
            </a>

        </nav>


        <div class="sidebar-footer">

            <p>
                Ingeniería de Sistemas
            </p>

            <span>
                Periodo académico
            </span>

        </div>

    </aside>



    <!-- =====================================================
         CONTENIDO PRINCIPAL
         ===================================================== -->

    <main class="main-content">


        <!-- =================================================
             ENCABEZADO
             ================================================= -->

        <header class="topbar">

            <button class="menu-toggle" id="menuToggle">
                ☰
            </button>


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
                    BIENVENIDO A MI PORTAFOLIO
                </span>


                <h2>

                    Explora mi aprendizaje

                    <span>
                        digital
                    </span>

                </h2>


                <p>

                    Este espacio reúne mis actividades,
                    materiales, conocimientos y evidencias
                    académicas del curso Arquitectura de
                    Computadoras.

                </p>


                <a href="#unidades" class="primary-button">

                    Explorar unidades →

                </a>

            </div>



            <div class="welcome-graphic">

                <div class="graphic-circle">

                    <span>
                        01
                    </span>

                    <strong>
                        CPU
                    </strong>

                </div>

            </div>

        </section>



        <!-- =================================================
             ESTADÍSTICAS
             ================================================= -->

        <section class="stats-grid" id="resumen">


            <!-- UNIDADES -->

            <div class="stat-card">

                <div class="stat-icon">
                    ▦
                </div>

                <div>

                    <h3>
                        04
                    </h3>

                    <p>
                        Unidades académicas
                    </p>

                </div>

            </div>



            <!-- SEMANAS -->

            <div class="stat-card">

                <div class="stat-icon">
                    ▤
                </div>

                <div>

                    <h3>
                        16
                    </h3>

                    <p>
                        Semanas de aprendizaje
                    </p>

                </div>

            </div>



            <!-- ORGANIZACIÓN -->

            <div class="stat-card">

                <div class="stat-icon">
                    ✓
                </div>

                <div>

                    <h3>
                        100%
                    </h3>

                    <p>
                        Espacio organizado
                    </p>

                </div>

            </div>


        </section>



        <!-- =================================================
             UNIDADES ACADÉMICAS
             ================================================= -->

        <section class="content-section" id="unidades">


            <div class="section-heading">

                <div>

                    <span class="section-label">
                        CONTENIDO DEL CURSO
                    </span>

                    <h2>
                        Unidades académicas
                    </h2>

                </div>


                <span class="section-counter">
                    04 unidades
                </span>

            </div>



            <div class="units-grid">


                <!-- =================================================
                     UNIDAD I
                     ================================================= -->

                <a href="unidades/unidad1.jsp"
                   class="unit-card">


                    <div class="unit-card-header">

                        <span class="unit-number">
                            01
                        </span>

                        <span class="unit-arrow">
                            ↗
                        </span>

                    </div>


                    <div class="unit-card-icon">
                        ▣
                    </div>


                    <h3>
                        Unidad I
                    </h3>


                    <p>

                        Fundamentos de la arquitectura
                        de computadoras.

                    </p>


                    <div class="unit-card-footer">

                        <span>
                            Introducción
                        </span>

                        <span>
                            →
                        </span>

                    </div>

                </a>



                <!-- =================================================
                     UNIDAD II
                     ================================================= -->

                <a href="unidades/unidad2.jsp"
                   class="unit-card">


                    <div class="unit-card-header">

                        <span class="unit-number">
                            02
                        </span>

                        <span class="unit-arrow">
                            ↗
                        </span>

                    </div>


                    <div class="unit-card-icon">
                        ▤
                    </div>


                    <h3>
                        Unidad II
                    </h3>


                    <p>

                        Procesadores, memoria y
                        componentes internos.

                    </p>


                    <div class="unit-card-footer">

                        <span>
                            Hardware
                        </span>

                        <span>
                            →
                        </span>

                    </div>

                </a>



                <!-- =================================================
                     UNIDAD III
                     ================================================= -->

                <a href="unidades/unidad3.jsp"
                   class="unit-card">


                    <div class="unit-card-header">

                        <span class="unit-number">
                            03
                        </span>

                        <span class="unit-arrow">
                            ↗
                        </span>

                    </div>


                    <div class="unit-card-icon">
                        ▥
                    </div>


                    <h3>
                        Unidad III
                    </h3>


                    <p>

                        Sistemas de almacenamiento
                        y dispositivos de entrada.

                    </p>


                    <div class="unit-card-footer">

                        <span>
                            Almacenamiento
                        </span>

                        <span>
                            →
                        </span>

                    </div>

                </a>



                <!-- =================================================
                     UNIDAD IV
                     ================================================= -->

                <a href="unidades/unidad4.jsp"
                   class="unit-card">


                    <div class="unit-card-header">

                        <span class="unit-number">
                            04
                        </span>

                        <span class="unit-arrow">
                            ↗
                        </span>

                    </div>


                    <div class="unit-card-icon">
                        ▧
                    </div>


                    <h3>
                        Unidad IV
                    </h3>


                    <p>

                        Rendimiento, tecnología y
                        tendencias actuales.

                    </p>


                    <div class="unit-card-footer">

                        <span>
                            Innovación
                        </span>

                        <span>
                            →
                        </span>

                    </div>

                </a>


            </div>

        </section>



        <!-- =================================================
             DOCUMENTOS
             ================================================= -->

        <section class="content-section" id="documentos">


            <div class="section-heading">

                <div>

                    <span class="section-label">
                        MATERIALES
                    </span>

                    <h2>
                        Documentos académicos
                    </h2>

                </div>

            </div>



            <div class="documents-panel">


                <div class="document-icon">
                    ▱
                </div>


                <div>

                    <h3>
                        Materiales del curso
                    </h3>

                    <p>

                        Aquí podrás organizar tus PDFs,
                        tareas, prácticas, infografías,
                        informes y evidencias académicas.

                    </p>

                </div>


                <span class="document-status">

                    Organizado por unidades

                </span>


            </div>


        </section>



        <!-- =================================================
             PIE DE PÁGINA
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



<!-- =====================================================
     JAVASCRIPT
     ===================================================== -->

<script src="js/main.js"></script>

</body>

</html>