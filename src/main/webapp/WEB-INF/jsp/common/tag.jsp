<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    if(request.getSession().getAttribute("zhieruser")==null){
%>
<%
    RequestDispatcher zhier = request.getRequestDispatcher("zhier.jsp");
    zhier.forward(request,response);
%>
<% }%>

