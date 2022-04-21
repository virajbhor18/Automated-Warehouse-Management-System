<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
          <h3 class="page-heading mb-4">Dashboard</h3>
          <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 mb-4">
              <div class="card card-statistics">
                <div class="card-body">
                  <div class="clearfix">
                    <div class="float-left">
                      <h4 class="text-danger">

                        <img alt="" src="images/001-interface-1.png" />
                        <%--<i class="fa fa-bar-chart-o highlight-icon" aria-hidden="true"></i>--%>
                      </h4>
                    </div>
                    <div class="float-right">
                      <p class="card-text text-dark">Product</p>
                      <h4 class="bold-text"><%= countprod %></h4>
                    </div>
                  </div>
                  <%--<p class="text-muted">
                    <i class="fa fa-exclamation-circle mr-1" aria-hidden="true"></i><a href="manageStudent.aspx">view Details</a>
                  </p>--%>
                </div>
              </div>
            </div>
            
                 <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 mb-4">
              <div class="card card-statistics">
                <div class="card-body">
                  <div class="clearfix">
                    <div class="float-left">
                      <h4 class="text-danger">

                        <img alt="" src="images/001-interface-1.png" />
                       
                      </h4>
                    </div>
                    <div class="float-right">
                      <p class="card-text text-dark">Reports</p>
                      <h4 class="bold-text"><%= countreport %></h4>
                    </div>
                  </div>
                 <%-- <p class="text-muted">
                    <i class="fa fa-exclamation-circle mr-1" aria-hidden="true"></i><a href="manage_projectFaculty.aspx">view Details</a>
                  </p>
                </div>--%>
              </div>
            </div>
              
            </div>
          </div>
        </div>
</asp:Content>

