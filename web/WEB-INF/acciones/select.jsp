<%-- 
    Document   : index
    Created on : 16-ene-2015, 10:04:03
    Author     : Alejandro
--%>

<%@page import="com.alejandro.modelo.ModeloImagen"%>
<%@page import="com.alejandro.hibernate.Imagen"%>
<%@page import="java.util.List"%>
<%@page import="com.alejandro.hibernate.Inmueble"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <link href="css/prettyPhoto.css" rel="stylesheet" type="text/css" />
        <!-- ////////////////////////////////// -->
        <!-- //      Javascript Files        // -->
        <!-- ////////////////////////////////// -->
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/PT_Sans_400.font.js"></script>
        <script type="text/javascript">
            Cufon.replace('h1')('h2')('h3')('h4')('h5')('h6')('.slider-button a')('.slider-price')('.button')('#nav li a', {hover: true});
        </script>
        <script type="text/javascript" src="js/fade.js"></script>
        <script type="text/javascript" src="js/jquery.prettyPhoto.js"></script>

        <script type="text/javascript" src="js/jquery.cycle.all.min.js"></script>
        <script type="text/javascript" src="js/hoverIntent.js"></script> 
        <script type="text/javascript" src="js/superfish.js"></script> 
        <script type="text/javascript" src="js/supersubs.js"></script> 
        <script type="text/javascript">
            var $jts = jQuery.noConflict();
            $jts(document).ready(function () {
                $jts("ul.sf-menu").supersubs({
                    minWidth: 9, // requires em unit.
                    maxWidth: 25, // requires em unit.
                    extraWidth: 0			// extra width can ensure lines don't sometimes turn over due to slight browser differences in how they round-off values
                            // due to slight rounding differences and font-family 
                }).superfish();  // call supersubs first, then superfish, so that subs are 
                // not display:none when measuring. Call before initialising 
                // containing tabs for same reason. 

                /* for portfolio prettyPhoto */
                $jts(".pf-type4 a[rel^='prettyPhoto']").prettyPhoto({theme: 'facebook'});

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
                            <li><a href="#" class="current">Inmuebles</a></li>
                        </ul>
                    </div><!-- end #navigation-->
                    <div class="clr"></div>
                </div><!-- end #header -->
            </div><!-- end #centercolumn -->
        </div><!-- end #top-container -->


        <div class="centercolumn">

            <div id="maincontent">
                <div id="content" class="full">
                    <h2 class="underline">Todos los inmuebles</h2>
                    <a href="control?target=inmueble&op=insert&action=view">Añadir inmueble</a>
                    <br>
                    <br>
                    <ul class="four_column_properties">
                        <%
                            List<Inmueble> lista = (List<Inmueble>) request.getAttribute("datos");
                            List<Imagen> listaImagen;
                            String rutaMal;
                            String[] rutas;
                            String rutaBien;
                            
                            for (Inmueble p : lista) {
                                listaImagen = (List<Imagen>) ModeloImagen.getidInmueble(p.getId()+"");
                                if(listaImagen.size()==0){
                                    rutaBien="images/sinImagen.png";
                                }else{
                                    rutaMal=listaImagen.get(0).getRuta().toString();
                                    rutas=rutaMal.split("/");
                                    rutaBien="images/"+rutas[1].toString()+"/"+rutas[2].toString()+"/"+rutas[3].toString();
                                }
                        %>  
                        <li>
                            <img src="<%= rutaBien %>" alt="" />
                            <h6><a href="control?target=inmueble&op=view&action=view&id=<%= p.getId()%>"><%= p.getCalle()%></a></h6>
                            <ul class="box_text">
                                <li><span class="left">Localidad: </span><%= p.getLocalidad()%></li>
                                <li><span class="left">Tipo </span><%= p.getTipo()%></li>
                                <li><span class="left">Precio </span><%= p.getPrecio()%></li>
                            </ul>	
                            <a href="control?target=inmueble&op=delete&action=op&id=<%= p.getId()%>">Borrar</a>
                            <a href="control?target=inmueble&op=edit&action=view&id=<%= p.getId()%>">Editar</a>

                        </li>

                        <%
                            }
                        %>			
                    </ul><!-- end .pf-type4 -->
                    <div class="clear"></div>
                </div><!-- end #content -->
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
                        <div><input type="text" class="inputbox" value="Enter your email here..." onblur="if (this.value == '') {
                                    this.value = 'Enter your email here...';
                                }" onfocus="if (this.value == 'Enter your email here...') {
                                            this.value = '';
                                        }" /><br />
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
        <script type="text/javascript"> Cufon.now();</script> <!-- to fix cufon problems in IE browser -->
    </body>
</html>

















