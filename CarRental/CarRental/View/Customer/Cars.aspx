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
            background-color:grey;
            width:200px;
            height:200px;
            border-radius:0;
            border:2px;
        }
        .form-control {

        }
    </style>

    <div class="container-fluid">

        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-3" id="car-box">Image Here</div>
            <div class="col-md-3"></div>
            <div class="col-md-3"></div>
        </div>

        <div class="row">
            <div class="col-md-3"></div>
            <div class="col"></div>
            
        </div>

        <div class="row">
            <div class="col">
                Content Here
                <form runat="server" id="carSearch">
                    <div class="row">
                       

                        <div class="col-md-6 col-sm-12 grid-section">
                            <h3>Car List</h3>
                            <asp:GridView ID="carList" class="table-grid" CssClass="table" BorderColor="Black" BorderWidth="2px" AutoGenerateSelectButton="True" runat="server">
                                <AlternatingRowStyle BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                                <RowStyle BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                                <HeaderStyle BackColor="#000000" ForeColor="White" BorderColor="Black" BorderWidth="2px" />
                                <EditRowStyle BorderColor="Black" BorderWidth="1px" />
                                <FooterStyle BackColor="#333333" ForeColor="White" BorderColor="Black" BorderWidth="2px" />
                                <SelectedRowStyle BorderColor="Black" BorderWidth="4px" />
                            </asp:GridView>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</asp:Content>
