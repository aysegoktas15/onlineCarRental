using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRental.View.Admin
{
    public partial class Cars : System.Web.UI.Page
    {
        Models.Functions _connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            _connection = new Models.Functions();

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (cLicenceNumber.Value == "" || cBrand.Value =="" || cModel.Value == "" || cPrice.Value == "" || cColor.Value == "" )
                {
                    ErrorMsg.InnerText = "FILL THE INFORMATION!";
                } 
                else 
                {
                    string CarLicenceNumber = cLicenceNumber.Value;
                    string CarBrand = cBrand.Value;
                    string CarModel = cModel.Value;
                    int CarPrice = Convert.ToInt32(cPrice.Value.ToString());
                    string CarColor = cColor.Value;
                    string CarStatus = carAvailibity.SelectedValue;
                    string CarQuery = "insert into tblCar values {0}, {1}, {2}, {3}, {4}, {5}";
                    CarQuery = String.Format(CarLicenceNumber, CarBrand, CarModel, CarPrice, CarColor, CarStatus);
                    _connection.SetData(CarQuery);

                    ErrorMsg.InnerText = "CAR IS ADDED!";
                }
            }
            catch(Exception)
            {
                throw;
            }

        }
    }
}