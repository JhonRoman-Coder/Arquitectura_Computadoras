
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<section class="week-detail">

    <div class="week-header">
        <div>
            <span class="section-label">
                SEMANA <%= request.getAttribute("numeroSemana") %>
            </span>

            <h2>
                <%= request.getAttribute("tituloSemana") %>
            </h2>

            <p>
                Sube los documentos y trabajos correspondientes
                a esta semana académica.
            </p>
        </div>
    </div>

    <div class="upload-box">

        <h3>📤 Subir archivo</h3>

        <form
            action="<%= request.getContextPath() %>/archivos"
            method="post"
            enctype="multipart/form-data"
        >

            <input
                type="hidden"
                name="unidad"
                value="<%= request.getAttribute("numeroUnidad") %>"
            >

            <input
                type="hidden"
                name="semana"
                value="<%= request.getAttribute("numeroSemana") %>"
            >

            <label>Seleccionar archivo</label>

            <input
                type="file"
                name="archivo"
                required
            >

            <button type="submit" class="btn-primary">
                📤 Subir archivo
            </button>

        </form>

        <small>
            Tamaño máximo por archivo: 10 MB.
        </small>

    </div>

    <div class="files-box">

        <h3>📁 Archivos de la semana</h3>

        <jsp:include page="/archivos">
            <jsp:param
                name="unidad"
                value="<%= request.getAttribute("numeroUnidad") %>"
            />

            <jsp:param
                name="semana"
                value="<%= request.getAttribute("numeroSemana") %>"
            />
        </jsp:include>

    </div>

</section>