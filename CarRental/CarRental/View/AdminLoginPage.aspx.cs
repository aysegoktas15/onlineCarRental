using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRental.View
{
    public partial class AdminLoginPage : System.Web.UI.Page
    {
        Models.Functions _connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            _connection = new Models.Functions();
        }
        public static string AName = "";

        protected void btnLoginAdmin_Click(object sender, EventArgs e)
        {
            string sql = "select adminMail,adminPassword from tblAdmin where adminMail = '{0}' and adminPassword= '{3}'";
            sql = string.Format(sql, adminMail.Value, adminPassword.Value);
            DataTable dt = _connection.GetData(sql);
            if(dt.Rows.Count == 0)
            {
                lblMsg.InnerText = "Invalid Admid ! ";
            }
            else
            {
                AName = dt.Rows[0][0].ToString();
            }
        }
    }
}