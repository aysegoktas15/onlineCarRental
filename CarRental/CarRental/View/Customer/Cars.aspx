<%@ Page Title="" Language="C#" MasterPageFile="~/View/Customer/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="CarRental.View.Customer.Cars" %>

<asp:Content ID="Content2" ContentPlaceHolderID="myBody" runat="server">
    <style>
        #carSearch {
            display: flex;
            flex-direction: column;
            padding-top: 50px;
            align-items: center;
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
            width: 100%;
        }

        .table-grid {
            width: 100%;
        }

        .btn-book {
            padding-top: 20px;
            display: flex;
            justify-content: flex-end;
            width: 100%;
        }

        .row {
            width: 100%;
        }

        .rent-date {
            padding-bottom: 20px;
        }

        /* Tarih Girdisinin Genel Stili */
        input[type="date"] {
            width: 100%; /* Genişlik ayarı */
            padding: 10px; /* İç boşluk */
            border: 2px solid #ccc; /* Kenarlık rengi ve kalınlığı */
            border-radius: 5px; /* Kenar yuvarlama */
            background-color: #fff; /* Arka plan rengi */
            font-size: 16px; /* Yazı tipi boyutu */
            color: #000000; /* Yazı rengi */
            border-color: #000002;
            text-align:right;
        }
            /* Hover Durumunda Stili */
            input[type="date"]:hover {
                border-color: #888; /* Kenarlık rengi */
            }
            /* Fokuslanıldığında Stili */
            input[type="date"]:focus {
                border-color: #ffd800; /* Fokuslanıldığında kenarlık rengi */
                outline: none; /* Fokuslanıldığında kenar çizgisini kaldır */
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
            <div class=" col-12 ">
                <form runat="server" id="carSearch">
                    <div class="row grid-section">
                        <asp:GridView ID="carList" class="table-grid" CssClass="table" BorderColor="Black" BorderWidth="2px" AutoGenerateSelectButton="True" runat="server">
                            <AlternatingRowStyle BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                            <RowStyle BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                            <HeaderStyle BackColor="#000000" ForeColor="White" BorderColor="Black" BorderWidth="2px" />
                            <EditRowStyle BorderColor="Black" BorderWidth="1px" />
                            <FooterStyle BackColor="#333333" ForeColor="White" BorderColor="Black" BorderWidth="2px" />
                            <SelectedRowStyle BorderColor="Black" BorderWidth="4px" />
                        </asp:GridView>
                    </div>
                    <div class="row rent-date">
                        <div class="col-4">
                            <label for="inputDate" class="form-label">Rent Start Date : </label>
                        </div>
                        <div class="col-8">
                            <input type="date" class="form-control" id="rentStartDate" runat="server" required="required" />
                        </div>
                    </div>
                    <div class="row rent-date">
                        <div class="col-4">
                            <label for="inputDate" class="form-label">Rent End Date : </label>
                        </div>
                        <div class="col-8">
                            <input type="date" class="form-control" id="rentEndDate" runat="server" required="required" />
                        </div>
                    </div>
                    <div class="row btn-book">
                        <asp:Button type="submit" ID="btnBook" class="btn btn-warning" Text="Book" runat="server" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
