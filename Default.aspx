<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="E_Commerce_Web.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>I-Cart Sign-In</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f3f3f3;
            font-family: Arial, sans-serif;
        }
        .login-container {
            max-width: 350px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .logo {
            text-align: center;
            margin-bottom: 20px;
        }
        .logo img {
            width: 100px;
        }
        .form-label {
            font-weight: bold;
            font-size: 14px;
        }
        .form-control {
            border-radius: 2px;
            border: 1px solid #a6a6a6;
        }
        .btn-signin {
            background-color: #f0c14b;
            border-color: #a88734 #9c7e31 #846a29;
            color: #111;
            width: 100%;
            border-radius: 3px;
            padding: 8px;
            font-size: 14px;
        }
        .btn-signin:hover {
            background-color: #f4d078;
        }
        .form-check-label {
            font-size: 13px;
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
        .error-message {
            color: #d00;
            font-size: 12px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="logo">
                <h1>I-Cart</h1>
            </div>
            <h2>Sign-In</h2>
            <asp:Label ID="lblError" runat="server" CssClass="error-message" Visible="false"></asp:Label>
            <div class="mb-3">
                <asp:Label ID="lblEmail" runat="server" Text="Email or mobile phone number" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Please enter an email or phone number" CssClass="error-message" Display="Dynamic" />
            </div>
            <div class="mb-3">
                <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="Please enter a password" CssClass="error-message" Display="Dynamic" />
            </div>
            <div class="mb-3 form-check">
                <asp:CheckBox ID="chkKeepSignedIn" runat="server" CssClass="form-check-input" />
                <asp:Label ID="lblKeepSignedIn" runat="server" AssociatedControlID="chkKeepSignedIn" Text="Keep me signed in" CssClass="form-check-label"></asp:Label>
            </div>
            <asp:Button ID="btnSignIn" runat="server" Text="Sign-In" CssClass="btn btn-signin" OnClick="btnSignIn_Click" />
            <div class="links">
                <asp:HyperLink ID="lnkCreateAccount" runat="server" NavigateUrl="registration.aspx" Text="Create your I-Cart account" />
            </div>
        </div>
    </form>
</body>
</html>
