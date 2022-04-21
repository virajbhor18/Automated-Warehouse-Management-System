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

public partial class Manager_Default : System.Web.UI.Page
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
            Label1.Visible = true;
            Label2.Visible = true;
            using (SqlCommand cmd1 = new SqlCommand("select * from product_master where company_name=@cname", conn))
            {
                cmd1.Parameters.AddWithValue("@cname", Session["cname"].ToString());
                using (SqlDataAdapter adp1 = new SqlDataAdapter(cmd1))
                {
                    DataTable dt1 = new DataTable();
                    adp1.Fill(dt1);
                    if (dt1.Rows.Count > 0)
                    {
                        DropDownList1.DataSource = dt1;
                        DropDownList1.DataTextField = "Name";
                        DropDownList1.DataValueField = "Id";
                        DropDownList1.DataBind();
                    }

                }
                DropDownList1.Items.Insert(0, new ListItem("SELECT PRODUCT"));

            }

        }


    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(cs);
        using(SqlCommand cmd = new SqlCommand("select * from mapping_master where product_id=@id and company_name=@cname",conn))
        {
            cmd.Parameters.AddWithValue("@id", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@cname", Session["cname"].ToString());
            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                adp.Fill(dt);
                if(dt.Rows.Count>0)
                {
                    Response.Write("<script>alert('Slot Is Already Assigned For This Product')</script>");
                }
                else
                {
                    using(SqlCommand cmd2 = new SqlCommand("select * from Dimension_master where dimension=@dimension",conn))
                    {
                        cmd2.Parameters.AddWithValue("@dimension",Label2.Text);
                        using(SqlDataAdapter adp2 = new SqlDataAdapter(cmd2))
                        {
                            DataTable dt2 = new DataTable();
                            adp2.Fill(dt2);
                            if(dt2.Rows.Count>0)
                            {
                                string category = dt2.Rows[0]["Category"].ToString();
                                using (SqlCommand cmd6 = new SqlCommand("select * from mapping_master where company=@company and size=@size", conn))
                                {
                                   // cmd6.Parameters.AddWithValue("@company", txtNumber.Text);
                                    cmd6.Parameters.AddWithValue("@company", Session["cname"].ToString());
                                    cmd6.Parameters.AddWithValue("@size", category);
                                    using (SqlDataAdapter adp6 = new SqlDataAdapter(cmd6))
                                    {
                                        DataTable dt6 = new DataTable();
                                        adp.Fill(dt6);
                                        if (dt6.Rows.Count < 10)
                                        {
                                            if (category == "Small")
                                            {
                                                for (int i = 1; i <= 10; i++)
                                                {
                                                    string prod_id = "";
                                                    using (SqlCommand cmd3 = new SqlCommand("select * from mapping_master where Company_Name=@company and size=@size and slot=" + i, conn))
                                                    {
                                                        cmd3.Parameters.AddWithValue("@company", Session["cname"].ToString());
                                                        cmd3.Parameters.AddWithValue("@size", category);
                                                        using (SqlDataAdapter adp3 = new SqlDataAdapter(cmd3))
                                                        {
                                                            DataTable dt3 = new DataTable();
                                                            adp3.Fill(dt3);
                                                            if (dt3.Rows.Count == 0)
                                                            {
                                                                using (SqlCommand cmd4 = new SqlCommand("select id from product_master where id= " + DropDownList1.SelectedValue, conn))
                                                                {
                                                                    using (SqlDataAdapter adp4 = new SqlDataAdapter(cmd4))
                                                                    {
                                                                        DataTable dt4 = new DataTable();
                                                                        adp4.Fill(dt4);
                                                                        prod_id = dt4.Rows[0]["id"].ToString();
                                                                    }
                                                                }
                                                                using (SqlCommand cmd5 = new SqlCommand("insert into mapping_master(Company_Name,size,product_id,slot) values(@cname,@size,@id,@slot)", conn))
                                                                {
                                                                    cmd5.Parameters.AddWithValue("@cname", Session["cname"].ToString());
                                                                    cmd5.Parameters.AddWithValue("@size", category);
                                                                    cmd5.Parameters.AddWithValue("@id", prod_id);
                                                                    cmd5.Parameters.AddWithValue("@slot", i);
                                                                    conn.Open();
                                                                    cmd5.ExecuteNonQuery();
                                                                    conn.Close();
                                                                }

                                                                break;
                                                            }
                                                        }
                                                    }
                                                }
                                            }


                                            if (category == "Medium")
                                            {
                                                for (int i = 11; i <= 20; i++)
                                                {
                                                    string prod_id = "";
                                                    using (SqlCommand cmd3 = new SqlCommand("select * from mapping_master where Company_Name=@company and size=@size and slot=" + i, conn))
                                                    {
                                                        cmd3.Parameters.AddWithValue("@company", Session["cname"].ToString());
                                                        cmd3.Parameters.AddWithValue("@size", category);
                                                        using (SqlDataAdapter adp4 = new SqlDataAdapter(cmd3))
                                                        {
                                                            DataTable dt3 = new DataTable();
                                                            adp4.Fill(dt3);
                                                            if (dt3.Rows.Count == 0)
                                                            {
                                                                using (SqlCommand cmd4 = new SqlCommand("select  id from product_master where id= " + DropDownList1.SelectedValue, conn))
                                                                {
                                                                    using (SqlDataAdapter adp3 = new SqlDataAdapter(cmd4))
                                                                    {
                                                                        DataTable dt4 = new DataTable();
                                                                        adp3.Fill(dt4);
                                                                        prod_id = dt4.Rows[0]["id"].ToString();
                                                                    }
                                                                }
                                                                using (SqlCommand cmd5 = new SqlCommand("insert into mapping_master(Company_Name,size,product_id,slot) values(@cname,@size,@id,@slot)", conn))
                                                                {
                                                                    cmd5.Parameters.AddWithValue("@cname", Session["cname"].ToString());
                                                                    cmd5.Parameters.AddWithValue("@size", category);
                                                                    cmd5.Parameters.AddWithValue("@id", prod_id);
                                                                    cmd5.Parameters.AddWithValue("@slot", i);
                                                                    conn.Open();
                                                                    cmd5.ExecuteNonQuery();
                                                                    conn.Close();
                                                                }

                                                                break;
                                                            }
                                                        }
                                                    }
                                                }
                                            }


                                            if (category == "Large")
                                            {
                                                for (int i = 21; i <= 30; i++)
                                                {
                                                    string prod_id = "";
                                                    using (SqlCommand cmd3 = new SqlCommand("select * from mapping_master where Company_Name=@company and size=@size and slot=" + i, conn))
                                                    {
                                                        cmd3.Parameters.AddWithValue("@company", Session["cname"].ToString());
                                                        cmd3.Parameters.AddWithValue("@size", category);
                                                        using (SqlDataAdapter adp4 = new SqlDataAdapter(cmd3))
                                                        {
                                                            DataTable dt3 = new DataTable();
                                                            adp4.Fill(dt3);
                                                            if (dt3.Rows.Count == 0)
                                                            {
                                                                using (SqlCommand cmd4 = new SqlCommand("select  id from product_master where id= " + DropDownList1.SelectedValue, conn))
                                                                {
                                                                    using (SqlDataAdapter adp3 = new SqlDataAdapter(cmd4))
                                                                    {
                                                                        DataTable dt4 = new DataTable();
                                                                        adp3.Fill(dt4);
                                                                        prod_id = dt4.Rows[0]["id"].ToString();
                                                                    }
                                                                }
                                                                using (SqlCommand cmd5 = new SqlCommand("insert into mapping_master(Company_Name,size,product_id,slot) values(@cname,@size,@id,@slot)", conn))
                                                                {
                                                                    cmd5.Parameters.AddWithValue("@cname", Session["cname"].ToString());
                                                                    cmd5.Parameters.AddWithValue("@size", category);
                                                                    cmd5.Parameters.AddWithValue("@id", prod_id);
                                                                    cmd5.Parameters.AddWithValue("@slot", i);
                                                                    conn.Open();
                                                                    cmd5.ExecuteNonQuery();
                                                                    conn.Close();
                                                                }

                                                                break;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }

                                        else
                                        {
                                            Response.Write("<script>alert('No Space Avialable')</script>");
                                        }

                                        Response.Redirect("Slots.aspx");
                                    }
                                }

                            }
                        }

                    }

                }
            }
        }
        
    }






    //public void email(string mailid, string pwd)
    //{
    //    SmtpClient smtpserver = new SmtpClient();
    //    MailMessage mail = new MailMessage();
    //    smtpserver.Credentials = new System.Net.NetworkCredential("projectmailnew2018@gmail.com", "AB1234cd@");
    //    smtpserver.Port = 587;
    //    smtpserver.EnableSsl = true;
    //    smtpserver.Host = "smtp.gmail.com";
    //    mail = new MailMessage();
    //    mail.From = new MailAddress("projectmailnew2018@gmail.com");
    //    mail.To.Add(mailid);
    //    mail.Subject = "Registration Details";
    //    mail.Body = "Your Login Details: " + "\n" + "\n" + "Login ID  : " + mailid + ". Password:" + pwd;
    //    smtpserver.Send(mail);
    //}
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(cs);
        using (SqlCommand cmd = new SqlCommand("select * from product_master where id=@id", conn))
        {
            cmd.Parameters.AddWithValue("@id", DropDownList1.SelectedValue);
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

            }
        }
        
        





    }
}