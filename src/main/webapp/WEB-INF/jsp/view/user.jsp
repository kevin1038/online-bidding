<!DOCTYPE html>
<html>
    <head>
        <title>Manager user - Online Bidding</title>
        <%@ include file="semantic/semantic-css.jspf" %>
    </head>
    <body>
        <%@ include file="header.jspf" %>
        <div class="ui container">
            <a class="ui primary button" href="<c:url value="/admin/user/create" />">Create user</a>
            <table class="ui celled table">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Roles</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${itemUsers}" var="user">
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.password}</td>
                            <td>
                                <c:forEach items="${user.roles}" var="role" varStatus="status">
                                    <c:if test="${!status.first}">, </c:if>
                                    ${role.role}
                                </c:forEach>
                            </td>
                            <td>
                                [<a href="<c:url value="/admin/user/edit/${user.username}" />">Edit</a>]
                                [<a href="<c:url value="/admin/user/delete/${user.username}" />">Delete</a>]
                            </td>
                        </tr>
                    </c:forEach>
                <tbody>
            </table>
        </div>
        <%@ include file="semantic/semantic-js.jspf" %>
    </body>
</html>
