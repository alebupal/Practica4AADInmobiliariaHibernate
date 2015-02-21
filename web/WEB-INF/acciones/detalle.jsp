<%-- 
    Document   : index
    Created on : 16-ene-2015, 10:04:03
    Author     : Alejandro
--%>

<%@page import="com.alejandro.modelo.ModeloImagen"%>
<%@page import="com.alejandro.hibernate.Imagen"%>
<%@page import="com.alejandro.hibernate.Imagen"%>
<%@page import="com.alejandro.modelo.ModeloInmueble"%>
<%@page import="java.util.List"%>
<%@page import="com.alejandro.hibernate.Inmueble"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Inmueble in = (Inmueble)request.getAttribute("inmuebleDetalle");
%>

<!DOCTYPE html>

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
<link href="css/inner.css" rel="stylesheet" type="text/css" />
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
				<a href="index.jsp"><img src="images/logo.png" alt="" /></a>
			</div><!-- end #logo -->
			<div id="navigation">
				<ul id="nav" class="sf-menu">
					<li><a href="index.jsp" class="current">Inicio</a></li>
					<li><a href="control?target=inmueble&op=select&action=view" class="current">Inmuebles</a></li>
				</ul>
			</div><!-- end #navigation-->
			<div class="clr"></div>
		</div><!-- end #header -->
		</div><!-- end #centercolumn -->
	</div><!-- end #top-container -->
	
	<div class="centercolumn">
			
		<div id="maincontent">
			<div id="content">
				<h2 class="underline">Imágenes propiedad</h2>                                 
                                <a href="control?target=inmueble&op=subir&action=view&idInmuebleFoto=<%= in.getId()%>">Añadir foto</a> 
                                <br>
                                <a href="control?target=inmueble&op=eliminarFoto&action=view&idInmuebleFotos=<%= in.getId()%>">Gestionar fotos</a>  
				<div id="container-slider">
				<ul id="slideshow_detail">
                                    <%
                                        List<Imagen> listaImagen;
                                        int limite=3;
                                        String rutaMal;
                                        String[] rutas;
                                        String rutaBien;

                                       
                                        listaImagen = (List<Imagen>) ModeloImagen.getidInmueble(in.getId()+"");
                                        if(listaImagen.size()==0){
                                            rutaBien="images/sinImagen.png";
                                            %>  
                                                <li>
                                                    <h3><%= in.getCalle() %></h3>
                                                    <span><%= rutaBien %></span>
                                                    <p />
                                                    <img src="<%= rutaBien %>" alt="thumb" />
                                                </li>
                                          <%
                                        }else{
                                            for (int i =0;i<listaImagen.size();i++) {  
                                                rutaMal=listaImagen.get(i).getRuta().toString();
                                                rutas=rutaMal.split("/");
                                                rutaBien="images/"+rutas[1].toString()+"/"+rutas[2].toString()+"/"+rutas[3].toString();
                                                System.out.println("eeee"+rutaBien);
                               
                                        %>  
                                            <li>
                                                <h3><%= in.getCalle() %></h3>
                                                
                                                <span><%= rutaBien %></span>
                                                <p />
                                                <img src="<%= rutaBien %>" alt="thumb" />
                                                
                                            </li> 
                                    <%
                                
                                            }
                                         }
                                        %>
				</ul>
				<div id="wrapper">
					<div id="fullsize">
						<div id="imgprev" class="imgnav" title="Previous Image"></div>
						<div id="imglink"></div>
						<div id="imgnext" class="imgnav" title="Next Image"></div>
						<div id="image"></div>
						<div id="information">
							<h3></h3>
							<p />
						</div>
					</div>
					<div id="thumbnails">
						<div id="slideleft" title="Slide Left"></div>
						<div id="slidearea">
							<div id="slider"></div>
						</div>
						<div id="slideright" title="Slide Right"></div>
					</div>
				</div>
			<script type="text/javascript" src="js/compressed.js"></script>
			<script type="text/javascript" src="js/script.js"></script>
			<script type="text/javascript">
			<!-- 
			
				$('slideshow_detail').style.display='none';
				$('wrapper').style.display='block';
				var slideshow_detail=new TINY.slideshow_detail("slideshow_detail");
				window.onload=function(){
					slideshow_detail.auto=true;
					slideshow_detail.speed=5;
					slideshow_detail.link="linkhover";
					slideshow_detail.info="information";
					slideshow_detail.thumbs="slider";
					slideshow_detail.left="slideleft";
					slideshow_detail.right="slideright";
					slideshow_detail.scrollSpeed=4;
					slideshow_detail.spacing=25;
					slideshow_detail.active="#fff";
					slideshow_detail.init("slideshow_detail","image","imgprev","imgnext","imglink");
				}
			//-->  
			</script>
			</div><!-- end content-slider -->
			
			<div class="clear"><br /><br /></div>
			
			<h2 class="underline">Detalles propiedad</h2>
			<div id="property-detail">
			<div class="one_half">
				<ul class="box_text">
                                    <li><span class="left">Calle	</span><%= in.getCalle()%></li>
					<li><span class="left">Localidad</span><%= in.getLocalidad()%></li>					
			</div>
			<div class="one_half last">
				<ul class="box_text">
					<li><span class="left">Precio</span><%= in.getPrecio()%></li>
					<li><span class="left">Tipo</span><%= in.getTipo()%></li>
				</ul>	
			</div>
				</div>
				
			<div class="clear"><br /><br /></div>
			
			<h2 class="underline">Location</h2>
<iframe width="620" height="353" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=222+North+Canon+Drive+%23202,+Beverly+Hills+&amp;aq=&amp;sll=34.066623,-118.386612&amp;sspn=0.005022,0.011362&amp;ie=UTF8&amp;hq=&amp;hnear=222+N+Canon+Dr,+Beverly+Hills,+Los+Angeles,+California+90210&amp;ll=34.068423,-118.398505&amp;spn=0.020085,0.045447&amp;z=14&amp;output=embed"></iframe><br /><small><a href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=222+North+Canon+Drive+%23202,+Beverly+Hills+&amp;aq=&amp;sll=34.066623,-118.386612&amp;sspn=0.005022,0.011362&amp;ie=UTF8&amp;hq=&amp;hnear=222+N+Canon+Dr,+Beverly+Hills,+Los+Angeles,+California+90210&amp;ll=34.068423,-118.398505&amp;spn=0.020085,0.045447&amp;z=14" style="color:#0000FF;text-align:left">View Larger Map</a></small>
				
			<div class="clear"><br /><br /></div>
			
			<h2 class="underline">Contact Informations</h2>
				<form method="post" action="" id="contact-information" />
				<fieldset>
					<ul>
						<li>
						<label>My First Name</label><br />
						<input type="text" size="28" />
						</li>
						<li>
						<label>My Last Name</label><br />
						<input type="text" size="28" />
						</li>
					</ul>
					<label>My Email</label><br />
					<input type="text" size="39" /><br />
					<label>My Number (optional)</label><br />
					<input type="text" size="39" /><br />
					<label>Type of Information</label><br />
					<input type="text" size="109" /><br />
					<label>Questions &amp; Comments (optional)</label><br />
					<textarea cols="78" rows="3"> </textarea><br />
					<ul>
						<li>
						<label>Preferred Respons Time</label><br />
						<input type="text" size="28" />
						</li>
						<li>
						<label>Preferred Contact Time</label><br />
						<input type="text" size="28" />
						</li>
					</ul>
					<label>Estimated Timeframe for Buying or Selling</label><br />
					<input type="text" size="39" /><br /><br />
					<input type="submit" name="submit" class="button" value="request more details" /><br />
					<small>We will never share your personal information. <a href="#">Privacy Policy</a></small>
				</fieldset>
				</form>
						
						
			</div><!-- end #content -->
			
			<div class="sidebar_right">
			<div class="sidebar">
				<ul>
					<li class="widget-container widget_text">
						<h2 class="widget-title">Agent Information</h2>
						<div class="agent">
						<p><img src="images/content/pic1.jpg" alt="" class="alignleft" />	
							<span class="black"><%= in.getUsuario()%></span><br />
							Mobile: (866) 479-0889<br />
							Fax: (310) 521-6555<br />
							Broker: (310) 434-5000
						</p>
						<p>
						<a href="#">Email Agent</a><br />
						<a href="#">View Agent’s Website</a><br />
						<a href="#">Agent’s Other Listings</a><br />
					  </p>
					  </div>
					</li>
				
					<li class="widget-container widget_search">
						<h2 class="widget-title">Contact Agent</h2>
						<form method="post" action="" id="contact-agent" />
						<fieldset>
							<ul>
								<li>
								<label>First Name</label><br />
								<input type="text" size="21" />
								</li>
								<li>
								<label>Last Name</label><br />
								<input type="text" size="21" />
								</li>
							</ul>
							<label>Email</label><br />
							<input type="text" size="34" /><br />
							<label>Message</label><br />
							<textarea cols="37" rows="3"> </textarea><br />
							<input type="submit" name="submit" class="button" value="submit" />
						</fieldset>
						</form>
						
					</li>
				
					<li class="widget-container widget_text">
						<h2 class="widget-title">Agent’s Other Listings</h2>
						<div class="property-list">
						<p><img src="images/content/img4.jpg" alt="" />
							<span class="title">6541 West 7th Street</span><br />
							Los Angeles, CA 90044<br />
							<span class="black">$ 2,925,000</span><br />
							<small>4 Bed, 4 Bath, 4,250 Sq Ft</small>
							
						</p>

						<p><img src="images/content/img5.jpg" alt="" />
							<span class="title">6541 West 7th Street</span><br />
							Los Angeles, CA 90044<br />
							<span class="black">$ 2,925,000</span><br />
							<small>4 Bed, 4 Bath, 4,250 Sq Ft</small>
							
						</p>
					  </div>
					</li>
					
					<li class="widget-container widget_text">
						<h2 class="widget-title">Real Estate Resources</h2>
						<ul>
							<li><a href="#">Get your 3 Credi Scores before getting a mortgage</a></li>
							<li><a href="#">Get FREE quote from a local contractor</a></li>
							<li><a href="#">Find Rental Insurance In your Area</a></li>
							<li><a href="#">Free Storage Quotes</a></li>
						</ul>
					</li>
			
				</ul>
            </div><!-- end #sidebar -->
			</div><!-- end #sidebar_right -->
			
			<div class="clear"></div>
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
			</div>
			<div class="clear"></div>
			<div id="copyright">Copyright © 2011 <a href="#">Light House</a>. All Rights Reserved</div>
			<!-- end #foot -->
		</div><!-- end #centercolumn -->
		<div class="clear"></div>
	</div><!-- end #bottom-container -->
	<script type="text/javascript"> Cufon.now(); </script> <!-- to fix cufon problems in IE browser -->
</body>
</html>
