<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="CarRental.View.Admin.Customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="myBody" runat="server">
            <style>
            .form-control {
                width: 500px; /* Adjust this value as needed */
                border-color: dimgray;
                border-width:2px;
                color:gray;
                background-color:beige;
        }
        </style>
        <div class="container-fluid">
        <div class="row">
            <div class="customerInfo">
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
                            <button type="submit" class="btn btn-warning">Edit</button>
                            <button type="submit" class="btn btn-success">Add</button>
                            <button type="submit" class="btn btn-danger">Delete</button>
                          </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <table class="table">

                </table>
            </div>
        </div>
    </div>

</asp:Content>
