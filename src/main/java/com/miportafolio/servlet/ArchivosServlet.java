package com.miportafolio.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Comparator;
import java.util.stream.Stream;

@WebServlet("/archivos")
@MultipartConfig(
        maxFileSize = 10485760,
        maxRequestSize = 52428800
)
public class ArchivosServlet extends HttpServlet {

    private Path carpetaBase;

    @Override
    public void init() throws ServletException {

        String ruta = System.getProperty("user.home")
                + "/miportafolio-archivos";

        carpetaBase = Paths.get(ruta);

        try {
            Files.createDirectories(carpetaBase);
        } catch (IOException e) {
            throw new ServletException(
                    "No se pudo crear la carpeta de archivos", e
            );
        }
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        String unidad = limpiar(request.getParameter("unidad"));
        String semana = limpiar(request.getParameter("semana"));

        if (!esValido(unidad) || !esValido(semana)) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Unidad o semana inválida"
            );
            return;
        }

        Part archivo = request.getPart("archivo");

        if (archivo == null || archivo.getSize() == 0) {
            response.sendRedirect(
                    request.getContextPath()
                            + "/unidades/unidad"
                            + unidad
                            + ".jsp?error=sinarchivo"
            );
            return;
        }

        String nombreOriginal = Paths.get(
                archivo.getSubmittedFileName()
        ).getFileName().toString();

        String nombreSeguro = nombreOriginal.replaceAll(
                "[^a-zA-Z0-9._-]", "_"
        );

        String nombreFinal = System.currentTimeMillis()
                + "_" + nombreSeguro;

        Path carpetaSemana = carpetaBase
                .resolve("unidad" + unidad)
                .resolve("semana" + semana);

        Files.createDirectories(carpetaSemana);

        Path destino = carpetaSemana.resolve(nombreFinal);

        try (InputStream entrada = archivo.getInputStream()) {

            Files.copy(
                    entrada,
                    destino,
                    StandardCopyOption.REPLACE_EXISTING
            );
        }

        response.sendRedirect(
                request.getContextPath()
                        + "/unidades/unidad"
                        + unidad
                        + ".jsp?semana="
                        + semana
                        + "&mensaje=correcto"
        );
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        String accion = limpiar(request.getParameter("accion"));
        String unidad = limpiar(request.getParameter("unidad"));
        String semana = limpiar(request.getParameter("semana"));
        String archivo = request.getParameter("archivo");

        if (!esValido(unidad) || !esValido(semana)) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Datos inválidos"
            );
            return;
        }

        Path carpetaSemana = carpetaBase
                .resolve("unidad" + unidad)
                .resolve("semana" + semana)
                .normalize();

        Files.createDirectories(carpetaSemana);

        if ("ver".equals(accion) || "descargar".equals(accion)) {

            if (archivo == null || archivo.isBlank()) {
                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Archivo no especificado"
                );
                return;
            }

            Path archivoSolicitado = carpetaSemana
                    .resolve(Paths.get(archivo).getFileName())
                    .normalize();

            if (!archivoSolicitado.startsWith(carpetaSemana)
                    || !Files.exists(archivoSolicitado)
                    || !Files.isRegularFile(archivoSolicitado)) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Archivo no encontrado"
                );
                return;
            }

            String tipo = getServletContext().getMimeType(
                    archivoSolicitado.getFileName().toString()
            );

            if (tipo == null) {
                tipo = "application/octet-stream";
            }

            response.setContentType(tipo);

            if ("descargar".equals(accion)) {
                response.setHeader(
                        "Content-Disposition",
                        "attachment; filename=\""
                                + archivoSolicitado.getFileName()
                                + "\""
                );
            } else {
                response.setHeader(
                        "Content-Disposition",
                        "inline"
                );
            }

            response.setContentLengthLong(
                    Files.size(archivoSolicitado)
            );

            try (
                    InputStream entrada =
                            Files.newInputStream(archivoSolicitado);

                    OutputStream salida =
                            response.getOutputStream()
            ) {

                entrada.transferTo(salida);
            }

            return;
        }

        response.setContentType("text/html; charset=UTF-8");

        try (Stream<Path> archivos = Files.list(carpetaSemana)) {

            archivos
                    .filter(Files::isRegularFile)
                    .sorted(Comparator.comparing(
                            path -> path.getFileName().toString()
                    ))
                    .forEach(path -> {

                        String nombre = path.getFileName().toString();

                        try {
                            response.getWriter().println(
                                    "<div class='archivo-item'>"
                                    + "<span>📄 "
                                    + escapeHtml(nombre)
                                    + "</span>"
                                    + "<div class='archivo-acciones'>"
                                    + "<a target='_blank' href='"
                                    + request.getContextPath()
                                    + "/archivos?accion=ver"
                                    + "&unidad=" + unidad
                                    + "&semana=" + semana
                                    + "&archivo="
                                    + java.net.URLEncoder.encode(
                                            nombre,
                                            java.nio.charset.StandardCharsets.UTF_8
                                    )
                                    + "'>👁️ Ver</a>"
                                    + "<a href='"
                                    + request.getContextPath()
                                    + "/archivos?accion=descargar"
                                    + "&unidad=" + unidad
                                    + "&semana=" + semana
                                    + "&archivo="
                                    + java.net.URLEncoder.encode(
                                            nombre,
                                            java.nio.charset.StandardCharsets.UTF_8
                                    )
                                    + "'>⬇️ Descargar</a>"
                                    + "</div>"
                                    + "</div>"
                            );

                        } catch (IOException e) {
                            throw new RuntimeException(e);
                        }
                    });
        }
    }

    private String limpiar(String valor) {

        if (valor == null) {
            return "";
        }

        return valor.trim();
    }

    private boolean esValido(String valor) {

        return valor.matches("[1-4]")
                || valor.matches("0?[1-9]|1[0-6]");
    }

    private String escapeHtml(String texto) {

        return texto
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
}