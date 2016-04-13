<%@ page import="model.User" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(function () {
        $('#logIn').popup({
            inline: true,
            hoverable: true,
            position: 'bottom right'
        });
        $('#logOut').popup({
            inline: true,
            hoverable: true,
            position: 'bottom right'
        });
        $('.ui.search')
                .search({
                    apiSettings: {
                        url: '/search?q={query}'
                    },
                    maxResults: 10,
                    cache: true
                });
        $('#mycart' +
                '').click(function () {
            $.getJSON('/getCart', function (data) {
                console.log(data);
                if (data.length > 0) {
                    $('#proceed').removeClass("disabled");
                    $('#cartList').find('div.item').detach();
                    $.each(data, function (k, v) {
                        $('#cartList').append('<div class="item"><div class="content"><div class="description">' + v.name + '</div></div></div>');
                    });
                }
                else{
                    $('#proceed').addClass("disabled");
                }
            });
            $('#modaldiv').modal('show');
        });
    })
</script>
<div id="modaldiv" class="ui modal">
    <i class="close icon"></i>

    <div class="header">
        My Cart
    </div>
    <div class="image content">
        <div class="image">
            <img height="300px" src="img/cart.jpg">

        </div>

        <div class="ui segment container">
            <div class="description">
                <div class="ui header">My Cart</div>
            </div>

            <div class="ui fluid relaxed divided list" id="cartList">

            </div>
            <!--
                            <div ng-controller="CartRefreshController as cart">
                                <div ng-repeat="item in cartData">
                                    <div class="ui fluid relaxed divided list">
                                        <div class="item">
                                            <div class="content">
                                                <div class="description">{{item.name}}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
            -->
        </div>
    </div>
    <div class="actions">
        <div class="ui deny button">Later</div>
        <a class="ui button" id="proceed" href="/cart.jsp">Proceed</a>
    </div>
</div>
<div class="ui fixed sticky secondary inverted menu" style="background-color: #D84315; padding: 5px; height: 7%">
    <a class="active item" id="home" href="/index.jsp">Home</a>

    <div class="item">
        <div class="ui search">
            <div class="ui inverted transparent icon input">
                <input class="prompt" type="text" placeholder="Check out what we have...">
                <i class="search icon"></i>
            </div>
            <div class="results"></div>
        </div>
    </div>
    <a class="item" id="elex" href="/electronics.jsp">Electronics</a>
    <a class="item" id="books" href="/books.jsp">Books</a>
    <a class="item" id="fashion" href="/fashion.jsp">Fashion</a>
    <a class="item" id="games" href="/games.jsp">Games</a>

    <div class="right menu">
        <div class="item">
            <% if ((User) session.getAttribute("user") == null) {%>
            <a id="logIn" class="ui button" style="background: #EF6C00">log in</a>

            <div class="ui popup">
                <form class="ui form" method="post" action="${pageContext.request.contextPath}login">
                    <div class="field">
                        <label>Username</label>

                        <div class="ui input">
                            <input type="email" name="username" placeholder="Username">
                        </div>
                    </div>
                    <div class="field">
                        <label>Password</label>

                        <div class="ui input">
                            <input type="password" name="password" placeholder="Password">
                        </div>
                    </div>
                    <div class="field">
                        <input type="submit" class="ui bottom attached button" tabindex="0"
                               style="background: #EF6C00" value="Log in / Sign Up"/>
                    </div>
                </form>
            </div>
            <% } else if (((User) session.getAttribute("user")).getType() == 0) {%>
            <div id="logOut" class="ui red label"><%=((User) session.getAttribute("user")).getUser()%>
            </div>
            <div class="ui inverted popup">
                <div class="ui inverted vertical menu">
                    <a id="mycart" class="item">My Cart<i class="cart icon"></i></a>
                    <a href="/logout" class="item">Log out<i class="red sign out icon"></i></a>
                </div>
            </div>
            <%} else if (((User) session.getAttribute("user")).getType() == 1) {%>
            <div id="logOut" class="ui blue label"><%=((User) session.getAttribute("user")).getUser()%>
            </div>
            <div class="ui inverted popup">
                <div class="ui inverted vertical menu">
                    <a id="upload" href="/upload.jsp" class="item">Add a vegetable<i class="upload icon"></i></a>
                    <a id="edit" href="/edit.jsp" class="item">Edit Item Details<i class="edit icon"></i></a>
                    <a id="delete" href="/delete.jsp" class="item">Delete Items<i class="delete icon"></i></a>
                    <a id="view" href="/paymentDetails.jsp" class="item">View Payment details<i class="unhide icon"></i></a>
                    <a href="/logout" class="item">Log out<i class="red sign out icon"></i></a>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</div>