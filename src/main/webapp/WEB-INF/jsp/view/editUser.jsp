<!DOCTYPE html>
<html>
    <head>
        <title>Edit user - Online Bidding</title>
        <%@ include file="semantic/semantic-css.jspf" %>
    </head>
    <body>
        <%@ include file="header.jspf" %>
        <div class="ui container">
            <div class="ui card">
                <div class="content">
                    <div class="header">
                        Edit user
                    </div>
                </div>
                <div class="content">
                    <form:form class="ui form" method="POST" modelAttribute="itemUser">
                        <div class="field">
                            <label>Username</label>
                            ${user.username}
                        </div>
                        <div class="field">
                            <form:label path="password">Password</form:label>
                            <form:input type="text" path="password" />
                        </div>
                        <div class="field">
                            <form:label path="roles">Roles</form:label>
                                <div class="ui checkbox">
                                <form:checkbox path="roles" value="ROLE_USER" />
                                <label>ROLE_USER</label>
                            </div>
                            <div class="ui checkbox">
                                <form:checkbox path="roles" value="ROLE_ADMIN" />
                                <label>ROLE_ADMIN</label>
                            </div>
                        </div>
                        <input class="ui button" type="submit" value="Edit User"/>
                    </form:form>
                </div>
            </div>
        </div>
        <%@ include file="semantic/semantic-js.jspf" %>
    </body>
</html>
