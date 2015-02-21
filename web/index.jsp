<%-- 
    Document   : index
    Created on : 31-ene-2015, 23:00:23
    Author     : Alejandro
--%>

<%@page import="com.alejandro.modelo.ModeloImagen"%>
<%@page import="com.alejandro.hibernate.Imagen"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.alejandro.modelo.ModeloInmueble"%>
<%@page import="java.util.List"%>
<%@page import="com.alejandro.hibernate.Inmueble"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<link rel="shortcut icon" href="images/content/favicon.ico" />
<meta http-equiv="Content-Script-Type" content="text/javascript" /> 

<meta name="robots" content="index, follow" />
<meta name="keywords" content="" />
<meta name="title" content="" />
<meta name="description" content="" />
<title>Lighthouse</title>
<link rel="shortcut icon" href="images/content/favicon.ico" />
<!-- ////////////////////////////////// -->
<!-- //      Start Stylesheets       // -->
<!-- ////////////////////////////////// -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<!-- ////////////////////////////////// -->
<!-- //      Javascript Files        // -->
<!-- ////////////////////////////////// -->
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/PT_Sans_400.font.js"></script>
<script type="text/javascript">
	 Cufon.replace('h1') ('h2') ('h3') ('h4') ('h5') ('h6') ('.slider-button a') ('.slider-price') ('.button') ('#nav li a', {hover: true});
	 
</script>
<script type="text/javascript" src="js/jquery.cycle.all.min.js"></script>
<script type="text/javascript" src="js/hoverIntent.js"></script> 
<script type="text/javascript" src="js/superfish.js"></script> 
<script type="text/javascript" src="js/supersubs.js"></script> 
<script type="text/javascript"> 
 var $jts = jQuery.noConflict();
    $jts(document).ready(function(){ 
        $jts("ul.sf-menu").supersubs({ 
		minWidth		: 9,		// requires em unit.
		maxWidth		: 25,		// requires em unit.
		extraWidth		: 0			// extra width can ensure lines don't sometimes turn over due to slight browser differences in how they round-off values
                               // due to slight rounding differences and font-family 
        }).superfish();  // call supersubs first, then superfish, so that subs are 
                         // not display:none when measuring. Call before initialising 
                         // containing tabs for same reason. 
    }); 
 
</script>
<script type="text/javascript" src="js/jquery.cycle.all.min.js"></script>
<script type="text/javascript">
 var $jts = jQuery.noConflict();
    $jts(document).ready(function(){ 
		
		//Slider  
         $jts('#slideshow').cycle({
            timeout: 5000,  // milliseconds between slide transitions (0 to disable auto advance)
            fx:      'fade', // choose your transition type, ex: fade, scrollUp, shuffle, etc...            
            pager:   '#pager',  // selector for element to use as pager container
            pause:   0,	  // true to enable "pause on hover"
            pauseOnPagerHover: 0 // true to pause when hovering over pager link
        });
     });
</script>

<!--[if IE 6]>
<script src="js/DD_belatedPNG.js"></script>
<script>
  DD_belatedPNG.fix('img');
</script>

<![endif]--> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>

	<div id="top-container">
		<div class="centercolumn">
		<div id="header">
			<div id="logo">
				<a href="#"><img src="images/logo.png" alt="" /></a>
			</div><!-- end #logo -->
			<div id="navigation">
				<ul id="nav" class="sf-menu">
					<li><a href="#" class="current">Inicio</a></li>
					<li><a href="control?target=inmueble&op=select&action=view" class="current">Inmuebles</a></li>
				</ul>
			</div><!-- end #navigation-->
			<div class="clr"></div>
		</div><!-- end #header -->
		</div><!-- end #centercolumn -->
	</div><!-- end #top-container -->
	<div class="centercolumn">
			<!-- BEGIN SLIDE -->
			<div id="slider_container">
			<div id="slideshow_navigation">
			<div id="pager"></div>
			</div><!-- end slideshow navigation -->
				<div id="slideshow">                                      
                                   
                        <%
                            List<Inmueble> lista = (List<Inmueble>) ModeloInmueble.get();
                            List<Imagen> listaImagen;
                            int limite=2;
                            String rutaMal;
                            String[] rutas;
                            String rutaBien;
                            if(lista.size()==0){
                            limite=0;
                            }else if(lista.size()==1){
                            limite=1;
                            }else if(lista.size()==2){
                            limite=2;
                            }else if(lista.size()==3){
                            limite=3;
                            }
                            for (int i =0;i<limite;i++) {   
                                listaImagen = (List<Imagen>) ModeloImagen.getidInmueble(lista.get(i).getId()+"");
                                if(listaImagen.size()==0){
                                    rutaBien="images/sinImagen.png";
                                }else{
                                    rutaMal=listaImagen.get(0).getRuta().toString();
                                    rutas=rutaMal.split("/");
                                    rutaBien="images/"+rutas[1].toString()+"/"+rutas[2].toString()+"/"+rutas[3].toString();
                                }
                        %>      
					<div class="cycle">
						<img src="<%= rutaBien %>" alt="" />
						<div class="farme-slide-text">
							<ul class="slide-text">
								<li><span class="left">Calle</span><%= lista.get(i).getCalle()%></li>
                                                                <li><span class="left">Localidad:</span><%= lista.get(i).getLocalidad()%></li>
                                                                <li><span class="left">Tipo</span><%= lista.get(i).getTipo()%></li>
							</ul>
							<div class="frame-price">
								<div class="slider-button"><a href="control?target=inmueble&op=view&action=view&id=<%= lista.get(i).getId()%>">Más</a></div>
                                                                <div class="slider-price"><%= lista.get(i).getPrecio()%><span> euros</span></div>
							</div>
						</div>
					</div><!-- end cycle -->
                                        
                                         <%
                            }
                        %>	
					
				</div><!-- end #slideshow -->
			</div><!-- end #slide -->
			<!-- END OF SLIDE -->
			
		<div id="maincontent">
			<div id="content" class="full">
				<ul class="three_column">
					<li>
						<h2 class="underline"><span class="blue">Soluciones</span> Creativas</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut quis ligula velit. Etiam odio quam, lobortis eget porttitor nec, congue in lacus. In venenatis neque a eros laoreet eu placerat erat suscipit. Fusce cursus, erat ut scelerisque condimentum, quam odio ultrices leo. </p>
					</li>
					<li>
						<h2 class="underline">Clientes <span class="blue">Satisfechos</span></h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut quis ligula velit. Etiam odio quam, lobortis eget porttitor nec, congue in lacus. In venenatis neque a eros laoreet eu placerat erat suscipit. Fusce cursus, erat ut scelerisque condimentum, quam odio ultrices leo. </p>
					</li>
					<li class="nomargin">
						<h2 class="underline"><span class="blue">Servicios</span> Útiles</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut quis ligula velit. Etiam odio quam, lobortis eget porttitor nec, congue in lacus. In venenatis neque a eros laoreet eu placerat erat suscipit. Fusce cursus, erat ut scelerisque condimentum, quam odio ultrices leo. </p>
					</li>
				</ul>
				<br class="clear" />
				<br />
		</div><!-- end #maincontent -->
	</div><!-- end #centercolumn -->
	
	
	<div id="bottom-container">
		<div class="centercolumn">
		
			<div id="footer">
				<div id="footer-left">
					<div class="one_fourth">
						<ul>
							<li class="widget-container">
								<h2 class="widget-title">Company</h2>
								<ul>
									<li><a href="#">About Us</a></li>
									<li><a href="#">Services</a></li>
									<li><a href="#">Clients</a></li>
									<li><a href="#">Presentation</a></li>
								</ul>
							</li>
						</ul>
					</div><!-- end #one_fourth -->
					<div class="one_fourth">
						<ul>
							<li class="widget-container">
								<h2 class="widget-title">For Clients</h2>
								<ul>
									<li><a href="#">Sign Up </a></li>
									<li><a href="#">Forum</a></li>
									<li><a href="#">Promitions</a></li>
								</ul>
							</li>
						</ul>
					</div><!-- end #one_fourth -->
					<div class="one_fourth">
						<ul>
							<li class="widget-container">
								<h2 class="widget-title">FAQs</h2>
								<ul>
									<li><a href="#">Support </a></li>
									<li><a href="#">FAQs</a></li>
									<li><a href="#">Website</a></li>
								</ul>
							</li>
						</ul>
					</div><!-- end #one_fourth -->
					<div class="one_fourth last">
						<ul>
							<li class="widget-container">
								<h2 class="widget-title">Properties</h2>
								<ul>
									<li><a href="#">Luxury</a></li>
									<li><a href="#">Residental</a></li>
									<li><a href="#">Commercial</a></li>
									<li><a href="#">Hometown</a></li>
								</ul>
							</li>
						</ul>
					</div><!-- end #one_fourth -->
				</div><!-- end #footer-left -->
				<div id="footer-right">
					<h2>NewsLetter Sign Up:</h2>
					<form method="get" action="" id="newsLetter" />
					<div><input type="text" class="inputbox" value="Enter your email here..." onblur="if (this.value == ''){this.value = 'Enter your email here...'; }" onfocus="if (this.value == 'Enter your email here...') {this.value = ''; }" /><br />
<input type="submit" name="submit" class="button" value="subscribe" /></div>
					</form>
				</div><!-- end #footer-right -->
			</div><!-- end #footer -->
			<div class="clear"></div>
			<div id="copyright">Copyright © 2011 <a href="#">Light House</a>. All Rights Reserved</div>
			
		 	<div class="clear"></div>
		</div><!-- end #centercolumn -->
	
	</div><!-- end #bottom-container -->
	<script type="text/javascript"> Cufon.now(); </script> <!-- to fix cufon problems in IE browser -->
</body>
</html>

