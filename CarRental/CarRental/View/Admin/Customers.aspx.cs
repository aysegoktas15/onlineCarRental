using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRental.View.Admin
{
    public partial class Customers : System.Web.UI.Page
    {
        Models.Functions _connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            _connection = new Models.Functions();
            ShowCustomers();
        }
        private void ClearForm()
        {
            custId.Value = string.Empty;
            custName.Value = string.Empty;
            custAddress.Value = string.Empty;
            custPhone.Value = string.Empty;
            custPassword.Value = string.Empty;
        }
        private void ShowCustomers()
        {
            // Define your query
            string query = "SELECT * FROM tblCustomer";

            // Fetch data from the database
            DataTable customerData = _connection.GetData(query);

            // Check if data is retrieved successfully
            if (customerData != null && customerData.Rows.Count > 0)
            {
                // Bind data to the GridView or appropriate control
                customerList.DataSource = customerData;
                customerList.DataBind();
            }
            else
            {
                // Handle the case where no data is returned
                // You can show a message or handle it as needed
                customerList.EmptyDataText = "No cars available.";
                customerList.DataBind();
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(custId.Value) || 
                    string.IsNullOrEmpty(custName.Value) ||
                    string.IsNullOrEmpty(custAddress.Value) ||
                    string.IsNullOrEmpty(custPhone.Value) ||
                    string.IsNullOrEmpty(custPassword.Value))
                {
                    ErrorMsg.InnerText = "FILL THE INFORMATION!";
                }
                else
                {
                    // Fetch values from form controls
                    string CustomerId = custId.Value;
                    string CustomerName = custName.Value;
                    string CustomerAddress = custAddress.Value;
                    string CustomerPhone = custPhone.Value;
                    string CustomerPassword = custPassword.Value;

                    // Check if the customer exists in the database
                    string checkCustomerId = "SELECT COUNT(1) FROM tblCustomer WHERE customerId = @CustomerId";
                    var checkParameters = new Dictionary<string, object>
                    {
                        { "@CustomerId", CustomerId }
                    };
                    // Check if the customer already exists
                    int customerExists = _connection.GetScalar(checkCustomerId, checkParameters);

                    if (customerExists == 0)
                    {
                        // Parameterized query
                        string customerQuery = "INSERT INTO tblCustomer (customerId, customerName, customerAdd, customerPhone, customerPassword) " +
                                          "VALUES (@CustomerId, @CustomerName, @CustomerAddress, @CustomerPhone, @CustomerPassword)";

                        // Add parameters to the query
                        var parameters = new Dictionary<string, object>
                        {
                            { "@CustomerId", CustomerId },
                            { "@CustomerName", CustomerName },
                            { "@CustomerAddress", CustomerAddress },
                            { "@CustomerPhone", CustomerPhone },
                            { "@CustomerPassword", CustomerPassword }
                        };

                        // Execute the query
                        _connection.SetData(customerQuery, parameters);
                        // Set the success message
                        ErrorMsg.InnerText = string.Format("{0} IS ADDED!", CustomerId);
                        // Clear form fields
                        ClearForm();
                        // Rebind data to GridView
                        ShowCustomers();
                    }
                    else
                    {
                        // If the customer already exists, inform the user
                        ErrorMsg.InnerText = "Customer with the provided id number already exists.";
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}