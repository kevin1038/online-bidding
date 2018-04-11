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
                        <div class="ui big image">
                            <img src="https://semantic-ui.com/images/wireframe/image.png">
                        </div>
                        <div class="fluid ui icon buttons">
                            <button class="ui button">
                                <i class="left arrow icon"></i>
                            </button>
                            <button class="ui button">
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
                        <h1 class="ui header">Item name</h1>
                        <div class="ui red big tag label">$22</div>
                        <div class="ui divider"></div>
                        <p>
                            <i class="info icon"></i>
                            description description description description description
                            description description description description description
                        </p>
                        <p>
                            <i class="user icon"></i>
                            username
                        </p>
                    </div>
                    <div class ="ui segment">
                        <p>
                            number of bids: 10
                        </p>
                        <div class="item">
                            status: 
                            <div class="ui green horizontal label">available</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="semantic/semantic-js.jspf" %>
    </body>
</html>
