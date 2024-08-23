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
        private void ClearForm()
        {
            rentStartDate.Value = string.Empty;
            rentEndDate.Value = string.Empty;
        }
        protected void btnBook_Click(object sender, EventArgs e)
        {
            /*
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
                    string CarStatus = carAvailability.SelectedValue;

                    // Check if the car exists in the database
                    string checkPlateNumber = "SELECT COUNT(1) FROM tblCar WHERE carPlateNumber = @CarLicenceNumber";
                    var checkParameters = new Dictionary<string, object>
                    {
                        { "@CarLicenceNumber", CarLicenceNumber }
                    };
                    // Check if the car already exists
                    int carExists = _connection.GetScalar(checkPlateNumber, checkParameters);

                    if (carExists == 0)
                    {
                        // Parameterized query
                        string carQuery = "INSERT INTO tblCar (carPlateNumber, carBrand, carModel, carPrice, carColor, carStatus) " +
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
                        _connection.SetData(carQuery, parameters);
                        // Set the success message
                        ErrorMsg.InnerText = string.Format("{0} IS ADDED!", CarLicenceNumber);
                        // Clear form fields
                        ClearForm();
                        // Rebind data to GridView
                        ShowCars();
                    }
                    else
                    {
                        // If the car already exists, inform the user
                        ErrorMsg.InnerText = "Car with the provided license number already exists.";
                    }
                }


            }
            catch (Exception)
            {
                throw;
            }
            */
        }

        protected void carList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}