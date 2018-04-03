<!DOCTYPE html>
<html>
    <head>
        <title>Online Bidding</title>
    </head>
    <body>
        <%@ include file="header.jspf" %>
        <div class="ui container">
            <c:choose>
                <c:when test="${fn:length(itemDatabase) > 0}">
                    <c:forEach items="${itemDatabase}" var="item">
                        <a href="<c:url value="/item/${item.key}" />"><c:out value="${item.value.itemName}" /></a>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    123
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
