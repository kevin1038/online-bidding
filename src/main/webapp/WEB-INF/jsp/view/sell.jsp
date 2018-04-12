<!DOCTYPE html>
<html>
    <head>
        <title>Sell - Online Bidding</title>
        <%@ include file="semantic/semantic-css.jspf" %>
    </head>
    <body>
        <%@ include file="header.jspf" %>
        <<div class="ui container">
            <div class="ui centered three column grid">
                <div class="column">
                    <c:url var="sellUrl" value="/user/sell"/>
                    <form:form class="ui form" action="${sellUrl}" method="post" enctype="multipart/form-data" modelAttribute="sellForm">
                        <div class="ui blue segment">
                            <h2 class="ui centered header">
                                Sell
                            </h2>
                            <div class="field">
                                <form:label path="itemName">Item name</form:label>
                                <form:input type="text" path="itemName" placeholder="Item name" required="required" />
                            </div>
                            <div class="field">
                                <form:label path="description">Description</form:label>
                                <form:textarea path="description" placeholder="Description" required="required" />
                            </div>
                            <div class="field">
                                <form:label path="photos">Photos</form:label>
                                <form:input type="file" path="photos" multiple="multiple" required="required" />
                            </div>
                            <div class="field">
                                <form:label path="price">Price</form:label>
                                <form:input type="number" min="1" path="price" placeholder="Price" required="required" />
                            </div>
                            <input class="fluid ui blue button" type="submit" value="Submit item" />
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
        <%@ include file="semantic/semantic-js.jspf" %>
    </body>
</html>
