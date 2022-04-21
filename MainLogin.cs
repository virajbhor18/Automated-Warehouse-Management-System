using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Default2 : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session.Abandon();
            Session.Clear();
        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (dwntype.SelectedValue=="0")
        {
            Response.Write("<script>alert('Select Login Type')</script>");
        }
        else
        {
            if (dwntype.SelectedValue == "1")
            {
                SqlConnection con = new SqlConnection(cs);
                using (SqlCommand cmd = new SqlCommand("select * from admin_master where username=@username and password=@password", con))
                {
                    DataTable dt = new DataTable();
                    cmd.Parameters.AddWithValue("@username", txtName.Text);
                    cmd.Parameters.AddWithValue("@password", txtPass.Text);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                    }
                    if (dt.Rows.Count > 0)
                    {
                        Session["aid"] = dt.Rows[0]["id"].ToString();
                        Response.Redirect("Admin/Home.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Login')</script>");
                    }
                } 
            }
            else if (dwntype.SelectedValue=="2")
            {
                SqlConnection con = new SqlConnection(cs);
                using (SqlCommand cmd = new SqlCommand("select * from Manager_Master where email=@username and Password=@Password", con))
                {
                    DataTable dt = new DataTable();
                    cmd.Parameters.AddWithValue("@Username", txtName.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPass.Text);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                    }
                    if (dt.Rows.Count > 0)
                    {
                        Session["aid"] = dt.Rows[0]["id"].ToString();
                        Session["cname"] = dt.Rows[0]["Company_Name"].ToString();
                        Response.Redirect("~/Manager/manage_Product.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Login')</script>");
                    }
                } 
            }

            else
            {
                SqlConnection con = new SqlConnection(cs);
                using (SqlCommand cmd = new SqlCommand("select * from Stockist_Master where email=@username and Password=@Password", con))
                {
                    DataTable dt = new DataTable();
                    cmd.Parameters.AddWithValue("@Username", txtName.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPass.Text);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                    }
                    if (dt.Rows.Count > 0)
                    {
                        Session["aid"] = dt.Rows[0]["id"].ToString();
                        Session["cname"] = dt.Rows[0]["Company_Name"].ToString();
                        Response.Redirect("~/Stockist/manage_Product.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Login')</script>");
                    }
                } 
            }
            

            
        }

      
    }
}