<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="CarRental.View.Admin.Cars" EnableEventValidation="false"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="myBody" runat="server">
    <style>
        .form-control {
            width: 100%; /* Adjusted to be responsive */
            border-color: dimgray;
            border-width: 2px;
            color: gray;
            background-color: beige;
        }
        .btn {
            margin-right: 10px;
        }
        .carForm-Group {
            margin-bottom: 15px;
        }
        .container-fluid {
            margin-top: 20px;
        }
        .carInfo img {
            max-width: 100%; /* Make the image responsive */
        }
        .col-md-8 {
            margin-top: 300px;
            width:680px
        }
        .col-md-4 {
            width:600px
        }
        .form-info {
            padding-top: 50px;
        }

    </style>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <div class="row">
                    <div class="col manage-car">
                        <h4 class="text-warning pe-lg-4">Manage Cars</h4>
                        <img src="../../Assets/Images/Cars/sportsCar1.jpg" />
                    </div>
                </div>
                <div class="row">
                    <div class="col form-info">
                        <form runat="server">
                            <div class="carForm-Group">
                                <label for="carLicenceNumber">Licence Number</label>
                                <input type="text" class="form-control" id="cLicenceNumber" placeholder="Enter the plate number" runat="server">
                            </div>
                            <div class="carForm-Group">
                                <label for="carBrand">Brand</label>
                                <input type="text" class="form-control" id="cBrand" placeholder="Enter the brand" runat="server">
                            </div>
                            <div class="carForm-Group">
                                <label for="carModel">Model</label>
                                <input type="text" class="form-control" id="cModel" placeholder="Enter the model" runat="server">
                            </div>
                            <div class="carForm-Group">
                                <label for="carPrice">Price</label>
                                <input type="text" class="form-control" id="cPrice" placeholder="Enter the price" runat="server">
                            </div>
                            <div class="carForm-Group">
                                <label for="carColor">Color</label>
                                <input type="text" class="form-control" id="cColor" placeholder="Enter the color" runat="server">
                            </div>
                            <div class="carForm-Group">
                                <label for="carAvailable">Available</label><br />
                                <asp:DropDownList class="form-control" ID="carAvailibity" runat="server">
                                    <asp:ListItem>Available</asp:ListItem>
                                    <asp:ListItem>Booked</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <br><br>
                            <asp:Button type="submit" id="btnUpdate" class="btn btn-warning" text="Update" runat="server" width="80px" OnClick="btnUpdate_Click"/>
                            <asp:Button type="submit" id="btnAdd" class="btn btn-success" text="Add" runat="server" width="80px" OnClick="btnAdd_Click"/>
                            <asp:Button type="submit" id="btnDelete" class="btn btn-danger" text="Delete" runat="server" width="80px" OnClick="btnDelete_Click"/> <br /> <br />
                            <label id="ErrorMsg" runat="server" class="text-danger"></label>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <h1>Car List</h1>
                <asp:GridView runat="server" id="carList" CssClass="table" BorderColor="Black" BorderWidth="2px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="carList_SelectedIndexChanged">
                    <AlternatingRowStyle BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                    <RowStyle BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                    <HeaderStyle BackColor="#000000" ForeColor="White" BorderColor="Black" BorderWidth="2px" />
                    <EditRowStyle BorderColor="Black" BorderWidth="1px" />
                    <FooterStyle BackColor="#333333" ForeColor="White" BorderColor="Black" BorderWidth="2px" />
                    <SelectedRowStyle BorderColor="Black" BorderWidth="4px" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
