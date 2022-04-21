<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Add_Stockist.aspx.cs" Inherits="Admin_Default" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
         var chkvalue = "";


         <%--function showimg() {
             debugger;
             var showimage = document.querySelector('#<%=showimge.ClientID %>');
            var file = document.querySelector('#<%=fileuplogo.ClientID%>').files[0];

            var reader = new window.FileReader();

            reader.onload = function () {
                showimage.src = reader.result;

            }
            if (file) {
                //reader.readasdataurl(file);
                reader.readAsDataURL(file);

            }
            else {
                showimage.src = "";
            }
        }--%>


      


    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class=" container-scroller" style="width:100%">
    <div class="container-fluid">
      <div class="row row-offcanvas row-offcanvas-right">
        <div class="content-wrapper">
          <h3 class="page-heading mb-4"></h3>
          <div class="row mb-2">
            <div class="col-lg-12">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title mb-4">Add Manager</h5>
                  <%--<form class="forms-sample">--%>

             <asp:hiddenfield ID="hiddenchk" runat="server" />
                    <div class="form-group">
                      <label for="exampleInputEmail1">Stockist Name</label>
                      <asp:TextBox ID="txtName" runat="server" class="form-control p-input" placeholder="Name"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="Required" ControlToValidate="txtName" ForeColor="Red" 
                            ValidationGroup="a"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Company Name</label>
                      <%--<asp:TextBox ID="txtNumber" runat="server" class="form-control p-input" placeholder="Company Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="a"
                            ErrorMessage="Required" ControlToValidate="txtNumber" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                        <asp:DropDownList ID="DropDownList1" runat="server" class="form-control p-input" placeholder="Company Name" ></asp:DropDownList>

                    </div>

                    <div class="form-group">
                      <label for="exampleInputEmail1">Stockist Phone</label>
                      <asp:TextBox ID="TextBox2" runat="server" class="form-control p-input" placeholder="Phone Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="a"
                            ErrorMessage="Required" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    
                    <div class="form-group">
                      <label for="exampleInputEmail1">Stockist Email</label>
                      <asp:TextBox ID="TextBox1" runat="server" class="form-control p-input" placeholder="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="a"
                            ErrorMessage="Required" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>

                    <div class="form-group">
                      <label for="exampleInputEmail1">Password</label>
                      <asp:TextBox ID="TextBox3" runat="server" class="form-control p-input" placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="a"
                            ErrorMessage="Required" ControlToValidate="TextBox3" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>



                    <%--<div class="form-group">
                      <label for="exampleInputPassword1">Company Name</label>
                      <asp:TextBox ID="txtPass" runat="server" class="form-control p-input" placeholder="Password" TextMode="SingleLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="a"
                            ErrorMessage="Required" ControlToValidate="txtPass" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>--%>
                 
                      <%--<div class="form-group">
                     <asp:Label ID="Label1" runat="server" Text="Selected Product Dimension:-"></asp:Label>
                          <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

                          </div>
                    <div class="form-group">
                           <label for="exampleInputPassword1">Date</label>
                       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                   
                                <asp:TextBox ID="txtdoj" runat="server"  class="form-control p-input" placeholder="Select Date"></asp:TextBox>
                                <ajax:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtdoj"
                                    Format="dd/MM/yyyy">
                                </ajax:CalendarExtender>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="a"
                            ErrorMessage="Required" ControlToValidate="txtdoj" ForeColor="Red"></asp:RequiredFieldValidator>
                      </div> --%>     
                     
                                    
                    <%--<div class="form-group">
                      <label for="exampleInputPassword1">Slot Period</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" class="form-control p-input" placeholder="Slot_Period" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                         
                    </div>--%>

                      <div class="form-group">
  
                          <div>
                              </div>
              
                        </div>
                    
                      <div class="form-group"> 
                       <asp:Button ID="Button1" runat="server" Text="Submit"  ValidationGroup="a" class="btn btn-primary" OnClick="Button1_Click"
                                />
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

