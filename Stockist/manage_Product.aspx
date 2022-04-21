<%@ Page Title="" Language="C#" MasterPageFile="~/Stockist/MasterPage.master" AutoEventWireup="true" CodeFile="manage_Product.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <script type="text/javascript">

          function ConfirmDelete() {

              if (confirm("Are you sure to want to Delete?") == true)

                  return true;

              else

                  return false;

          }
          </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content-wrapper">
         <h3 class="page-heading mb-4">Manage Product</h3>

          <div class="card-deck">
            <div class="card col-lg-12 px-0 mb-4">
              <div class="card-body">
                
                <h5 class="card-title"><a href="Add_Products.aspx">New Inward Entry</a></h5>
                <h5 class="card-title">List of Products</h5>

                <div class="table-responsive">
                  <table class="table center-aligned-table" width="Auto">
                    <thead>
                      <tr class="text-primary">
                        <th style="visibility:false">Product ID</th>
                        <th>Name</th>
                        <th>Product Company_Name</th>
                        <th>Email</th>
                        <th>Date</th>
                     
                        <th>Product Dimension</th>
                          <%--<th>Photo</th>--%>
                        <%--<th>Edit</th>--%>
                          
                      </tr>
                    </thead>
         <% if (flag == true)
         {

             foreach (System.Data.DataRow row in dt.Rows)
               
                    { %>
                    <tbody>
                      <tr class="">
                    <td><%=row["ID"]%></td>
					<td><%=row["Name"]%></td>
					<td><%=row["Product_Company_Name"]%></td>
                    <td><%=row["Email"]%></td>
                    <td><%=row["Date"]%></td>			
                    <td><%=row["Dimension"]%></td>
                       
                          
                          <%--<td><img alt="image" height='50px' width='50px' src='<%=row["Facimage"] %>' /></td>--%>
                      
                       <%-- <td><a href="AddProduct.aspx?id=<%=row.ItemArray[0]%>&msg=edit" class="btn btn-outline-success btn-sm">Edit</a></td>--%>
                       <%-- <td><a href="DeleteProduct.aspx?id=<%=row.ItemArray[0]%>" class="btn btn-outline-danger" onclick="return ConfirmDelete()">Delete</a></td>--%>
                      </tr>
                      </tbody>
                       <%  }
                                }%>
                        <% else
                            {%>Response.Write("<script>alert('no data found')</script>"); <%}%>
                     
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>

</asp:Content>

