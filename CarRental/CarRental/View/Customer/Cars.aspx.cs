using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRental.View.Customer
{
    public partial class Cars : System.Web.UI.Page
    {
        //Customer Module
        Models.Functions _connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            _connection = new Models.Functions();
            ShowCars();
        }
        /*
        private void ClearForm()
        {
            cLicenceNumber.Value = string.Empty;
            cBrand.Value = string.Empty;
            cModel.Value = string.Empty;
            cPrice.Value = string.Empty;
            cColor.Value = string.Empty;
            carAvailibity.SelectedIndex = 0; // Assuming the first item is the default selection
        }
        */

        //Add this medhod to solve the error we were getting
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        private void ShowCars()
        {
            string carAvailability = "Available";

            // Define your query
            string query = "SELECT * FROM tblCar WHERE carStatus ='" + carAvailability + "'";
            carList.DataSource = _connection.GetData(query);
            carList.DataBind();
        }
    }
}