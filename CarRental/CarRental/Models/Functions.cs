using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CarRental.Models
{
    public class Functions
    {
        // Private fields for database connection, command, DataTable, connection string, and data adapter
        private SqlConnection _connection;
        private SqlCommand _command;
        private DataTable _dataTable;
        private string _connectionStr;
        private SqlDataAdapter _adapter;

        // Constructor to initialize the connection string and setup the SqlConnection and SqlCommand
        public Functions()
        {
            _connectionStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\ASUS\Documents\OnlineCarRental.mdf;Integrated Security=True;Connect Timeout=30;"; // Initialize the connection string (should be replaced with actual connection string)
            _connection = new SqlConnection(_connectionStr); // Initialize the SqlConnection with the connection string
            _command = new SqlCommand(); // Initialize the SqlCommand object
            _command.Connection = _connection; // Set the connection for the command
        }

        // Method to execute a SELECT query and return the results in a DataTable
        public DataTable GetData (string Query)
        {
            _dataTable = new DataTable(); // Initialize a new DataTable to hold the results
            _adapter = new SqlDataAdapter(Query, _connectionStr); // Initialize the SqlDataAdapter with the query and connection string
            _adapter.Fill(_dataTable); // Fill the DataTable with the results of the query

            return _dataTable; // Return the populated DataTable
        }

        // Method to execute an INSERT, UPDATE, or DELETE query and return the number of affected rows
        /*
        public int SetData (string Query)
        {
            int rent = 0;// Variable to hold the number of affected rows

            // Check if the connection is closed, if so, open it
            if (_connection.State == ConnectionState.Closed)
            {
                _connection.Open();
            }

            _command.CommandText = Query; // Set the command text to the provided query
            rent = _command.ExecuteNonQuery(); // Execute the query and get the number of affected rows
            _connection.Close(); // Close the connection

            return rent; // Return the number of affected rows
        }
        */
        public int SetData(string query, Dictionary<string, object> parameters)
        {
            int affectedRows = 0;

            using (SqlConnection connection = new SqlConnection(_connectionStr))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    foreach (var parameter in parameters)
                    {
                        command.Parameters.AddWithValue(parameter.Key, parameter.Value);
                    }

                    connection.Open();
                    affectedRows = command.ExecuteNonQuery();
                }
            }

            return affectedRows;
        }

    }
}