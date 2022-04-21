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
           
            if (Request.QueryString["msg"] != null)
            {

                msg = Request.QueryString["msg"].ToString();
                id = Request.QueryString["id"].ToString();
                if (msg == "edit")
                {
                    using (SqlCommand cmd = new SqlCommand("select * from manager_master where id=@id", conn))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            adp.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                txtName.Text = dt.Rows[0]["Manager_name"].ToString();
                                txtNumber.Text = dt.Rows[0]["company_name"].ToString();
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
                        "Update manager_master set Manager_Name=@mname,company_name=@cname,phone=@phone,email=@email,password=@password where id=@id",
                        conn))
            {
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@cname", txtNumber.Text);
                cmd.Parameters.AddWithValue("@mname", txtName.Text);
                cmd.Parameters.AddWithValue("@phone", TextBox2.Text);
                cmd.Parameters.AddWithValue("@email", TextBox1.Text);
                cmd.Parameters.AddWithValue("@password", TextBox3.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("manage_Manager.aspx?msg=update");
            }
                           
            }
       else
       {
            using(SqlCommand cmd = new SqlCommand("select * from manager_master where company_name = @cname",conn))
            {
                cmd.Parameters.AddWithValue("@cname", txtNumber.Text);
                using(SqlDataAdapter adp = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    if(dt.Rows.Count>0)
                    {
                        Response.Write("<script>alert('Manager for given company is already present.')</script>");
                    }
                    else
                    {
                        using(SqlCommand cmd1 = new SqlCommand("insert into manager_master(manager_name,company_name,phone,email,password) values(@mname,@cname,@phone,@email,@password)",conn))
                        {
                            cmd1.Parameters.AddWithValue("@mname",txtName.Text);
                            cmd1.Parameters.AddWithValue("@cname", txtNumber.Text);
                            cmd1.Parameters.AddWithValue("@phone", TextBox2.Text);
                            cmd1.Parameters.AddWithValue("@email", TextBox1.Text);
                            cmd1.Parameters.AddWithValue("@password", TextBox3.Text);
                            conn.Open();
                            cmd1.ExecuteNonQuery();
                            conn.Close();
                            
                        }

                        string dimension = "";
                        for(int i=1; i<=30; i++)
                        {   
                            if(i <10)
                            {
                                dimension = "small";
                            }
                        
                            else if(i> 10 && i <=20)
                            {
                                dimension = "medium";
                            }
                            else if(i < 20)
                            {
                                dimension = "large";
                            }
                            using(SqlCommand cmd2 = new SqlCommand("insert into Slot_Master (Slot_Id,Size,Company) values(@id,@size,@company)",conn))
                            {
                                cmd2.Parameters.AddWithValue("@company", txtNumber.Text);
                                cmd2.Parameters.AddWithValue("@id", "S"+Convert.ToString(i));
                                cmd2.Parameters.AddWithValue("@size", dimension);
                                conn.Open();
                                cmd2.ExecuteNonQuery();
                                conn.Close();
                            }
                        }

                        Response.Redirect("manage_Manager.aspx?msg=add");
                    }
                }
            }
          
           
                
       }
   }



   

}