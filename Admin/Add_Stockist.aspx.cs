using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    protected static string msg = "";
    protected static string id;
    protected int j;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(cs);


        if (Session["aid"] == null)
        {
            Response.Redirect("MainLogin.aspx");
        }
        if (!IsPostBack)
        {

            using (SqlCommand cmd1 = new SqlCommand("select distinct(company_name) from Manager_Master", conn))
            {
                using (SqlDataAdapter adp1 = new SqlDataAdapter(cmd1))
                {
                    DataTable dt1 = new DataTable();
                    adp1.Fill(dt1);
                    if (dt1.Rows.Count > 0)
                    {
                        DropDownList1.DataSource = dt1;
                        DropDownList1.DataTextField = "company_name";
                        DropDownList1.DataValueField = "company_name";
                        DropDownList1.DataBind();
                    }

                }
                DropDownList1.Items.Insert(0, new ListItem("SELECT COMPANY"));

            }

            if (Request.QueryString["msg"] != null)
            {

                msg = Request.QueryString["msg"].ToString();
                id = Request.QueryString["id"].ToString();
                if (msg == "edit")
                {
                    using (SqlCommand cmd = new SqlCommand("select * from stockist_master where id=@id", conn))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            adp.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                cmd.Parameters.AddWithValue("@id", id);
                                txtName.Text = dt.Rows[0]["stockist_name"].ToString();
                                //txtNumber.Text = dt.Rows[0]["company_name"].ToString();
                                DropDownList1.DataTextField = dt.Rows[0]["company_name"].ToString();
                                TextBox2.Text = dt.Rows[0]["phone"].ToString();
                                TextBox1.Text = dt.Rows[0]["email"].ToString();
                                TextBox3.Text = dt.Rows[0]["password"].ToString();

                            }

                        }
                    }
                    
                    }

                
                }
            }


        }

    
    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection(cs);
        string msg1 = Request.QueryString["msg"] != null ? Request.QueryString["msg"].ToString() : "";
        if (msg1 == "edit")
        {
            id = Request.QueryString["id"].ToString();
            using (
                SqlCommand cmd =
                    new SqlCommand(
                        "Update stockist_master set stockist_name=@mname,company_name=@cname,phone=@phone,email=@email,password=@password where id=@id",
                        conn))
            {
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@mname", txtName.Text);
                cmd.Parameters.AddWithValue("@cname", DropDownList1.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@phone", TextBox2.Text);
                cmd.Parameters.AddWithValue("@email", TextBox1.Text);
                cmd.Parameters.AddWithValue("@password", TextBox3.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();



                Response.Redirect("manage_Stockist.aspx?msg=update");
            }
                           
            }
       else
       {
            using(SqlCommand cmd = new SqlCommand("select * from stockist_master where company_name = @cname",conn))
            {
                cmd.Parameters.AddWithValue("@cname", DropDownList1.SelectedItem.Text);
                using(SqlDataAdapter adp = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    if(dt.Rows.Count>0)
                    {
                        Response.Write("<script>alert('Stockist for given company is already present.')</script>");
                    }
                    else
                    {
                        using (SqlCommand cmd1 = new SqlCommand("insert into stockist_master(stockist_name,company_name,phone,email,password) values(@mname,@cname,@phone,@email,@password)", conn))
                        {
                            cmd1.Parameters.AddWithValue("@mname",txtName.Text);
                            cmd1.Parameters.AddWithValue("@cname", DropDownList1.SelectedItem.Text);
                            cmd1.Parameters.AddWithValue("@phone", TextBox2.Text);
                            cmd1.Parameters.AddWithValue("@email", TextBox1.Text);
                            cmd1.Parameters.AddWithValue("@password", TextBox3.Text);
                            conn.Open();
                            cmd1.ExecuteNonQuery();
                            conn.Close();
                            Response.Redirect("manage_Stockist.aspx?msg=add");
                        }
                    }
                }
            }
          
           
                
       }
   }



   

}