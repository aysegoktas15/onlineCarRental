<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CarRental.View.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/Libraries/css/bootstrap.min.css" />
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
                        <h3>Login Page</h3>
                    </div>
                    <div class="mb-3">
                        <label for="inputId" class="form-label">Customer Number</label>
                        <input type="text" class="form-control" id="userId" aria-describedby="numberHelp" runat="server" required="required" />
                    </div>
                    <div class="mb-3">
                        <label for="inputPassword" class="form-label">Customer Password</label>
                        <input type="password" class="form-control" id="userPassword" runat="server" required="required" />
                    </div>
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="rememberMe" runat="server" required="required" />
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                        <div class="link-container text-end">
                            <div class="links">
                                <a href="AdminLoginPage.aspx" class="form-link-label" id="link1" runat="server">Admin Entrance</a>
                            </div>
                            <div class="links">
                                <a href="ToBeUserPage.aspx" class="form-link-label" id="link2" runat="server">Register</a>
                            </div>
                        </div>
                    </div>
                    <div class="form-group d-grid ">
                        <asp:Button type="submit" id="btnLogin" CssClass="btn" Text="LOGIN" runat="server" OnClick="btnLoginUser_Click" />
                    </div>
                    <br />
                    <br />
                    <label id="lblMsg" runat="server" class="text-danger"></label>
                </form>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>

</body>
</html>
