<%-- 
    Document   : shoppingListView
    Created on : 18-abr-2016, 13:13:21
    Author     : Soraya
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="entity.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Mis Compras</title>
    </head>
    <body>
        <% Client client = (Client)session.getAttribute("client"); %>
        <% if (client != null) { %>
            
                <% List <Integer> idList = (ArrayList) session.getAttribute("idShopping");
                if (idList != null && !idList.isEmpty()) { 
                    int i=0;
                    for (Integer id : idList) {%>
                        <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                        <input type='hidden' value='ShowShoppingCommand' name='command'>
                        Compra <% out.print(++i); %>: <input type='hidden' value='<% out.print(id); %>' name='id'>
                        <button type='submit' class='btn btn-default'>Ver Compra</button>
                        </form>
                    <%}%>
                <% }else if(idList == null){ %>
                    <jsp:forward page="errorView.jsp"> 
                    <jsp:param name="error" value="Error al obtener las compras." /> 
                    </jsp:forward> 
                <% }else if(idList.isEmpty()){ %>
                    <h2>No hay compras asociadas a su cuenta.</h2>
                <% } %>
            
        <% }else{ %>
            <jsp:forward page="errorView.jsp"> 
            <jsp:param name="error" value="Inicie sesión para ver sus compras." /> 
            </jsp:forward> 
        <% } %>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
    </body>
</html>
