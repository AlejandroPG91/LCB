<%-- 
    Document   : errorView
    Created on : 21-abr-2016, 12:06:56
    Author     : javi
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
        <link href="css/bootstrap-formhelpers.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>LCB - Error Page</title>
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
                <div class='col-lg-12 center-block'>
                    <% String error = request.getParameter("error").toString(); %>
                    <% if(error != null && (!error.isEmpty() || error.length() > 0)){ %>
                    <br>
                    <div class='center-block alert alert-danger col-lg-4' role="alert">
                        
                        <p><% out.print(error);%></p>
                        <!-- <% //session.setAttribute("error", ""); %> -->
                        <% }else{ %>
                            <p>No hay errores</p>
                        <% } %>
                    </div>  
                </div>
            </div>
        </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src='js/bootstrap-formhelpers.js'></script>
    </body>
</html>