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
    protected static string id1="";

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(cs);

        
        if (Session["aid"] == null)
        {
            Response.Redirect("MainLogin.aspx");
        }
        else
        {

              
                id = Request.QueryString["id"].ToString();
                using(SqlCommand cmd5 = new SqlCommand("select * from remove_product where slot=@slot and Company_Name=@cname",conn))
                {
                    cmd5.Parameters.AddWithValue("@slot", id);
                    cmd5.Parameters.AddWithValue("@cname", Session["cname"].ToString());
                    using(SqlDataAdapter adp5 = new SqlDataAdapter(cmd5))
                    {
                        DataTable dt5 = new DataTable();
                        adp5.Fill(dt5);
                        if(dt5.Rows.Count>0)
                        {
                            Button1.Enabled = false;
                        }
                    }
                }

                using (SqlCommand cmd1 = new SqlCommand("select * from mapping_master where slot=@slot and Company_Name=@cname", conn))
            {
                cmd1.Parameters.AddWithValue("@slot", id);
                cmd1.Parameters.AddWithValue("@cname", Session["cname"].ToString());
                using(SqlDataAdapter adp1 = new SqlDataAdapter(cmd1))
                {
                    DataTable dt1 = new DataTable();
                    adp1.Fill(dt1);
                    if(dt1.Rows.Count>0)
                    {
                         id1 = dt1.Rows[0]["product_id"].ToString();
                        using (SqlCommand cmd = new SqlCommand("select * from product_master where id=@id", conn))
                        {
                            cmd.Parameters.AddWithValue("@id", id1);
                            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                            {
                                DataTable dt = new DataTable();
                                adp.Fill(dt);
                                if (dt.Rows.Count > 0)
                                {
                                    Label1.Visible = true;
                                    Label2.Visible = true;
                                    txtName.Text = dt.Rows[0]["Name"].ToString();
                                    txtNumber.Text = dt.Rows[0]["Product_Company_name"].ToString();
                                    txtdoj.Text = dt.Rows[0]["Date"].ToString();
                                    TextBox1.Text = dt.Rows[0]["Email"].ToString();
                                    Label2.Text = dt.Rows[0]["Dimension"].ToString();

                                }
                                else
                                {
                                    Response.Write("<script>alert('No Details Found')</script>");
                                }

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
        using(SqlCommand cmd = new SqlCommand("insert into remove_product(slot,Company_Name) values(@slot,@Company_Name)",conn))
        {
            cmd.Parameters.AddWithValue("@slot", id);
            cmd.Parameters.AddWithValue("@Company_Name", Session["cname"].ToString());
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Button1.Enabled = false;
            Response.Write("<script>alert('Product Sent For Bill Generation')</script>");

        }
    }
}