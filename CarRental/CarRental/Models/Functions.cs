using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
            _dataTable = new DataTable();
            try
            {
                _connection.Open(); // Open the connection
                _adapter = new SqlDataAdapter(Query, _connection);
                _adapter.Fill(_dataTable); // Fill the DataTable with the results of the query
            }
            catch (Exception ex)
            {
                // Log or handle the exception as needed
                throw new Exception("An error occurred while fetching data: " + ex.Message);
            }
            finally
            {
                _connection.Close(); // Ensure the connection is closed even if an exception occurs
            }

            return _dataTable; // Return the populated DataTable
        }

        // Method to execute an INSERT, UPDATE, or DELETE query and return the number of affected rows

        public int SetData(string query, Dictionary<string, object> parameters)
        {
            int affectedRows = 0;

            using (SqlConnection _connection = new SqlConnection(_connectionStr))
            {
                using (SqlCommand command = new SqlCommand(query, _connection))
                {
                    foreach (var parameter in parameters)
                    {
                        command.Parameters.AddWithValue(parameter.Key, parameter.Value);
                    }

                    try
                    {
                        _connection.Open();
                        affectedRows = command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        // Log or handle the exception as needed
                        throw new Exception("An error occurred while executing the command: " + ex.Message);
                    }
                    finally
                    {
                        _connection.Close(); // Ensure the connection is closed even if an exception occurs
                    }
                }
            }
            return affectedRows;
        }

        // Method to execute a scalar query and return a single value
        public int GetScalar(string query, Dictionary<string, object> parameters)
        {
            int result = 0;

            using (SqlConnection _connection = new SqlConnection(_connectionStr))
            {
                using (SqlCommand command = new SqlCommand(query, _connection))
                {
                    foreach (var parameter in parameters)
                    {
                        command.Parameters.AddWithValue(parameter.Key, parameter.Value);
                    }

                    try
                    {
                        _connection.Open();
                        result = Convert.ToInt32(command.ExecuteScalar());
                    }
                    catch (Exception ex)
                    {
                        // Log or handle the exception as needed
                        throw new Exception("An error occurred while executing the command: " + ex.Message);
                    }
                    finally
                    {
                        _connection.Close(); // Ensure the connection is closed even if an exception occurs
                    }
                }
            }
            return result;
        }

    }
}