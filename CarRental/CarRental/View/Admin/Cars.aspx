<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="CarRental.View.Admin.Cars" %>
<asp:Content ID="Content1" ContentPlaceHolderID="myBody" runat="server">
        <style>
            .form-control {
                width: 500px; /* Adjust this value as needed */
                border-color: dimgray;
                border-width:2px;
                color:gray;
                background-color:beige;
            }
            .btn {
                margin-right: 10px;
            }
            
        </style>
        <div class="container-fluid">
        <div class="row">
            <div class="carInfo">
                <div class="row">
                    <div class="col">
                        <h4 class="text-warning pe-lg-4">Manage Cars</h4>
                        <img src="../../Assets/Images/Cars/sportsCar1.jpg" />
                    </div>
                    <div class="col"></div>
                    <div class="col"></div>
                </div>
                <div class="row">
                    <div class="col">
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
                                <!-- Added these -->
                                <asp:DropDownList class="form-control" ID="carAvailibity" runat="server">
                                    <asp:ListItem>Available</asp:ListItem>
                                    <asp:ListItem>Booked</asp:ListItem>
                                </asp:DropDownList>

                            </div><br><br>
                            <label id="ErrorMsg" runat="server"></label>
                            <asp:Button type="submit" id="btnEdit" class="btn btn-warning" text="Edit" runat="server" width="80px"/>
                            <asp:Button type="submit" id="btnAdd" class="btn btn-success" text="Add" runat="server" width="80px" OnClick="btnAdd_Click"/>
                            <asp:Button type="submit" id="btnDelete" class="btn btn-danger" text="Delete" runat="server" width="80px"/>
                            <!-- 
                            <button type="submit" class="btn btn-warning">Edit</button>
                            <button type="submit" class="btn btn-success">Add</button>
                            <button type="submit" class="btn btn-danger">Delete</button>
                                -->
                          </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <h1>Car List</h1>
                <asp:Gridview runat="server" id="carList" Class="table" >
                    <AlternatingRowStyle BorderStyle="None" />

                    <EditRowStyle BackColor="#FFFF66" BorderColor="Gray" BorderWidth="2px" />

                </asp:Gridview>
            </div>
        </div>
    </div>
</asp:Content>

