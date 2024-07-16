<%@ Page Title="" Language="C#" MasterPageFile="~/View/Customer/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="CarRental.View.Customer.Cars" %>

<asp:Content ID="Content2" ContentPlaceHolderID="myBody" runat="server">
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
                <form runat="server">
                    <asp:DropDownList class="form-control" ID="carAvailibity" runat="server">
                        <asp:ListItem>Available</asp:ListItem>
                        <asp:ListItem>Booked</asp:ListItem>
                    </asp:DropDownList>
                </form>
            </div>
        </div>

    </div>
</asp:Content>
