using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace CarRental.View
{
    public partial class LoginPage : System.Web.UI.Page
    {
        Models.Functions _connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            _connection = new Models.Functions();
        }
        #region  Method to Clear Form
        private void ClearForm()
        {
            userId.Value = string.Empty;
            userPassword.Value = string.Empty;
        }
        #endregion

        #region Methot to Login UserPage
        public static string UName = "";
        protected void btnLoginUser_Click(object sender, EventArgs e)
        {
            try
            {
                string sql = "select userId,userPassword from tblCustomer where customerId = '{0}' and  customerPassword = '{4}'";
                sql = string.Format(sql, userId.Value, userPassword.Value);
                DataTable dt = _connection.GetData(sql);
                if (dt.Rows.Count == 0)
                {
                    lblMsg.InnerText = "Invalid User ! ";
                }
                else
                {
                    UName = dt.Rows[0][0].ToString();
                    //Response.Redirect("Customer/Cars.aspx");
                }
            }
            catch (Exception ex)
            {
                lblMsg.InnerText = "Error ! ";
            }
            ClearForm();
        }
        #endregion
    }
}