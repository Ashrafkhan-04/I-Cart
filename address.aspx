<%@ Page Language="C#" AutoEventWireup="true" CodeFile="address.aspx.cs" Inherits="address" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Amazon Style Address Form</title>
    <style>
        body {
            background-color: #f6f6f6;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 500px;
            margin: 40px auto;
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        h2 {
            color: #232f3e;
            text-align: center;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        .btn-send {
            background-color: #ff9900;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            width: 100%;
        }
        .btn-send:hover {
            background-color: #e68a00;
        }
        .status {
            margin-top: 15px;
            display: block;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Delivery Address</h2>

            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" Placeholder="Full Name"></asp:TextBox>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Placeholder="Full Address" TextMode="MultiLine" Rows="3"></asp:TextBox>
            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" Placeholder="Mobile Number"></asp:TextBox>
            <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" Placeholder="Pincode"></asp:TextBox>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email ID"></asp:TextBox>

            <asp:Button ID="btnSendEmail" runat="server" Text="Place Order" CssClass="btn-send" OnClick="btnSendEmail_Click" />

            <asp:Label ID="lblStatus" runat="server" CssClass="status" />
        </div>
    </form>
</body>
</html>
