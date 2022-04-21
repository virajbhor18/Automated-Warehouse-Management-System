<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Slots.aspx.cs" Inherits="Admin_Default" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <script type="text/javascript">

          function ConfirmDelete() {

              if (confirm("Are you sure to want to Delete?") == true)

                  return true;

              else

                  return false;

          }
          </script>
    <style> 
        .button { 
            padding : 15px 32px; 
            border :chartreuse; 
            font-size: 16px; 
            color: white; 
        } 
          
        .b1 { 
            background-color: red; 
            width: 200px; 
        } 
        .b2 { 
            background-color: blue; 
            width: 200px; 
        } 
        .b3 { 
            background-color: green; 
            width: 200px; 
        } 
        .b4 { 
            background-color: yellow; 
            width: 200px; 
        } 
        </style> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content-wrapper">
          

          <div class="card-deck">
            <div class="card col-lg-12 px-0 mb-4">
              <div class="card-body">
                  <h5 class="card-title">Slots</h5>
               

                <div class="table-responsive">
                  <table class="table center-aligned-table" width="Auto">
                      <thead>
                          <tr style="margin-top: 50px;">
                               <td><label for="exampleInputPassword1">Product Dimension</label></td>
                        <td><asp:DropDownList ID="DropDownList1" runat="server" class="form-control p-input" placeholder="Slot_Period" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList></td>
                              </tr>
                      <tr style="margin-top: 50px;">
                        
                         
                     
                    
                       
                          
                          <%--<td><img alt="image" height='50px' width='50px' src='<%=row["Facimage"] %>' /></td>--%>
                      
                        <td><asp:Button ID="Button1" runat="server" Text="S1" class="button b3"  style="width: 100px;" OnClick="Button1_Click"  /></td>
                            <td><asp:Button ID="Button2" runat="server" Text="S2" class="button b3"  style="width: 100px;" OnClick="Button2_Click"  /></td>
                          <td><asp:Button ID="Button3" runat="server" Text="S3" class="button b3"  style="width: 100px;" OnClick="Button3_Click" /></td>
                          <td><asp:Button ID="Button4" runat="server" Text="S4" class="button b3"  style="width: 100px;"  OnClick="Button4_Click"/></td>
                          <td><asp:Button ID="Button5" runat="server" Text="S5" class="button b3"  style="width: 100px;"  OnClick="Button5_Click"/></td>
                           <td><asp:Button ID="Button6" runat="server" Text="S6" class="button b3"  style="width: 100px;"  OnClick="Button6_Click"/></td>
                            <td><asp:Button ID="Button7" runat="server" Text="S7" class="button b3"  style="width: 100px;"  OnClick="Button7_Click"/></td>
                            <td><asp:Button ID="Button8" runat="server" Text="S8" class="button b3"  style="width: 100px;"  OnClick="Button8_Click"/></td>
                            <td><asp:Button ID="Button9" runat="server" Text="S9" class="button b3"  style="width: 100px;"  OnClick="Button9_Click"/></td>
                            <td><asp:Button ID="Button10" runat="server" Text="S10" class="button b3"  style="width: 100px;" OnClick="Button10_Click"/></td>
                        
                      </tr>
                        <tr style="margin-top: 50px;">
                            
                               <td><asp:Button ID="Button11" runat="server" Text="S11" class="button b3"  style="width: 100px;"  OnClick="Button11_Click"/></td>
                            <td><asp:Button ID="Button12" runat="server" Text="S12" class="button b3"  style="width: 100px;"  OnClick="Button12_Click"/></td>
                            <td><asp:Button ID="Button13" runat="server" Text="S13" class="button b3"  style="width: 100px;"  OnClick="Button13_Click"/></td>
                            <td><asp:Button ID="Button14" runat="server" Text="S14" class="button b3"  style="width: 100px;"  OnClick="Button14_Click"/></td>
                            <td><asp:Button ID="Button15" runat="server" Text="S15" class="button b3"  style="width: 100px;"  OnClick="Button15_Click"/></td>
                            <td><asp:Button ID="Button16" runat="server" Text="S16" class="button b3"  style="width: 100px;"  OnClick="Button16_Click"/></td>
                            <td><asp:Button ID="Button17" runat="server" Text="S17" class="button b3"  style="width: 100px;"  OnClick="Button17_Click"/></td>
                            <td><asp:Button ID="Button18" runat="server" Text="S18" class="button b3"  style="width: 100px;" OnClick="Button18_Click" /></td>
                            <td><asp:Button ID="Button19" runat="server" Text="S19" class="button b3"  style="width: 100px;" OnClick="Button19_Click" /></td>
                            <td><asp:Button ID="Button20" runat="server" Text="S20" class="button b3"  style="width: 100px;"  OnClick="Button20_Click"/></td>
                           
                        </tr>
                        
                        
                        <tr style="margin-top: 50px;">
                            
                                <td><asp:Button ID="Button21" runat="server" Text="S21" class="button b3"  style="width: 100px;" OnClick="Button21_Click" /></td>
                            <td><asp:Button ID="Button22" runat="server" Text="S22" class="button b3"  style="width: 100px;"  OnClick="Button22_Click"/></td>
                            <td><asp:Button ID="Button23" runat="server" Text="S23" class="button b3"  style="width: 100px;"  OnClick="Button23_Click"/></td>
                            <td><asp:Button ID="Button24" runat="server" Text="S24" class="button b3"  style="width: 100px;" OnClick="Button24_Click" /></td>
                            <td><asp:Button ID="Button25" runat="server" Text="S25" class="button b3"  style="width: 100px;"  OnClick="Button25_Click"/></td>
                            <td><asp:Button ID="Button26" runat="server" Text="S26" class="button b3"  style="width: 100px;" OnClick="Button26_Click" /></td>
                            <td><asp:Button ID="Button27" runat="server" Text="S27" class="button b3"  style="width: 100px;" OnClick="Button27_Click" /></td>
                            <td><asp:Button ID="Button28" runat="server" Text="S28" class="button b3"  style="width: 100px;"  OnClick="Button28_Click"/></td>
                            <td><asp:Button ID="Button29" runat="server" Text="S29" class="button b3"  style="width: 100px;" OnClick="Button29_Click" /></td>
                            <td><asp:Button ID="Button30" runat="server" Text="S30" class="button b3"  style="width: 100px;"  OnClick="Button30_Click"/></td>
                           
                        </tr>

                      
                     
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>

</asp:Content>

