using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace E_Commerce_Web
{
    public partial class Default : System.Web.UI.Page
    {
        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text.Trim();

                // TODO: Hash password if hashed on registration

                string connString = ConfigurationManager.ConnectionStrings["icartConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email AND Password = @Password";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);

                        try
                        {
                            conn.Open();
                            int count = (int)cmd.ExecuteScalar();

                            if (count > 0)
                            {
                                lblError.Visible = false;
                                Session["UserEmail"] = email;
                                Response.Redirect("Home.aspx"); // change to your post-login page
                            }
                            else
                            {
                                lblError.Text = "Invalid email or password.";
                                lblError.Visible = true;
                            }
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = "Error: " + ex.Message;
                            lblError.Visible = true;
                        }
                    }
                }
            }
        }
    }
}
