<%@ Page Title="" Language="C#" MasterPageFile="~/View/Customer/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="CarRental.View.Customer.Cars" %>

<asp:Content ID="Content2" ContentPlaceHolderID="myBody" runat="server">
    <style>
        #carSearch {
            display:flex;
            flex-direction:row;
            padding-top:50px;
        }
        .row + h3 {
            padding-top:20px;
        }
    </style>
    <div class="container-fluid">
        <div class="row">
            <div></div>
            <div>Image Here</div>
            <div></div>
        </div>
        <div class="row">
            <div></div>
            <div>Available Cars</div>
            <div></div>
        </div>
        <div class="row">
            <div class="col">
                Content Here
                <form runat="server" id="carSearch">
                    <div class="col-md-6 col-sm-12">
                        <asp:DropDownList class="form-control" id="carAvailibity" runat="server">
                            <asp:ListItem>Available</asp:ListItem>
                            <asp:ListItem>Booked</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button type="submit" id="btnSearch" class="btn btn-warning" Text="Update" runat="server" Width="80px" />
                    </div>
                    <h3>Car List</h3>
                    <div class="col-md-6 col-sm-12">
                        <asp:GridView ID="carList" CssClass="table" BorderColor="Black" BorderWidth="2px" AutoGenerateSelectButton="True" runat="server">
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
</asp:Content>
