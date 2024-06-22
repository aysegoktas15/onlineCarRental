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
            ShowCars();
        }

        //Add this medhod to solve the error we were getting
        public override void VerifyRenderingInServerForm(Control control)
        {
            
        }

        private void ShowCars()
        {
            string Query = "select * from tblCar";
            carList.DataSource = _connection.GetData(Query);
            carList.DataBind();
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
                    
                    string CarLicenceNumber = cLicenceNumber.Value;
                    string CarBrand = cBrand.Value;
                    string CarModel = cModel.Value;
                    int CarPrice = Convert.ToInt32(cPrice.Value.ToString());
                    string CarColor = cColor.Value;
                    string CarStatus = carAvailibity.SelectedValue;
                    //string CarQuery = "insert into tblCar values {0}, {1}, {2}, {3}, {4}, {5}";
                    //CarQuery = String.Format(CarLicenceNumber, CarBrand, CarModel, CarPrice, CarColor, CarStatus);
                    //_connection.SetData(CarQuery);

                    //ErrorMsg.InnerText = "CAR IS ADDED!";


                    /*
                    string CarLicenceNumber = cLicenceNumber.Value;
                    string CarBrand = cBrand.Value;
                    string CarModel = cModel.Value;
                    int CarPrice = Convert.ToInt32(cPrice.Value);
                    string CarColor = cColor.Value;
                    string CarStatus = carAvailibity.SelectedValue;
                    */
                    // Parametreli sorgu oluşturma
                    string CarQuery = "INSERT INTO tblCar (carPlateNumber, carBrand, carModel, carPrice, carColor, carStatus) " +
                                      "VALUES (@CarLicenceNumber, @CarBrand, @CarModel, @CarPrice, @CarColor, @CarStatus)";

                    // Parametreleri ekleme
                    var parameters = new Dictionary<string, object>
                    {
                        { "@CarLicenceNumber", CarLicenceNumber },
                        { "@CarBrand", CarBrand },
                        { "@CarModel", CarModel },
                        { "@CarPrice", CarPrice },
                        { "@CarColor", CarColor },
                        { "@CarStatus", CarStatus }
                    };

                    _connection.SetData(CarQuery, parameters);

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