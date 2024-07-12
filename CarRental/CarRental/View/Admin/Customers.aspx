<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="CarRental.View.Admin.Customers" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="myBody" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <style>
        .form-control {
            width: 100%;
            border-color: dimgray;
            border-width: 2px;
            color: gray;
            background-color: beige;
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
            max-width: 100%;
        }

        .col-md-8 {
            margin-top: 300px;
            width: 680px
        }

        .col-md-4 {
            width: 600px
        }

        .form-info {
            padding-top: 50px;
        }
    </style>
    <form runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 customerInfo">
                    <div class="row">
                        <div class="col manage-customer">
                            <h4 class="text-warning pe-lg-4">Manage Customers</h4>
                            <img src="../../Assets/Images/Users/user-regular-240.png" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-info">
                            <div class="customerForm-Group">
                                <label for="customerNumber">Customer Number</label>
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
                            <br /><br />
                            <asp:Button type="submit" ID="btnUpdate" class="btn btn-warning" Text="Update" runat="server" Width="80px" OnClick="btnUpdate_Click" />
                            <asp:Button type="submit" ID="btnAdd" class="btn btn-success" Text="Add" runat="server" Width="80px" OnClick="btnAdd_Click" />
                            <asp:Button type="submit" ID="btnDelete" class="btn btn-danger" Text="Delete" runat="server" Width="80px" OnClick="btnDelete_Click" />
                            <br /><br />
                            <label id="ErrorMsg" runat="server" class="text-danger"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <h1>Customer List</h1>
                    <asp:GridView runat="server" ID="customerList" CssClass="table" BorderColor="Black" BorderWidth="2px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="customerList_SelectedIndexChanged">
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
    </form>
</asp:Content>
