<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="CarRental.View.Admin.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="myBody" runat="server">
    <style>
        .container-fluid {
            color:gray;
        }
        .img-car {
            margin-bottom:20px;
        }
        .img-car:hover {
            transform:scale(1.2);
        }
        .welcome {
            color:black;
        }
    </style>
    <div class="container-fluid">
        <div class="row">
            <div class="jumbotron jumbotron-fluid bg-warning"></div>
            <div class="welcome bg-warning">
                <h1 class="display-4">Welcome In The Admin Panel</h1>
                <p class="lead">ONLY The Admin Can Manage Cars, Customers, Rentals and Returns</p>
            </div>
        </div>
        <br /><br />
        <div class="row">
            <div class="col-lg-3">
                <div>
                    <img src="../../Assets/Images/Cars/car1-mercedes-bez-coope.jpg" class="img-car" width="300px">
                    <div><h6>Mercedes Benz - Coope</h6></div>
                </div>
            </div>
            <div class="col-lg-3">
                <div>
                    <img src="../../Assets/Images/Cars/car2-volvo-stationWagon.jpg" alt="" class="img-car" width="300px">
                    <div><h6>Volvo - Station Wagon</h6></div>
                </div>
            </div>
            <div class="col-lg-3">
                <div>
                    <img src="../../Assets/Images/Cars/car3-hyundai-sport-utility-vehicle-suv.jpg" alt="" class="img-car" width="300px">
                    <div><h6>Hyundai - Sport Utility Vehicle (SUV)</h6></div>
                </div>
            </div>
            <div class="col-lg-3">
                <div>
                    <img src="../../Assets/Images/Cars/car4-chrysler-pacifica-minivan.jpg" alt="" class="img-car" width="300px">
                    <div><h6>Chrysler Pasifica - Minivan</h6></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div>
                    <img src="" alt="">
                    <div><h6>Car Name</h6></div>
                </div>
            </div>
            <div class="col-lg-3">
                <div>
                    <img src="" alt="">
                    <div><h6>Car Name</h6></div>
                </div>
            </div>
            <div class="col-lg-3">
                <div>
                    <img src="" alt="">
                    <div><h6>Car Name</h6></div>
                </div>
            </div>
            <div class="col-lg-3">
                <div>
                    <img src="" alt="">
                    <div><h6>Car Name</h6></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
