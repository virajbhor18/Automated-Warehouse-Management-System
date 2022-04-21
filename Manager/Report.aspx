<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
          <h3 class="page-heading mb-4">Reports</h3>
            
            <%--<div class="table-responsive">
                  <table class="table center-aligned-table" width="Auto">
                      <thead>
                          <tr style="margin-top: 50px;">
                               <td><label for="exampleInputPassword1">Product Dimension</label></td>
                        <td><asp:DropDownList ID="DropDownList1" runat="server" class="form-control p-input" placeholder="Slot_Period" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList></td>
                              </tr>
                          </thead>
                          </table>
                </div>--%>
        
          
          <div class="row">
            <div class="col-lg-6 col-12 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title mb-4"></h5>
                  <div id="chartContainer2" style="height: 300px; width: 400px;" >
                    <asp:Chart ID="Chart1" runat="server" Palette="EarthTones" Width="400px">
                                <Series>
                                    <asp:Series Name="Series1" ChartArea="ChartArea1" XValueMember="place" 
                                        YValueMembers="avg" ChartType="StackedColumn" IsXValueIndexed="True">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                        <AxisX IsLabelAutoFit="False">
                                            <LabelStyle Angle="-90" />
                                        </AxisX>
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                      </div>
                </div>
              </div>
            </div>






            <div class="col-lg-6 col-12 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title mb-4"></h5>
                  <div id="chartContainer1" style="height: 300px; width: 400px;">
                      <asp:Chart ID="Chart2" runat="server" Palette="EarthTones" Width="400px">
                                <Series>
                                    <asp:Series Name="Series1" ChartArea="ChartArea1" XValueMember="place" 
                                        YValueMembers="avg" ChartType="StackedColumn" IsXValueIndexed="True">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                        <AxisX IsLabelAutoFit="False">
                                            <LabelStyle Angle="-90" />
                                        </AxisX>
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          </div>
      
        <!-- partial:../../partials/_footer.html -->

</asp:Content>