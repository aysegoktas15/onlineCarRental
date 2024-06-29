<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="CarRental.View.Admin.Customers"  %>
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
        .customerForm-Group {
            margin-bottom: 15px;
        }
        .container-fluid {
            margin-top: 20px;
        }
        .customerInfo img {
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
            <div class="col-md-4 customerInfo">
                <div class="row">
                    <div class="col">
                        <h4 class="text-warning pe-lg-4">Manage Customers</h4>
                        <img src="../../Assets/Images/Users/user-regular-240.png" />
                    </div>
                    <div class="col"></div>
                    <div class="col"></div>
                </div>
                <div class="row">
                    <div class="col">
                        <form runat="server">
                            <div class="customerForm-Group">
                                <label for="customerId">Customer No</label> 
                                <input type="text" class="form-control" id="custId" placeholder="Enter the customer no" runat="server">
                            </div>
                            <div class="customerForm-Group">
                              <label for="customerName">Customer Name</label> 
                              <input type="text" class="form-control" id="custName" placeholder="Enter the customer name" runat="server">
                            </div>
                            <div class="customerForm-Group">
                                <label for="customerAddress">Customer Address</label>
                                <input type="text" class="form-control" id="custAddress" placeholder="Enter the customer address" runat="server">
                            </div>
                            <div class="customerForm-Group">
                                <label for="customerPhone">Customer Phone</label>
                                <input type="text" class="form-control" id="custPhone" placeholder="Enter the customer phone" runat="server">
                            </div>
                            <div class="customerForm-Group">
                                <label for="customerPhone">Customer Password</label>
                                <input type="password" class="form-control" id="custPassword" placeholder="Enter the customer password" runat="server">
                            </div>

                            <br><br>
                            <asp:Button type="submit" id="btnUpdate" class="btn btn-warning" text="Update" runat="server" width="80px"/>
                            <asp:Button type="submit" id="btnAdd" class="btn btn-success" text="Add" runat="server" width="80px" OnClick="btnAdd_Click"/>
                            <asp:Button type="submit" id="btnDelete" class="btn btn-danger" text="Delete" runat="server" width="80px"/> <br /> <br />
                            <label id="ErrorMsg" runat="server" class="text-danger"></label>

                            <div class="col-md-8">
                                <h1>Customer List</h1>
                                <asp:GridView runat="server" id="customerList" CssClass="table" BorderColor="Black" BorderWidth="2px" AutoGenerateSelectButton="True">
                                    <AlternatingRowStyle BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                                    <RowStyle BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                                    <HeaderStyle BackColor="#000000" ForeColor="White" BorderColor="Black" BorderWidth="2px" />
                                    <EditRowStyle BorderColor="Black" BorderWidth="1px" />
                                    <FooterStyle BackColor="#333333" ForeColor="White" BorderColor="Black" BorderWidth="2px" />
                                    <SelectedRowStyle BorderColor="Black" BorderWidth="4px" />
                                </asp:GridView>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
