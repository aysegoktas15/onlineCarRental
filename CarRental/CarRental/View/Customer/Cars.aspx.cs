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
        Models.Functions _connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            _connection = new Models.Functions();
            //ShowCars();
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
            string CarAvailability = carAvailability.SelectedValue;

            // Define your query
            string query = "SELECT * FROM tblCar WHERE carStatus = @CarAvailability";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@CarAvailability", CarAvailability)
            };


            // Fetch data from the database
            DataTable carData = _connection.GetData(query,parameters);


            // Check if data is retrieved successfully
            if (carData != null && carData.Rows.Count > 0)
            {
                // Bind data to the GridView or appropriate control
                carList.DataSource = carData;
                carList.DataBind();

            }
            else
            {
                carList.DataSource = null;
                carList.EmptyDataText = "No cars available.";
                carList.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ShowCars();
        }
    }
}