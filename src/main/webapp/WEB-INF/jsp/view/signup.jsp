<!DOCTYPE html>
<html>
    <head>
        <title>Sign up - Online Bidding</title>
        <%@ include file="semantic/semantic-css.jspf" %>
    </head>
    <body>
        <%@ include file="header.jspf" %>
        <div class="ui container">
            <div class="ui center aligned three column grid">
                <div class="column">
                    <c:url var="signupUrl" value="/signup"/>
                    <form class="ui form" action="${signupUrl}" method="post">
                        <div class="ui teal segment">
                            <h2 class="ui header">
                                Sign up
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
                            <div class="field">
                                <div class="ui left icon input">
                                    <i class="lock icon"></i>
                                    <input type="password" name="confirmPassword" placeholder="Confirm password" />
                                </div>
                            </div>
                            <input type="submit" value="Sign up" class="fluid ui teal button" />
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
                                },
                                {
                                    type: 'minLength[6]',
                                    prompt: 'Your password must be at least {ruleValue} characters'
                                }
                            ]
                        },
                        confirmPassword: {
                            identifier: 'confirmPassword',
                            rules: [
                                {
                                    type: 'empty',
                                    prompt: 'Please confirm your password'
                                },
                                {
                                    type: 'match[password]',
                                    prompt: 'Password doesn\'t match'
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
