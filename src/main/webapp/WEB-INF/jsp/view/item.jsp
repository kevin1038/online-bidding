<!DOCTYPE html>
<html>
    <head>
        <title>Online Bidding</title>
        <%@ include file="semantic/semantic-css.jspf" %>
    </head>
    <body>
        <%@ include file="header.jspf" %>
        <div class="ui container">
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
                                <a class="avatar">
                                    <img src="https://semantic-ui.com/images/wireframe/image.png">
                                </a>
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
                        </div>
                    </div>
                </div>

                <div class="eight wide column">
                    <div class ="ui blue segment">
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
