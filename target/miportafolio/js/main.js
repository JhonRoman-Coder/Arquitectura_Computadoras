
// Menú lateral para dispositivos móviles

const menuToggle = document.getElementById("menuToggle");
const sidebar = document.getElementById("sidebar");

if (menuToggle && sidebar) {

    menuToggle.addEventListener("click", () => {
        sidebar.classList.toggle("open");
    });

}

// Cerrar el menú al seleccionar un enlace en móviles

const menuLinks = document.querySelectorAll(".menu-link");

menuLinks.forEach((link) => {

    link.addEventListener("click", () => {

        if (window.innerWidth <= 800) {
            sidebar.classList.remove("open");
        }

    });

});