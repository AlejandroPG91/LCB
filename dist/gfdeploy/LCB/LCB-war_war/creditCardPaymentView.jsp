<%@page import="entity.Client"%>
<%@page import="util.ShoppingCart"%>
<%@page import="controller.BookFacade"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Pago via Paypal</title>
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
            <% Client client = (Client) session.getAttribute("client"); %>
            <% if(client != null){ %>
                <div class='row'>
                    <div class='col-lg-4 col-lg-offset-4 paymentInfoWrapper'>
                        <h1>Pago</h1>
                        <div class='headerWrapper'>
                            <% ShoppingCart cart = (ShoppingCart) session.getAttribute("cart"); %>
                            <% if(cart.getCart().size() != 0 || !cart.getCart().isEmpty()){ %>
                                <a> Carrito: <% out.print(cart.getCart().size()); %> productos</a>
                                <div class='priceWrapper'>
                                    <h2> Total a pagar: <% out.print(session.getAttribute("price")); %> €</h2>
                                </div>
                            <% }else{ %>
                                <jsp:forward page="errorView.jsp"> 
                                <jsp:param name="error" value="El carrito no tiene productos." /> 
                                </jsp:forward> 
                            <% } %>
                        </div>
                    </div>
                </div>
                <div class='row'>
                    <div class='col-lg-4 col-lg-offset-4 paymentInfoWrapper'>
                        <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                            <input type='hidden' value='ShoppingCommand' name='command'>
                            <label for='email'>Nº Tarjeta:</label>
                            <input type='email' name='email' class='form-control' required=""><br>
                            <label for='expire'>Caducidad:</label>
                            <input type='text' name='expire' class='form-control' required><br>
                            <label for='cvv'>CVV2:</label>
                            <input type='password' name='cvv' class='form-control' required><br>
                            <button type='submit' class='btn btn-default'>Realizar pago</button>
                        </form>
                    </div>
                </div>
            <% }else{ %>
                <jsp:forward page="errorView.jsp"> 
                <jsp:param name="error" value="No estas identificado." /> 
                </jsp:forward> 
            <% } %>
        </div>
    </body>
</html>
