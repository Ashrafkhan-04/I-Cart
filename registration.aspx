<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>I-Cart Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f3f3f3;
            font-family: Arial, sans-serif;
        }

        .signup-container {
            max-width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 25px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .logo {
            text-align: center;
            margin-bottom: 20px;
        }

        .logo h1 {
            margin: 0;
        }

        .form-label {
            font-weight: bold;
            font-size: 14px;
        }

        .form-control {
            border-radius: 2px;
            border: 1px solid #a6a6a6;
        }

        .btn-signup {
            background-color: #f0c14b;
            border-color: #a88734 #9c7e31 #846a29;
            color: #111;
            width: 100%;
            border-radius: 3px;
            padding: 8px;
            font-size: 14px;
        }

        .btn-signup:hover {
            background-color: #f4d078;
        }

        .error-message {
            color: #d00;
            font-size: 12px;
            margin-top: 5px;
        }

        .links {
            text-align: center;
            margin-top: 20px;
            font-size: 12px;
        }

        .links a {
            color: #0066c0;
            text-decoration: none;
        }

        .links a:hover {
            text-decoration: underline;
            color: #c45500;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="signup-container">
            <div class="logo">
                <h1>I-Cart</h1>
            </div>
            <h2>Sign Up</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>

            <div class="mb-3">
                <asp:Label ID="lblName" runat="server" Text="Your name" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Please enter your name" CssClass="error-message" Display="Dynamic" />
            </div>

            <div class="mb-3">
                <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Please enter an email" CssClass="error-message" Display="Dynamic" />
            </div>

            <div class="mb-3">
                <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="Please enter a password" CssClass="error-message" Display="Dynamic" />
            </div>

            <div class="mb-3">
                <asp:Label ID="lblConfirmPassword" runat="server" Text="Re-enter password" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" />
                <asp:CompareValidator ID="cvPasswords" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"
                    ErrorMessage="Passwords do not match" CssClass="error-message" Display="Dynamic" />
                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword"
                    ErrorMessage="Please confirm your password" CssClass="error-message" Display="Dynamic" />
            </div>

            <asp:Button ID="btnSignup" runat="server" Text="Create your I-Cart account" CssClass="btn btn-signup" OnClick="btnSignup_Click" />

            <div class="links">
                <asp:HyperLink ID="lnkSignIn" runat="server" NavigateUrl="Default.aspx" Text="Already have an account? Sign-In" />
            </div>
        </div>
    </form>
</body>
</html>
