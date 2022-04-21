<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MasterPage.master" AutoEventWireup="true" CodeFile="View_Report.aspx.cs" Inherits="Manager_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
          <h3 class="page-heading mb-4">Reports</h3>

          <div class="card-deck">
            <div class="card col-lg-12 px-0 mb-4">
              <div class="card-body">
                <h5 class="card-title">List of Products</h5>
               

                <div class="table-responsive">
                  <table class="table center-aligned-table" width="Auto">
                    <thead>
                      <tr class="text-primary">
                        <th style="visibility:false">Product Name</th>
                        <th>Company Name</th>
                        <th>Date Added</th>
                        <th>Dimension</th>
                        <th>Removal Date</th>
                          <th>Email</th>
                     
                        <th>Total Price</th>
                          <%--<th>Photo</th>--%>
                       
                      </tr>
                    </thead>
         <% if (flag == true)
         {

             foreach (System.Data.DataRow row in dt.Rows)
               
                    { %>
                    <tbody>
                      <tr class="">
                    <td><%=row["prod_name"]%></td>
					<td><%=row["Company_Name"]%></td>
					<td><%=row["add_date"]%></td>
                    <td><%=row["slot"]%></td>
                    <td><%=row["remove_date"]%></td>
                          <td><%=row["email"]%></td>
				
                    <td><%=row["total_price"]%></td>
                       
                          
                          <%--<td><img alt="image" height='50px' width='50px' src='<%=row["Facimage"] %>' /></td>--%>
                      
                        <%--<td><a href="AddProduct.aspx?id=<%=row.ItemArray[0]%>&msg=edit" class="btn btn-outline-success btn-sm">Edit</a></td>--%>
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



