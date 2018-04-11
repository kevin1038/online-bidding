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
                <c:when test="${fn:length(itemDatabase) > 0}">
                    <div class="ui five doubling cards">
                        <c:forEach items="${itemDatabase}" var="item">
                            <a href="<c:url value="/item/${item.key}" />" class="blue card">
                                <div class="image">
                                    <img>
                                </div>
                                <div class="content">
                                    <div class="header">
                                        <c:out value="${item.value.itemName}" />
                                    </div>
                                </div>
                                <div class="extra content">
                                    <span class="right floated header">
                                        <i class="blue dollar sign icon"></i>
                                        22
                                    </span>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </c:when>
            </c:choose>
        </div>
        <%@ include file="semantic/semantic-js.jspf" %>
    </body>
</html>
