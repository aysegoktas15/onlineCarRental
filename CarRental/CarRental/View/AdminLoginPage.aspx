<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLoginPage.aspx.cs" Inherits="CarRental.View.AdminLoginPage" %>

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
                        <img src="../Assets/Images/Cars/car.png"/>
                        <h3>Admin Login Page</h3>
                    </div>
                    <div class="mb-3">
                        <label for="inputEmail" class="form-label">Admin Email Address</label>
                        <input type="email" class="form-control" id="adminMail" aria-describedby="emailHelp" />
                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                    </div>
                    <div class="mb-3">
                        <label for="inputPassword" class="form-label">Admin Password</label>
                        <input type="password" class="form-control" id="adminPassword" />
                    </div>
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="rememberMe" runat="server" />
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                        <div class="col text-end">
                            <a href="LoginPage.aspx" class="form-link-label" id="userLink" runat="server">User Entrance</a>
                        </div>
                    </div>
                    <div class="form-group d-grid ">
                        <button type="submit" class="btn">LOGIN</button>
                    </div>
                </form>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>

</body>
</html>
