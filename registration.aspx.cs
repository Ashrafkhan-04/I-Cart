using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class registration : System.Web.UI.Page
{
   
    protected void btnSignup_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connString = ConfigurationManager.ConnectionStrings["icartConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "INSERT INTO Users (Name, Email, Password) VALUES (@Name, @Email, @Password)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password); // plain text

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();

                        // Start session
                        Session["UserEmail"] = email;
                        Response.Redirect("Home.aspx");
                    }
                    catch (SqlException ex)
                    {
                        if (ex.Number == 2627)
                        {
                            lblMessage.Text = "Email is already registered.";
                        }
                        else
                        {
                            lblMessage.Text = "Database error: " + ex.Message;
                        }
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Visible = true;
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Visible = true;
                    }
                }
            }
        }
    }
}
