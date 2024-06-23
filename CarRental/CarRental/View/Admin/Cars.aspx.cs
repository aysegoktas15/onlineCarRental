using System;
using System.Collections.Generic;
using System.Data;
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
            ShowCars();
        }

        //Add this medhod to solve the error we were getting
        public override void VerifyRenderingInServerForm(Control control)
        {
            
        }
        private void ClearForm()
        {
            cLicenceNumber.Value = string.Empty;
            cBrand.Value = string.Empty;
            cModel.Value = string.Empty;
            cPrice.Value = string.Empty;
            cColor.Value = string.Empty;
            carAvailibity.SelectedIndex = 0; // Assuming the first item is the default selection
        }
        private void ShowCars()
        {
            // Define your query
            string query = "SELECT * FROM tblCar";

            // Fetch data from the database
            DataTable carData = _connection.GetData(query);

            // Check if data is retrieved successfully
            if (carData != null && carData.Rows.Count > 0)
            {
                // Bind data to the GridView or appropriate control
                carList.DataSource = carData;
                carList.DataBind();
            }
            else
            {
                // Handle the case where no data is returned
                // You can show a message or handle it as needed
                carList.EmptyDataText = "No cars available.";
                carList.DataBind();
            }
        }



        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(cLicenceNumber.Value) ||
                    string.IsNullOrEmpty(cBrand.Value) ||
                    string.IsNullOrEmpty(cModel.Value) ||
                    string.IsNullOrEmpty(cPrice.Value) ||
                    string.IsNullOrEmpty(cColor.Value))
                {
                    ErrorMsg.InnerText = "FILL THE INFORMATION!";
                }
                else 
                {
                    // Fetch values from form controls
                    string CarLicenceNumber = cLicenceNumber.Value;
                    string CarBrand = cBrand.Value;
                    string CarModel = cModel.Value;
                    int CarPrice = Convert.ToInt32(cPrice.Value.ToString());
                    string CarColor = cColor.Value;
                    string CarStatus = carAvailibity.SelectedValue;

                    // Parameterized query
                    string CarQuery = "INSERT INTO tblCar (carPlateNumber, carBrand, carModel, carPrice, carColor, carStatus) " +
                                      "VALUES (@CarLicenceNumber, @CarBrand, @CarModel, @CarPrice, @CarColor, @CarStatus)";

                    // Add parameters to the query
                    var parameters = new Dictionary<string, object>
                    {
                        { "@CarLicenceNumber", CarLicenceNumber },
                        { "@CarBrand", CarBrand },
                        { "@CarModel", CarModel },
                        { "@CarPrice", CarPrice },
                        { "@CarColor", CarColor },
                        { "@CarStatus", CarStatus }
                    };

                    // Execute the query
                    _connection.SetData(CarQuery, parameters);
                    // Set the success message
                    ErrorMsg.InnerText = string.Format("{0} IS ADDED!", CarLicenceNumber);
                    // Clear form fields
                    ClearForm();
                    // Rebind data to GridView
                    ShowCars();
                }
            }
            catch(Exception)
            {
                throw;
            }
        }
        
    }
}