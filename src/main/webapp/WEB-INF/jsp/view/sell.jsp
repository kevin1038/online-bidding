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
                                <form:label path="itemName">Item Name</form:label>
                                <form:input type="text" path="itemName" placeholder="Item Name" />
                            </div>
                            <div class="field">
                                <form:label path="description">Description</form:label>
                                <form:textarea path="description" placeholder="Description" />
                            </div>
                            <div class="field">
                                <form:label path="photos">Photos</form:label>
                                <form:input type="file" path="photos" multiple="multiple" />
                            </div>
                            <div class="field">
                                <form:label path="price">Price</form:label>
                                <form:input type="number" min="0" step="0.1" path="price" placeholder="Price" />
                            </div>
                            <input class="fluid ui blue button" type="submit" value="Submit Item" />
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
        <%@ include file="semantic/semantic-js.jspf" %>
    </body>
</html>
