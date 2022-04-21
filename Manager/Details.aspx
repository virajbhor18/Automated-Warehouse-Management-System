<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MasterPage.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class=" container-scroller" style="width:100%">
    <div class="container-fluid">
      <div class="row row-offcanvas row-offcanvas-right">
        <div class="content-wrapper">
          <h3 class="page-heading mb-4">Product Details</h3>
          <div class="row mb-2">
            <div class="col-lg-12">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title mb-4"></h5>
                    <%--<div class="form-group">
                      <label for="exampleInputPassword1">Company Name</label>
                      <asp:TextBox ID="txtPass" runat="server" class="form-control p-input" placeholder="Password" TextMode="SingleLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="a"
                            ErrorMessage="Required" ControlToValidate="txtPass" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>--%>

             <asp:hiddenfield ID="hiddenchk" runat="server" />
                    <div class="form-group">
                      <label for="exampleInputEmail1">Product Name</label>
                      <asp:TextBox ID="txtName" runat="server" class="form-control p-input" placeholder="Name" EnableTheming="True" ReadOnly="True"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="Required" ControlToValidate="txtName" ForeColor="Red" 
                            ValidationGroup="a"></asp:RequiredFieldValidator>
                    </div><%--address--%>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Company Name</label>
                      <asp:TextBox ID="txtNumber" runat="server" class="form-control p-input" placeholder="Quantity" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="a"
                            ErrorMessage="Required" ControlToValidate="txtNumber" ForeColor="Red"></asp:RequiredFieldValidator>

                       <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  
 ControlToValidate ="txtNumber" ErrorMessage="Invalid Contact number"  ForeColor="Red"
 ValidationExpression ="[0-9]{10}">

                        </asp:RegularExpressionValidator>--%>


                    </div><%--number--%>
                    
                    <div class="form-group">
                      <label for="exampleInputEmail1">Company Email</label>
                      <asp:TextBox ID="TextBox1" runat="server" class="form-control p-input" placeholder="Quantity" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="a"
                            ErrorMessage="Required" ControlToValidate="txtNumber" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>



                    <%--<div class="form-group">
                      <label for="exampleInputPassword1">Company Name</label>
                      <asp:TextBox ID="txtPass" runat="server" class="form-control p-input" placeholder="Password" TextMode="SingleLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="a"
                            ErrorMessage="Required" ControlToValidate="txtPass" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>--%>
                 
                      <div class="form-group">
                     <asp:Label ID="Label1" runat="server" Text="Selected Product Dimension:-"></asp:Label>
                          <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

                          </div>
                    <div class="form-group">
                           <label for="exampleInputPassword1">Date</label>
                                          
                                <asp:TextBox ID="txtdoj" runat="server"  class="form-control p-input" placeholder="Select Date" ReadOnly="True"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="a"
                            ErrorMessage="Required" ControlToValidate="txtdoj" ForeColor="Red"></asp:RequiredFieldValidator>
                      </div>      
                     
                                    
                    <div class="form-group">
                      <label for="exampleInputPassword1">&nbsp;</label></div>
                    
                      <div class="form-group"> 
                       <%--<asp:Button ID="Button1" runat="server" Text="Empty Slot"  ValidationGroup="a" class="btn btn-primary" OnClick="Button1_Click"
                                />--%>
                    </div>
               
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
</asp:Content>

