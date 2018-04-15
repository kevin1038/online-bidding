<!DOCTYPE html>
<html>
    <head>
        <title>Online Bidding</title>
        <%@ include file="semantic/semantic-css.jspf" %>
    </head>
    <body>
        <%@ include file="header.jspf" %>
        <div class="ui container">
            <h4 class="ui horizontal divider header">
                <i class="tag icon"></i>
                Shop now
            </h4>
            <c:choose>
                <c:when test="${fn:length(itemDatabase) == 0}">
                    <i>There are no items.</i>
                </c:when>
                <c:otherwise>
                    <div class="ui five doubling cards">
                        <c:forEach items="${itemDatabase}" var="item">
                            <a href="<c:url value="/item/${item.id}" />" class="blue card">
                                <c:if test="${item.photos.size() > 0}">
                                    <div class="image">
                                        <img src="data:<c:out value="${item.photos[0].mimeContentType}" />;base64,
                                             <c:out value="${item.photos[0].getBase64Contents()}" />">
                                    </div>
                                </c:if>
                                <div class="content">
                                    <div class="header">
                                        <c:out value="${item.itemName}" />
                                    </div>
                                </div>
                                <div class="extra content">
                                    <span class="right floated header">
                                        <i class="blue dollar sign icon"></i>
                                        <c:out value="${item.price}" />
                                    </span>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <%@ include file="semantic/semantic-js.jspf" %>
    </body>
</html>
