<%@page import="java.util.Date"%>
<%@page import="logica.Empleado"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Panel de Control</title>

	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">  <!-- Google web font "Open Sans" -->
	<link rel="stylesheet" href="css/fontawesome-all.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/magnific-popup.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
	<link rel="stylesheet" href="css/tooplate-style.css">

	<script>
		var renderPage = true;

	if(navigator.userAgent.indexOf('MSIE')!==-1
		|| navigator.appVersion.indexOf('Trident/') > 0){
   		/* Microsoft Internet Explorer detected in. */
   		alert("Please view this in a modern browser such as Chrome or Microsoft Edge.");
   		renderPage = false;
	}
	</script>
</head>

<body>
    <%
    HttpSession misesion = request.getSession();
    String usuario = (String) misesion.getAttribute("usuario");
    String contrasenia = (String) misesion.getAttribute("contrasenia");
    int idEmpleado = (Integer) misesion.getAttribute("idEmpleado");
        if(usuario == null){
            response.sendRedirect("login.jsp");
        }
        else{
    %>
	<!-- Loader -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>
	
	<!-- Page Content -->
	<div class="container-fluid tm-main">
		<div class="row tm-main-row">

			<!-- Sidebar -->
			<div id="tmSideBar" class="col-xl-3 col-lg-4 col-md-12 col-sm-12 sidebar">

				<button id="tmMainNavToggle" class="menu-icon">&#9776;</button>

				<div class="inner">
					<nav id="tmMainNav" class="tm-main-nav">
						<ul>
							<li>
								<a href="#intro" id="tmNavLink1" class="scrolly active" data-bg-img="constructive_bg_01.jpg" data-page="#tm-section-1">
									<i class="fas fa-home tm-nav-fa-icon"></i>
									<span>Inicio</span>
								</a>
							</li>
							<li>
								<a href="#empleados" id="tmNavLink2" class="scrolly" data-bg-img="constructive_bg_02.jpg" data-page="#tm-section-2" data-page-type="carousel">
									<i class="fas fa-map tm-nav-fa-icon"></i>
									<span>Empleados</span>
								</a>
							</li>							
							<li>
								<a href="#clientes" class="scrolly" data-bg-img="constructive_bg_03.jpg" data-page="#tm-section-3">
									<i class="fas fa-users tm-nav-fa-icon"></i>
									<span>Clientes</span>
								</a>
							</li>
							<li>
								<a href="#ventas" class="scrolly" data-bg-img="constructive_bg_04.jpg" data-page="#tm-section-4">
									<i class="fas fa-comments tm-nav-fa-icon"></i>
									<span>Ventas</span>
								</a>
							</li>
                                                        <li>
								<a href="#servicios" class="scrolly" data-bg-img="constructive_bg_04.jpg" data-page="#tm-section-5">
									<i class="fas fa-comments tm-nav-fa-icon"></i>
									<span>Servicios</span>
								</a>
							</li>
                                                        <li>
								<a href="#paquetes" class="scrolly" data-bg-img="constructive_bg_04.jpg" data-page="#tm-section-6">
									<i class="fas fa-comments tm-nav-fa-icon"></i>
									<span>Paquetes</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>

			<div class="col-xl-9 col-lg-8 col-md-12 col-sm-12 tm-content">

					<!-- section 1 -->
					<section id="tm-section-1" class="tm-section">
						<div class="ml-auto">
							<header class="mb-4"><h1 class="tm-text-shadow">Panel de Control</h1></header>
							<p class="mb-5 tm-font-big">Bienvenido al panel de control de la agencia</p>
                                                        <div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4">
                                                            <form action="SvEliminarSesion" method="post">
                                                                <button class="btn tm-btn-submit tm-btn ml-auto" href="SvEliminarSesion">Cerrar sesión</button>
                                                            </form>
                                                        </div>
                                                        
						</div>
					</section>

					<!-- section 2 -->
					<section id="tm-section-2" class="tm-section">						
						<div class="row mb-4">
							<header class="col-xl-12"><h2 class="tm-text-shadow">Empleados</h2></header>		
						</div>
						<div class="row">
							<div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4" style="margin: auto; width: 50vw;">
								<div class="media tm-bg-transparent-black tm-border-white">
									<i class="fas fa-user-plus tm-icon-circled tm-icon-media"></i>
									<div class="media-body">
                                                                            <a class="btn tm-btn-submit tm-btn ml-auto" href="crearEmpleado.jsp">Alta</a>
									</div>
								</div>
							</div>	
                                                        <div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4" style="margin: auto; width: 50vw;">
								<div class="media tm-bg-transparent-black tm-border-white">
									<i class="fas fa-list mr-4 tm-icon-circled tm-icon-media"></i>	
									<div class="media-body">
                                                                            <form action="SvConsultaEmpleados" method="GET">
										<a class="btn tm-btn-submit tm-btn ml-auto SUBMIT" href="SvConsultaEmpleados">Listado</a>
                                                                            </form>										
									</div>
                                                                </div>
							</div>
                                                      </div>					               
					</section>

					<!-- section 3 -->
					<section id="tm-section-3" class="tm-section">						
						<div class="row mb-4">
							<header class="col-xl-12"><h2 class="tm-text-shadow">Clientes</h2></header>		
						</div>
						<div class="row">
							<div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4" style="margin: auto; width: 50vw;">
								<div class="media tm-bg-transparent-black tm-border-white">
									<i class="fas fa-user-plus tm-icon-circled tm-icon-media"></i>
									<div class="media-body">
                                                                            <a class="btn tm-btn-submit tm-btn ml-auto" href="crearCliente.jsp">Alta</a>
									</div>
								</div>
							</div>	
                                                        <div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4" style="margin: auto; width: 50vw;">
								<div class="media tm-bg-transparent-black tm-border-white">
									<i class="fas fa-list  mr-4 tm-icon-circled tm-icon-media"></i>	
									<div class="media-body">
                                                                            <form action="SvConsultaClientes" method="GET">
										<a class="btn tm-btn-submit tm-btn ml-auto SUBMIT" href="SvConsultaClientes">Listado</a>
                                                                            </form>							
									</div>
                                                                </div>
							</div>
                                                      </div>							               
					</section>

					<!-- section 4 -->
					<section id="tm-section-4" class="tm-section">
                                            <div class="row mb-4">
							<header class="col-xl-12" style="margin: auto;"><h2 class="tm-text-shadow">Ventas</h2></header>		
						</div>
                                                
						<div class="row">
		
                                                            <div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4">
								<div class="media tm-bg-transparent-black tm-border-white">
                                                                        <i class="far fa-plus-square tm-icon-circled tm-icon-media"></i>
									<div class="media-body">
                                                                            <form action="SvAltaVentaServicio" method="get">
                                                                                <a class="btn tm-btn-submit tm-btn ml-auto" href="SvAltaVentaServicio">Vender servicios</a>
                                                                            </form>
									</div>
								</div>
                                                            </div>	
							<div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4">
								<div class="media tm-bg-transparent-black tm-border-white">
									<i class="far fa-plus-square tm-icon-circled tm-icon-media"></i>
									<div class="media-body">
                                                                            <form action="SvAltaVentaServicio" method="get">
										<a class="btn tm-btn-submit tm-btn ml-auto" href="SvAltaVentaPaquete">Vender paquete</a>
                                                                            </form>										
									</div>
                                                                </div>
							</div>
                                                        <div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4" style="margin: auto;">
								<div class="media tm-bg-transparent-black tm-border-white">
									<i class="fas fa-list  mr-4 tm-icon-circled tm-icon-media"></i>	
									<div class="media-body">
                                                                            <form action="SvConsultaVentas" method="get">
										<a class="btn tm-btn-submit tm-btn ml-auto SUBMIT" href="SvConsultaVentas">Listado</a>
                                                                            </form>							
									</div>
                                                                </div>
							</div>
                                                </div>
					</section>
                                        <section id="tm-section-5" class="tm-section">						
						<div class="row mb-4">
							<header class="col-xl-12"><h2 class="tm-text-shadow">Servicios</h2></header>		
						</div>
						<div class="row">
							<div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4" style="margin: auto; width: 50vw;">
								<div class="media tm-bg-transparent-black tm-border-white">
									<i class="far fa-plus-square tm-icon-circled tm-icon-media"></i>
									<div class="media-body">
                                                                            <a class="btn tm-btn-submit tm-btn ml-auto" href="crearServicio.jsp">Alta</a>
									</div>
								</div>
							</div>	  
                                                        <div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4" style="margin: auto; width: 50vw;"">
								<div class="media tm-bg-transparent-black tm-border-white">
									<i class="fas fa-list  mr-4 tm-icon-circled tm-icon-media"></i>	
									<div class="media-body">
                                                                            <form action="SvConsultaServicios" method="get">
										<a class="btn tm-btn-submit tm-btn ml-auto SUBMIT" href="SvConsultaServicios">Listado</a>
                                                                            </form>							
									</div>
                                                                </div>
							</div>
                                                      </div>							               
					</section>
                                        <section id="tm-section-6" class="tm-section">						
						<div class="row mb-4">
							<header class="col-xl-12"><h2 class="tm-text-shadow">Paquetes</h2></header>		
						</div>
						<div class="row">
							<div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4" style="width: 50vw;">
								<div class="media tm-bg-transparent-black tm-border-white" >
									<i class="far fa-plus-square tm-icon-circled tm-icon-media"></i>
									<div class="media-body">
                                                                            <a class="btn tm-btn-submit tm-btn ml-auto" href="SvConsultaServiciosPaquetes">Alta</a>
									</div>
								</div>
							</div>	
                                                        <div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4" style="margin: auto; width: 50vw;" >
								<div class="media tm-bg-transparent-black tm-border-white">
									<i class="fas fa-list  mr-4 tm-icon-circled tm-icon-media"></i>	
									<div class="media-body">
                                                                            <form action="SvConsultaPaquetes" method="GET">
										<a class="btn tm-btn-submit tm-btn ml-auto SUBMIT" href="SvConsultaPaquetes">Listado</a>
                                                                            </form>							
									</div>
                                                                </div>
							</div>
                                                      </div>							               
					</section>
				</div>	<!-- .tm-content -->							
			</div>	<!-- row -->			
		</div>
		<div id="preload-01"></div>
		<div id="preload-02"></div>
		<div id="preload-03"></div>
		<div id="preload-04"></div>

		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
		<script type="text/javascript" src="js/jquery.backstretch.min.js"></script>
		<script type="text/javascript" src="slick/slick.min.js"></script> <!-- Slick Carousel -->

		<script>

		var sidebarVisible = false;
		var currentPageID = "#tm-section-1";

		// Setup Carousel
		function setupCarousel() {

			// If current page isn't Carousel page, don't do anything.
			if($('#tm-section-2').css('display') == "none") {
			}
			else {	// If current page is Carousel page, set up the Carousel.

				var slider = $('.tm-img-slider');
				var windowWidth = $(window).width();

				if (slider.hasClass('slick-initialized')) {
					slider.slick('destroy');
				}

				if(windowWidth < 640) {
					slider.slick({
	              		dots: true,
	              		infinite: false,
	              		slidesToShow: 1,
	              		slidesToScroll: 1
	              	});
				}
				else if(windowWidth < 992) {
					slider.slick({
	              		dots: true,
	              		infinite: false,
	              		slidesToShow: 2,
	              		slidesToScroll: 1
	              	});
				}
				else {
					// Slick carousel
	              	slider.slick({
	              		dots: true,
	              		infinite: false,
	              		slidesToShow: 3,
	              		slidesToScroll: 2
	              	});
				}

				// Init Magnific Popup
				$('.tm-img-slider').magnificPopup({
				  delegate: 'a', // child items selector, by clicking on it popup will open
				  type: 'image',
				  gallery: {enabled:true}
				  // other options
				});
      		}
  		}

  		// Setup Nav
  		function setupNav() {
  			// Add Event Listener to each Nav item
	     	$(".tm-main-nav a").click(function(e){
	     		e.preventDefault();
		    	
		    	var currentNavItem = $(this);
		    	changePage(currentNavItem);
		    	
		    	setupCarousel();
		    	setupFooter();

		    	// Hide the nav on mobile
		    	$("#tmSideBar").removeClass("show");
		    });	    
  		}

  		function changePage(currentNavItem) {
  			// Update Nav items
  			$(".tm-main-nav a").removeClass("active");
     		currentNavItem.addClass("active");

	    	$(currentPageID).hide();

	    	// Show current page
	    	currentPageID = currentNavItem.data("page");
	    	$(currentPageID).fadeIn(1000);

	    	// Change background image
	    	var bgImg = currentNavItem.data("bgImg");
	    	$.backstretch("img/" + bgImg);		    	
  		}

  		// Setup Nav Toggle Button
  		function setupNavToggle() {

			$("#tmMainNavToggle").on("click", function(){
				$(".sidebar").toggleClass("show");
			});
  		}

  		// If there is enough room, stick the footer at the bottom of page content.
  		// If not, place it after the page content
  		function setupFooter() {
  			
  			var padding = 100;
  			var footerPadding = 40;
  			var mainContent = $("section"+currentPageID);
  			var mainContentHeight = mainContent.outerHeight(true);
  			var footer = $(".footer-link");
  			var footerHeight = footer.outerHeight(true);
  			var totalPageHeight = mainContentHeight + footerHeight + footerPadding + padding;
  			var windowHeight = $(window).height();		

  			if(totalPageHeight > windowHeight){
  				$(".tm-content").css("margin-bottom", footerHeight + footerPadding + "px");
  				footer.css("bottom", footerHeight + "px");  			
  			}
  			else {
  				$(".tm-content").css("margin-bottom", "0");
  				footer.css("bottom", "20px");  				
  			}  			
  		}

  		// Everything is loaded including images.
      	$(window).on("load", function(){

      		// Render the page on modern browser only.
      		if(renderPage) {
				// Remove loader
		      	$('body').addClass('loaded');

		      	// Page transition
		      	var allPages = $(".tm-section");

		      	// Handle click of "Continue", which changes to next page
		      	// The link contains data-nav-link attribute, which holds the nav item ID
		      	// Nav item ID is then used to access and trigger click on the corresponding nav item
		      	var linkToAnotherPage = $("a.tm-btn[data-nav-link]");
			    
			    if(linkToAnotherPage != null) {
			    	
			    	linkToAnotherPage.on("click", function(){
			    		var navItemToHighlight = linkToAnotherPage.data("navLink");
			    		$("a" + navItemToHighlight).click();
			    	});
			    }
		      	
		      	// Hide all pages
		      	allPages.hide();

		      	$("#tm-section-1").fadeIn();

		     	// Set up background first page
		     	var bgImg = $("#tmNavLink1").data("bgImg");
		     	
		     	$.backstretch("img/" + bgImg, {fade: 500});

		     	// Setup Carousel, Nav, and Nav Toggle
			    setupCarousel();
			    setupNav();
			    setupNavToggle();
			    setupFooter();

			    // Resize Carousel upon window resize
			    $(window).resize(function() {
			    	setupCarousel();
			    	setupFooter();
			    });
      		}	      	
		});

		</script>
                <%}%>
	</body>
</html>