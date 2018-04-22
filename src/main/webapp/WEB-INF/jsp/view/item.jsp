<!DOCTYPE html>
<html>
    <head>
        <title>Online Bidding</title>
        <%@ include file="semantic/semantic-css.jspf" %>
    </head>
    <body>
        <%@ include file="header.jspf" %>
        <div class="ui container">
            <security:authorize access="hasRole('ADMIN')">
                <div class="ui grid">
                    <a class="ui red button" href="<c:url value="/admin/delete/${item.id}" />">Delete item</a>
                </div>
            </security:authorize>
            <c:if test="${item.status != "available" && item.status != username}">
                <h1 class="ui centered red header">This item is expired.</h1>
            </c:if>
            <c:if test="${item.status == username}">
                <h1 class="ui centered blue header">You own this item.</h1>
            </c:if>
            <div class="ui grid">
                <div class="eight wide column">
                    <div class ="ui segment">
                        <div class="ui shape">
                            <div class="sides">
                                <c:forEach items="${item.photos.toArray()}" var="photo" varStatus="status">
                                    <c:choose>
                                        <c:when test="${status.first}">
                                            <div class="active side">
                                                <img src="data:<c:out value="${photo.mimeContentType}" />;base64,
                                                     <c:out value="${photo.getBase64Contents()}" />" class="ui big image">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="side">
                                                <img src="data:<c:out value="${photo.mimeContentType}" />;base64,
                                                     <c:out value="${photo.getBase64Contents()}" />" class="ui big image">
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="fluid ui icon direction buttons">
                            <button class="ui button" data-animation="flip" data-direction="right">
                                <i class="right arrow icon"></i>
                            </button>
                        </div>
                    </div>

                    <div class ="ui segment">
                        <div class="ui comments">
                            <h3 class="ui dividing header">Comments</h3>
                            <c:choose>
                                <c:when test="${fn:length(item.comments) == 0}">
                                    <i>There are no comments.</i>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${item.comments.toArray()}" var="comment">
                                        <div class="comment">
                                            <security:authorize access="hasRole('ADMIN')">
                                                <a class="avatar" href="<c:url value="/admin/delete/${item.id}/${comment.id}" />">
                                                    <button class="circular ui icon button">
                                                        <i class="trash alternate outline icon"></i>
                                                    </button>
                                                </a>
                                            </security:authorize>
                                            <div class="content">
                                                <span class="author">${comment.username}</span>
                                                <div class="metadata">
                                                    <span class="date">
                                                        <fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd HH:mm:ss" />
                                                    </span>
                                                </div>
                                                <div class="text">
                                                    ${comment.content}
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <security:authorize access="hasRole('USER')">
                            <c:url var="postUrl" value="/user/post/${item.id}" />
                            <form:form class="ui reply form" action="${postUrl}" method="POST" modelAttribute="comment">
                                <div class="field">
                                    <form:textarea path="content" required="required" />
                                </div>
                                <button class="ui blue labeled icon button" type="submit">
                                    <i class="icon edit"></i>
                                    Reply
                                </button>
                            </form:form>
                        </security:authorize>
                    </div>
                </div>

                <div class="eight wide column">
                    <div class ="ui blue attached segment">
                        <h1 class="ui header"><c:out value="${item.itemName}" /></h1>
                        <div class="ui blue big tag label">$<c:out value="${item.price}" /></div>
                        <div class="ui divider"></div>
                        <p>
                            <i class="info icon"></i>
                            <c:out value="${item.description}" />
                        </p>
                        <p>
                            <i class="user icon"></i>
                            <c:out value="${item.owner}" />
                        </p>
                    </div>

                    <div class ="ui segments">
                        <security:authorize access="hasRole('USER')">
                            <c:if test="${item.owner == username && item.status == "available"}">
                                <div class="ui segment">
                                    <c:url var="endBidUrl" value="/user/endbid/${item.id}" />
                                    <form:form class="ui form" action="${endBidUrl}" method="POST" modelAttribute="endBid">
                                        <div class="ui action input">
                                            <form:select class="ui dropdown" path="winner" required="required">
                                                <form:option value="">Select a winner</form:option>
                                                <form:option value="no winner">no winner</form:option>
                                                <c:if test="${!empty item.winner}">
                                                    <form:option value="${item.winner}">${item.winner}</form:option>
                                                </c:if>
                                            </form:select>
                                            <button class="ui blue button" type="submit">End Bidding</button>
                                        </div>
                                    </form:form>
                                </div>
                            </c:if>

                            <c:if test="${item.owner != username && item.status == "available"}">
                                <div class="ui segment">
                                    <c:choose>
                                        <c:when test="${item.winner == username}">
                                            <div class="ui blue big basic label">You are the highest bidder.</div> 
                                        </c:when>
                                        <c:otherwise>
                                            <c:url var="bidUrl" value="/user/bid/${item.id}" />
                                            <form:form class="ui form" action="${bidUrl}" method="POST" modelAttribute="bid">
                                                <div class="ui action input">
                                                    <form:input type="number" min="${item.price+1}" value="${item.price}" path="price" placeholder="Price" required="required" />
                                                    <button class="ui blue button" type="submit">Bid</button>
                                                </div>
                                            </form:form>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </c:if>
                        </security:authorize>

                        <div class="ui segment">
                            number of bids:
                            <c:out value="${item.bidCount}" />
                        </div>
                        <div class="ui segment">
                            status:
                            <c:choose>
                                <c:when test="${item.status == "available"}">
                                    <div class="ui green horizontal label">${item.status}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="ui teal horizontal label">${item.status}</div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="semantic/semantic-js.jspf" %>
        <script type="text/javascript">
            $(document).ready(function () {
                var $shape = $('.ui.shape'),
                        $directionButton = $('.direction .button'),
                        handler;

                handler = {
                    rotate: function () {
                        var $shape = $(this).closest('.buttons').prevAll('.ui.shape').eq(0),
                                direction = $(this).data('direction') || false,
                                animation = $(this).data('animation') || false;
                        if (direction && animation) {
                            $shape.shape(animation + '.' + direction);
                        }
                    }
                };

                $shape.shape();
                $directionButton.on('click', handler.rotate);
            });
        </script>
    </body>
</html>
