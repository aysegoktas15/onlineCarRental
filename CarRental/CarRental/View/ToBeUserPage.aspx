<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ToBeUserPage.aspx.cs" Inherits="CarRental.View.ToBeUserPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/Libraries/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../Assets/Images/Cars/car.png" />
    <link rel="stylesheet" href="../Assets/Css/loginPage.css" />

</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <form class="login-form" runat="server">
                    <div class="head-div">
                        <img src="../Assets/Images/Cars/car.png" />
                        <h3>Register Page</h3>
                    </div>
                    <div class="mb-3">
                        <label for="inputUserNumber" class="form-label">Customer Number</label>
                        <input type="text" class="form-control" id="userId" aria-describedby="numberHelp" runat="server" required="required" />
                        <div id="userHelp" class="form-text">(Please enter your licence number)</div>
                    </div>
                    <div class="mb-3">
                        <label for="inputUserName" class="form-label">Customer Name</label>
                        <input type="text" class="form-control" id="userName" runat="server" required="required" />
                    </div>
                    <div class="mb-3">
                        <label for="inputUserAddress" class="form-label">Customer Address</label>
                        <input type="text" class="form-control" id="userAddress" runat="server" required="required" />
                    </div>
                    <div class="mb-3">
                        <label for="inputUserPhone" class="form-label">Customer Phone</label>
                        <input type="text" class="form-control" id="userPhone" runat="server" required="required" />
                    </div>
                    <div class="mb-3">
                        <label for="inputPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="userPassword" runat="server" required="required" />
                    </div>
                    <div class="mb-3">
                        <label for="inputPassword" class="form-label">Re-Password</label>
                        <input type="password" class="form-control" id="userRePassword" runat="server" required="required" />
                    </div>
                    <div class="mb-3 form-check">
                        <div class="checkbox-container">
                            <input type="checkbox" class="form-check-input" id="rememberMe" runat="server" />
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                        </div>
                        <div class="link-container text-end">
                            <div class="links">
                                <a href="AdminLoginPage.aspx" class="form-link-label" id="link1" runat="server">Admin Entrance</a>
                            </div>
                            <div class="links">
                                <a href="LoginPage.aspx" class="form-link-label" id="link2" runat="server">User Entrance</a>
                            </div>
                        </div>
                    </div>
                    <div class="form-group d-grid ">
                        <asp:Button type="submit" ID="btnLoginUser" CssClass="btn" Text="LOGIN" runat="server" />
                    </div>
                </form>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>

</body>
</html>
