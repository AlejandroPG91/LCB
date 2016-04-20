<%-- 
    Document   : indexView
    Created on : 12-mar-2016, 19:15:41
    Author     : maxi
--%>

<%@page import="util.StatisticsBean"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="entity.Client"%>
<%@page import="util.ShoppingCart"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/menu.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Welcome to Leaky Cauldron Bookstore!</title>
    </head>
    
    <body>
        <div class="container">
            <nav class="navbar navbar-inverse">
                <div class="navbar-header">
                    <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href='FrontControllerServlet'>Leaky Cauldron</a>
                </div>
                
                <div class="collapse navbar-collapse js-navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="dropdown mega-dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Nuestros productos <span class="caret"></span></a>				
                            <ul class="dropdown-menu mega-dropdown-menu">
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Géneros</li>
                                        <li><a href="#">Juvenil</a></li>
                                        <li><a href="#">Infantil</a></li>
                                        <li><a href="#">Fantasía</a></li>
                                        <li><a href="#">Aventuras</a></li>
                                        <li><a href="#">Ciencia Ficción</a></li>
                                    </ul>
                                </li>
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Materias</li>
                                        <li><a href="#">Idiomas</a></li>
                                        <li><a href="#">Deportes</a></li>
                                        <li><a href="#">Tecnología</a></li>
                                        <li><a href="#">Informática</a></li>
                                        <li><a href="#">Oposiciones</a></li>						
                                    </ul>
                                </li>
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Recomendados</li>
                                        <li><a href="showBookInfo.jsp?title='Crónicas Vampíricas'">Crónicas Vampíricas</a></li>
                                        <li><a href="showBookInfo.jsp?title='El Nombre del Viento'">El Nombre del Viento</a></li>
                                        <li><a href="showBookInfo.jsp?title='Los Juegos del Hambre'">Los Juegos del Hambre</a></li>
                                        <li><a href="showBookInfo.jsp?title='Harry Potter y el Cáliz del Fuego'">Harry Potter y el Cáliz del Fuego</a></li>
                                        <li><a href="showBookInfo.jsp?title='Harry Potter y la Piedra Filosofal'">Harry Potter y la Piedra Filosofal</a></li>
                                    </ul>
                                </li>
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Libros</li>                            
                                        <div class="carousel slide" data-ride="carousel">
                                            <div class="carousel-inner">
                                                <div class="item active">
                                                    <a href="#"><img src="covers/Harry Potter 1.jpg" class="img-responsive" alt="product 1"></a>     
                                                </div><!-- End Item -->
                                                <div class="item">
                                                    <a href="#"><img src="covers/Harry Potter 2.jpg" class="img-responsive" alt="product 2"></a>       
                                                </div><!-- End Item -->
                                                <div class="item">
                                                    <a href="#"><img src="covers/Harry Potter 3.jpg" class="img-responsive" alt="product 3"></a>      
                                                </div><!-- End Item -->                                
                                            </div><!-- End Carousel Inner -->
                                        </div><!-- /.carousel -->
                                        <li class="divider"></li>
                                        <li><a href="booksView.jsp">Ver todos los libros <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
                                    </ul>
                                </li>
                            </ul>				
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Mi cuenta <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Inicia Sesión</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Registrarse</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Ver carrito <span class="glyphicon glyphicon-shopping-cart"></span></a></li>
                    </ul>
                </div><!-- /.nav-collapse -->
            </nav>
        </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src="js/menu.js"></script>
    </body>
</html>







<!--
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Welcome to Leaky Cauldron Bookstore!</title>
    </head>
    <body>
        <div class='container-fluid'>
            <div class='row'>
                <div class='col-lg-1 col-md-offset-2'>
                    <a href='FrontControllerServlet'><img src='images/logo.jpg' class="img-responsive"></a>
                </div>
                <div class='col-lg-8'>
                    <h1><a href='FrontControllerServlet'> Leaky Cauldron Bookstore</a></h1>
                </div>
            </div>
            <div class='row'>
                <div class='col-lg-4'>
                    <% Client client = (Client)session.getAttribute("client");
                    if(client != null && client.getIsadmin() == 1){ %>
                        <a class='btn btn-danger' href='adminView.jsp'>Administrar Base de Datos</a>
                    <% }
                    if(session.getAttribute("session") == null){ %>
                        <a class='btn btn-danger btn-sm' href='registerView.jsp'> Regístrate!</a>
                    <% } %>
                </div>
            </div>
            <div class='row center-block'>
                <div class='col-lg-5'>
                    <% if(session.getAttribute("session") == null){ %>
                        <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                            <input type='hidden' value='LoginCommand' name='command'>
                            <label for="user">E-mail:</label> 
                            <input class='form-control' type='email' name='user'><br>
                            <label for="password">Password:</label> 
                            <input class='form-control' type='password' name='password'>
                            <button type='submit' class='btn btn-default'>Entrar</button>
                        </form>
                    <% }else{ %>
                            Usuario: <% out.print(session.getAttribute("session")); %>
                            <form method='post' action='FrontControllerServlet' class='form-horizontal' role='form'>
                                <input type='hidden' value='AddShoppingCommand' name='command'>
                                <input type='submit' class='btn btn-default' name='compras' value='Mis Compras'>
                            </form> 
                            <form method='post' action='FrontControllerServlet' class='form-horizontal' role='form'>
                                <input type='hidden' value='LogOutCommand' name='command'>
                                <input type='submit' class='btn btn-default' name='logout' value='Cerrar sesión'>
                            </form> 
                    <% } %>
                </div>
                <div class='col-lg-5'>
                    <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                        <input type='hidden' value='SearchCommand' name='command'>
                        <label for="search">Buscar: </label> 
                        <input class='form-control' type='text' name='search'><br>
                        <label for="select">Filtro: </label> 
                        <select name="select" class='form-control'>
                            <option selected="selected" value="0">Título</option>
                            <option value="1">Autor</option>
                            <option value="2">Categoría</option>
                        </select>
                        <button type='submit' class='btn btn-default'>Buscar</button>
                    </form>
                </div>
                <% if (client != null) { %>
                <div class='col-lg-1 pull-right'>
                    <% ShoppingCart cart = (ShoppingCart) session.getAttribute("cart"); %>
                    <p> Carrito: <% out.print(cart.getCart().size()); %> productos</p>
                    <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                        <input type='hidden' value='ShowCartCommand' name='command'>
                        <button type='submit' class='btn btn-default'>Ver Carrito</button>
                    </form>
                    <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                        <input type='hidden' value='ShowReservationsCommand' name='command'>
                        <button type='submit' class='btn btn-default'>Ver Reservas</button>
                    </form>
                </div>
                <% } %>
            </div>
            <div class='container row-fluid center-block'>
                <% ArrayList<Book> books = (ArrayList) session.getAttribute("books");
                    if (books !=  null && !books.isEmpty()) {
                        for (Book book : books){
                %>
                <div class='col-lg-4'>
                    <div class='book'>
                        <img src="covers/<% out.print(book.getTitle()+".jpg"); %>" onerror="this.src='images/inf.gif'" class="img-thumbnail img-responsive">
                        <p> <% out.print(book.getTitle()); %> </p>
                        <p> <% out.print(book.getAuthor()); %> </p>
                        <p> <% out.print(book.getCopy()); %> copias </p>
                        <p> <% out.print(book.getPrice()); %> €</p>
                        <p> <% out.print(book.getCategory()); %> </p>
                        <% if (book.getUsersvalue() == null) { %>
                            <p> <% out.print("Valoración: Sin valorar"); %> </p>
                        <% } else { %>
                            <p> <% out.print("Valoración: " + book.getUsersvalue()); %> </p>
                        <% } %>
                            <%  if (book.getCopy() <= 0) {   %>
                                <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                    <input type='hidden' value='ReserveBookCommand' name='command'>
                                    <input type='hidden' value='<% out.print(book.getIsbn());%>' name='bookIsbn'>
                                    <button type='submit' class='btn btn-warning'>Reservar</button>
                                </form><br>
                            <%  } else {   %>
                            <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                <input type='hidden' value='AddToCartCommand' name='command'>
                                <input type='hidden' value='<% out.print(book.getIsbn());%>' name='bookIsbn'>
                                <button type='submit' class='btn btn-primary'>Añadir al carrito</button>
                            </form><br>
                            <% } %>
                            <% if (client != null) { %>
                            <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                <input type="hidden" value="BookValueCommand" name="command" />
                                <input type="hidden" value='<% out.print(book.getIsbn()); %>' name="bookIsbn" />
                                <input type="hidden" value="<% out.print(client.getMail()); %>" name='clientMail' />
                                1 <input type="radio"  name="bookValue" value="1"/>
                                2 <input type="radio"  name="bookValue" value="2"/>
                                3 <input type="radio"  name="bookValue" value="3"/>
                                4 <input type="radio"  name="bookValue" value="4"/>
                                5 <input type="radio"  name="bookValue" value="5"/>
                                <input type="submit" class='btn btn-info' value="valorar" />
                            </form>
                        
                            <% } %>
                    </div>
                </div>
                <% } %>
                    <% } %>
            </div>
        </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
    </body>
</html>
-->