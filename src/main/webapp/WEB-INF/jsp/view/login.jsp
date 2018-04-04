<!DOCTYPE html>
<html>
    <head>
        <title>Log in - Online Bidding</title>
        <%@ include file="semantic/semantic-css.jspf" %>
    </head>
    <body>
        <%@ include file="header.jspf" %>
        <div class="ui container">
            <div class="ui center aligned three column grid">
                <div class="column">
                    <form method="POST" action="<c:url value="/login" />" class="ui form">
                        <div class="ui blue segment">
                            <h2 class="ui header">
                                Log in
                            </h2>
                            <div class="field">
                                <div class="ui left icon input">
                                    <i class="user icon"></i>
                                    <input type="text" name="username" placeholder="Username" />
                                </div>
                            </div>
                            <div class="field">
                                <div class="ui left icon input">
                                    <i class="lock icon"></i>
                                    <input type="password" name="password" placeholder="Password" />
                                </div>
                            </div>
                            <input type="submit" value="Log in" class="ui fluid blue button" />
                        </div>
                        <div class="ui error message"></div>
                    </form>
                </div>
            </div>
        </div>
        <%@ include file="semantic/semantic-js.jspf" %>
        <script>
            $(document).ready(function () {
                $('.ui.form').form({
                    fields: {
                        username: {
                            identifier: 'username',
                            rules: [
                                {
                                    type: 'empty',
                                    prompt: 'Enter a username'
                                }
                            ]
                        },
                        password: {
                            identifier: 'password',
                            rules: [
                                {
                                    type: 'empty',
                                    prompt: 'Enter a password'
                                }
                            ]
                        }
                    },
                    inline: true,
                    on: 'blur'
                });
            });
        </script>
    </body>
</html>
