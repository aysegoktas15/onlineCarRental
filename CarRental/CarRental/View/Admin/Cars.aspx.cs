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
        private void ClearForm()
        {
            cLicenceNumber.Value = string.Empty;
            cBrand.Value = string.Empty;
            cModel.Value = string.Empty;
            cPrice.Value = string.Empty;
            cColor.Value = string.Empty;
            carAvailibity.SelectedIndex = 0; // Assuming the first item is the default selection
        }

        //Add this medhod to solve the error we were getting
        public override void VerifyRenderingInServerForm(Control control)
        {
            
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

                    // Check if the car exists in the database
                    string checkPlateNumber = "SELECT COUNT(1) FROM tblCar WHERE carPlateNumber = @CarLicenceNumber";
                    var checkParameters = new Dictionary<string, object>
                    {
                        { "@CarLicenceNumber", CarLicenceNumber }
                    };
                    // Check if the car already exists
                    int carExists = _connection.GetScalar(checkPlateNumber, checkParameters);

                    if(carExists == 0)
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
            catch(Exception)
            {
                throw;
            }
        }

        //string Key = "";
        protected void carList_SelectedIndexChanged(object sender, EventArgs e)
        {
            cLicenceNumber.Value = carList.SelectedRow.Cells[1].Text;
            cBrand.Value = carList.SelectedRow.Cells[2].Text;
            cModel.Value = carList.SelectedRow.Cells[3].Text;
            cPrice.Value = carList.SelectedRow.Cells[4].Text;
            cColor.Value = carList.SelectedRow.Cells[5].Text;
            carAvailibity.SelectedValue = carList.SelectedRow.Cells[6].Text;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(cLicenceNumber.Value))
                {
                    ErrorMsg.InnerText = "MISS THE INFORMATION!";
                }
                else
                {
                    // Fetch values from form controls
                    string CarLicenceNumber = cLicenceNumber.Value;

                    // Parameterized query
                    string CarQuery = "DELETE FROM tblCar WHERE carPlateNumber = @CarLicenceNumber";

                    // Add parameters to the query
                    var parameters = new Dictionary<string, object>
                    {
                        { "@CarLicenceNumber", CarLicenceNumber },
                    };

                    // Execute the query
                    int affectedRows = _connection.SetData(CarQuery, parameters);

                    if (affectedRows > 0)
                    {
                        // Set the success message
                        ErrorMsg.InnerText = string.Format("{0} IS DELETED!", CarLicenceNumber);
                        // Clear form fields
                        ClearForm();
                        // Rebind data to GridView
                        ShowCars();
                    }
                    else
                    {
                        // Handle the case where no rows were affected
                        ErrorMsg.InnerText = "No record found to delete.";
                    }
                }
            }
            catch (Exception ex)
            {
                // Log or handle the exception as needed
                ErrorMsg.InnerText = "An error occurred: " + ex.Message;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
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
                    int CarPrice = Convert.ToInt32(cPrice.Value);
                    string CarColor = cColor.Value;
                    string CarStatus = carAvailibity.SelectedValue;


                    // Corrected SQL Update statement
                    string CarQuery = "UPDATE tblCar SET carBrand = @CarBrand, carModel = @CarModel, carPrice = @CarPrice, carColor = @CarColor, carStatus = @CarStatus " +
                                      "WHERE carPlateNumber = @CarLicenceNumber";

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
                    ErrorMsg.InnerText = string.Format("{0} IS UPDATED!", CarLicenceNumber);

                    // Clear form fields
                    ClearForm();

                    // Rebind data to GridView
                    ShowCars();
                }
            }
            catch (Exception ex)
            {
                // Log exception (log to a file, database, etc.)
                ErrorMsg.InnerText = "An error occurred while updating the car information. Please try again later.";
            }
        }
    }
}