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
                    <c:url var="deleteItemUrl" value="/admin/deleteItem/"/>
                    <form action="${deleteItemUrl}" method="post">
                        <input class="ui red bottom attached button" type="submit" value="Delete item" />
                    </form>
                </div>
            </security:authorize>
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
                                                     <c:out value="${photo.encodedContents}" />" class="ui big image">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="side">
                                                <img src="data:<c:out value="${photo.mimeContentType}" />;base64,
                                                     <c:out value="${photo.encodedContents}" />" class="ui big image">
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
                            <div class="comment">
                                <security:authorize access="hasRole('ADMIN')">
                                    <a class="avatar">
                                        <button class="circular ui icon button">
                                            <i class="trash alternate outline icon"></i>
                                        </button>
                                    </a>
                                </security:authorize>
                                <div class="content">
                                    <span class="author">username</span>
                                    <div class="metadata">
                                        <span class="date">Time</span>
                                    </div>
                                    <div class="text">
                                        Comment
                                    </div>
                                </div>
                            </div>
                            <div class="ui divider"></div>
                        </div>
                        <security:authorize access="hasRole('USER')">
                            <form class="ui reply form">
                                <div class="field">
                                    <textarea></textarea>
                                </div>
                                <div class="ui blue labeled submit icon button">
                                    <i class="icon edit"></i> Add Reply
                                </div>
                            </form>
                        </security:authorize>
                    </div>
                </div>

                <div class="eight wide column">
                    <div class ="ui blue attached segment">
                        <h1 class="ui header"><c:out value="${item.itemName}" /></h1>
                        <div class="ui red big tag label">$<c:out value="${item.price}" /></div>
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
                    <div class ="ui segment">
                        <security:authorize access="hasRole('USER')">
                            <c:if test="${item.owner == username}">
                                <div class="item">
                                    <a href="<c:url value="/user/endbid" />" class="ui blue button">End bidding</a>
                                </div>
                            </c:if>
                            <c:if test="${item.owner != username}">
                                <div class="item">
                                    <input type="number" min="${item.price}" value="${item.price}" path="price" placeholder="Price" required="required" />
                                    <a href="<c:url value="/user/bid" />" class="ui blue button">Bid</a>
                                </div>
                            </c:if>
                        </security:authorize>
                        <p>
                            number of bids: <c:out value="${item.bidCount}" />
                        </p>
                        <div class="item">
                            status: 
                            <div class="ui green horizontal label"><c:out value="${item.status}" /></div>
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
