 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainLogin.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
          <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Online Project Manual</title>
  <link rel="stylesheet" href="node_modules/font-awesome/css/font-awesome.min.css" />
  <link rel="stylesheet" href="node_modules/perfect-scrollbar/dist/css/perfect-scrollbar.min.css" />
  <link rel="stylesheet" href="css/style.css" />
  <link rel="shortcut icon" href="images/favicon.png" />
</head>
<body>
    <form id="form1" runat="server">
   
    <div>
     <div class="container-scroller">
    <div class="container-fluid">
      <div class="row">
          
        <div class="content-wrapper full-page-wrapper d-flex align-items-center auth-pages" style="background-color:antiquewhite" >

          <div class="card col-lg-4 mx-auto">
               <img src="images/login.jpg" alt="Sample Photo" height="200px" width="470px"  />
             
            <div>
          <h3  style="margin-left: 90px">Warehouse Management</h3>
                <h5 style="margin-left:160px">Login </h5>
              </div>
         
             <div class="form-group">
                  <asp:DropDownList ID="dwntype" runat="server" class="form-control p-input">
                                                <asp:ListItem  Value="0">Login As</asp:ListItem>
                                                <asp:ListItem  Value="1">ADMIN</asp:ListItem>
                                                <asp:ListItem  Value="2">MANAGER</asp:ListItem>
                                                <asp:ListItem  Value="3">STOCKIST</asp:ListItem>
                                                
                                            </asp:DropDownList>
                        
              </div>
                <div class="form-group">
                  
                    <asp:TextBox ID="txtName" runat="server" class="form-control p_input" placeholder="Username"></asp:TextBox>

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Required" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                 
                        <asp:TextBox ID="txtPass" runat="server" class="form-control p_input" 
                            placeholder="Password" TextMode="Password"></asp:TextBox>
                
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="Required" ControlToValidate="txtPass" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <div class="text-center">
                  
                            <asp:Button ID="btnSubmit" runat="server" Text="Log In" 
                                class="btn btn-primary btn-block enter-btn" onclick="btnSubmit_Click" />
                </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="node_modules/jquery/dist/jquery.min.js"></script>
  <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
  <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
  <script src="node_modules/perfect-scrollbar/dist/js/perfect-scrollbar.jquery.min.js"></script>
  <script src="js/misc.js"></script>

    </form>
</body>
</html>
