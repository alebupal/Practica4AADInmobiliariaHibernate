<%-- 
    Document   : edit
    Created on : 19-ene-2015, 11:00:09
    Author     : Alejandro
--%>

<%@page import="com.alejandro.hibernate.Inmueble"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Inmueble in = (Inmueble)request.getAttribute("inmuebleEditar");
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
			    <li><a href="control?target=inmueble&op=select&action=view" class="current">Inmuebles</a></li>
                        </ul>
                    </div><!-- end #navigation-->
                    <div class="clr"></div>
                </div><!-- end #header -->
            </div><!-- end #centercolumn -->
        </div><!-- end #top-container -->


        <div class="centercolumn">

            <div id="maincontent">
                <div id="content" class="full">
                    <h2 class="underline">Añadir inmueble</h2>
                        <form action="control" method="POST">
                            <span class="spanAnadir">Calle: </span><input type="text" name="calle" value="<%= in.getCalle()%>" />
                            <br>
                            <span class="spanAnadir">Localidad: </span><input type="text" name="localidad" value="<%= in.getLocalidad()%>" />
                            <br>
                            <span class="spanAnadir">Tipo: </span>
                            <select name="tipo">
                                <% if(in.getTipo().compareToIgnoreCase("piso")==0){ %>
                                <option value="casa">Casa</option>
                                <option value="piso" selected>Piso</option>
                                <option value="cochera">Cochera</option>
                                <% }else if(in.getTipo().compareToIgnoreCase("cochera")==0){ %>
                                <option value="casa">Casa</option>
                                <option value="piso" >Piso</option>
                                <option value="cochera" selected>Cochera</option>
                                <% }else if(in.getTipo().compareToIgnoreCase("casa")==0){ %>
                                <option value="casa" selected>Casa</option>
                                <option value="piso" >Piso</option>
                                <option value="cochera" >Cochera</option>
                                <% }%>
                            </select>
                            <br>
                            <span class="spanAnadir">Precio: </span><input type="text" name="precio" value="<%= in.getPrecio()%>" />
                            <br>
                            <input type="hidden" name="target" value="inmueble" />
                            <input type="hidden" name="op" value="edit" />
                            <input type="hidden" name="action" value="op" />
                            <input type="hidden" name="id" value="<%= in.getId() %>" />
                            <input type="hidden" name="usuario" value="web" />
                            <input type="submit" value="Editar" />
                            <br>
                        </form>
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







