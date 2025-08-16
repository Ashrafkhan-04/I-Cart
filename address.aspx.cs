using System;
using System.Net;
using System.Net.Mail;

public partial class address : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserEmail"] == null)
        {
            Response.Redirect("Default.aspx");
        }

    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
    protected void btnSendEmail_Click(object sender, EventArgs e)
    {
        // Sender Gmail (App password required)
        string fromEmail = "ashrrrrf.04@gmail.com";
        string appPassword = "mnqoziqqfmowkics"; // App password

        // Get values from form
        string fullName = txtFullName.Text.Trim();
        string addressLine = txtAddress.Text.Trim();
        string mobile = txtMobile.Text.Trim();
        string pincode = txtPincode.Text.Trim();
        string toEmail = txtEmail.Text.Trim();

        // Email subject and body (includes all user input)
        string subject = "Your iCart Order Awaits 🛒 !!";
        string body =
 "Dear " + fullName + ",\n\n" +
 "Order your favorite products in just a few clicks:\n\n"+
"1️⃣ Browse on iCart.com\n"+
"2️⃣ Add items to your cart 🛒\n" +
"3️⃣ Checkout & enjoy fast delivery 🚚\n\n" +

"Special Welcome Offer: Use code WELCOME10 for 10% OFF your first order.\n" +

"Start shopping today and let us bring your favorites right to your doorstep.\n\n" +

"Shop Now: iCart.com\n\n" +

"Best regards,\n" +
"The iCart.com Team\n" +
 "Here are your details:\n\n" +
 "---------------------------------------\n" +
 "Full Name : " + fullName + "\n" +
 "Address   : " + addressLine + "\n" +
 "Pincode   : " + pincode + "\n" +
 "Mobile    : " + mobile + "\n" +
 "Email     : " + toEmail + "\n" +
 "---------------------------------------\n\n" +
 "We appreciate your trust in us and look forward to serving you again.\n" +
 "Stay connected for exciting offers and updates!\n\n" +
 "Best Regards,\n" +
 "iCart Team";

        try
        {
            // Validation
            if (string.IsNullOrWhiteSpace(fullName) || string.IsNullOrWhiteSpace(addressLine) ||
                string.IsNullOrWhiteSpace(mobile) || string.IsNullOrWhiteSpace(pincode) || string.IsNullOrWhiteSpace(toEmail))
            {
                lblStatus.Text = "⚠ Please fill in all fields before placing the order.";
                lblStatus.ForeColor = System.Drawing.Color.Orange;
                return;
            }

            // Send Email
            MailMessage message = new MailMessage();
            message.From = new MailAddress(fromEmail);
            message.To.Add(toEmail);
            message.Subject = subject;
            message.Body = body;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new NetworkCredential(fromEmail, appPassword);
            smtp.EnableSsl = true;
            smtp.Send(message);

            lblStatus.Text = "✅ Order placed! A confirmation email has been sent.";
            lblStatus.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception ex)
        {
            lblStatus.Text = "❌ Failed to send confirmation: " + ex.Message;
            lblStatus.ForeColor = System.Drawing.Color.Red;
        }

        // Redirect to success page
        Response.Redirect("success.aspx");
    }
}
