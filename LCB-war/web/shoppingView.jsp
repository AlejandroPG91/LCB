<%-- 
    Document   : shoppingView
    Created on : 18-abr-2016, 13:51:06
    Author     : Soraya
--%>

<%@page import="entity.Book"%>
<%@page import="util.ShoppingCart"%>
<%@page import="entity.Shopping"%>
<%@page import="entity.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Ver Compra</title>
    </head>
    <body>
        <% Client client = (Client)session.getAttribute("client"); %>
        <% if (client != null) { %>
            <div class='col-lg-4'>
            <% Shopping shopping = (Shopping) session.getAttribute("shopping");
                ShoppingCart cart = (ShoppingCart) shopping.getShopping();
                for (Book book: cart.getCart()){ %>
                    <div class='book'>
                        <img src="covers/<% out.print(book.getTitle()+".jpg"); %>" onerror="this.src='images/inf.gif'" class="img-thumbnail img-responsive">
                        <p> <% out.print(book.getTitle()); %> </p>
                        <p> <% out.print(book.getAuthor()); %> </p>
                        <p> <% out.print(book.getPrice()); %> €</p>
                    </div>
                <% } %>
                Precio total: <% out.print(cart.getCost()); %>
            </div>
        <% } %>
        
    </body>
</html>