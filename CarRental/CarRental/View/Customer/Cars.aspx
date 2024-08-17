<%@ Page Title="" Language="C#" MasterPageFile="~/View/Customer/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="CarRental.View.Customer.Cars" %>

<asp:Content ID="Content2" ContentPlaceHolderID="myBody" runat="server">
    <style>
        #carSearch {
            display: flex;
            align-items: baseline;
            padding-top: 50px;
            flex-direction: row;
        }

        #car-box {
            /*background-color: grey;*/
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .top-image {
            margin-top: 20px;
        }

        .form-control {
        }

        .grid-section {
            display: flex;
            justify-content: center;
        }

        .table-grid {
            width: 100%;
        }
    </style>

    <div class="container-fluid">
        <div class="row top-image">
            <div class="col-md-4"></div>
            <div class="mx-auto" id="car-box">
                <img src="../../Assets/Images/Cars/sportsCar2.jpg" />
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="row">
            <div class="col-12 text-center">
                <h3>Available Cars</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-12 text-center">
                <h4>Car List</h4>
            </div>
        </div>
        <div class="row">
            <div class=" col-sm-1 col-md-2 col-lg-3"></div>
            <div class=" col-sm-10 col-md-8 col-lg-6">
                <form runat="server" id="carSearch">
                    <div class="row">
                        <div class="col-12 grid-section">
                            <asp:GridView ID="carList" class="table-grid" CssClass="table" BorderColor="Black" BorderWidth="2px" AutoGenerateSelectButton="True" runat="server">
                                <AlternatingRowStyle BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                                <RowStyle BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                                <HeaderStyle BackColor="#000000" ForeColor="White" BorderColor="Black" BorderWidth="2px" />
                                <EditRowStyle BorderColor="Black" BorderWidth="1px" />
                                <FooterStyle BackColor="#333333" ForeColor="White" BorderColor="Black" BorderWidth="2px" />
                                <SelectedRowStyle BorderColor="Black" BorderWidth="4px" />
                            </asp:GridView>
                        </div>
                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-2"> <label for="inputDate" class="form-label">Rent Date : </label></div>
                            <div class="col-8">
                                
                                <input type="date" class="form-control" id="rentDate" runat="server" required="required" />
                            </div>
                        </div>
                        <div class="row"></div>
                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-8"></div>
                            <div class="col-2">
                                <asp:Button type="submit" ID="btnBook" class="btn btn-warning" Text="Book" runat="server" Width="80px" />
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <div class=" col-sm-1 col-md-2 col-lg-3"></div>
        </div>
    </div>
</asp:Content>
