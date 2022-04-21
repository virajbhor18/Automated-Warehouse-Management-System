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
            using(SqlCommand cmd1= new SqlCommand("select * from mapping_master where slot=@slot",conn))
            {
                cmd1.Parameters.AddWithValue("@slot", id);
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
        using(SqlCommand cmd = new SqlCommand("select datediff(day,date,getdate()) as diff,Company_Name,date,name,email,slot_period from product_master where id= @id ",conn))
        {
            cmd.Parameters.AddWithValue("@id", id1);
            using(SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                adp.Fill(dt);
                if(dt.Rows.Count>0)
                {
                    int diff = Convert.ToInt32(dt.Rows[0]["diff"].ToString());
                    double price = 100 * diff;
                    string date =  dt.Rows[0]["date"].ToString();
                    string name  = dt.Rows[0]["name"].ToString();
                    string email = dt.Rows[0]["email"].ToString();
                    string slot = dt.Rows[0]["slot_period"].ToString();
                    string Company_Name=dt.Rows[0]["Company_Name"].ToString();

                   



                    SmtpClient smtpserver = new SmtpClient();
                    MailMessage mail = new MailMessage();
                    smtpserver.Credentials = new System.Net.NetworkCredential("nipulgothal@gmail.com", "8652415809n");
                    smtpserver.Port = 587;
                    smtpserver.EnableSsl = true;
                    smtpserver.Host = "smtp.gmail.com";
                    mail = new MailMessage();
                    mail.From = new MailAddress("nipulgothal@gmail.com");
                    mail.To.Add(email);
                    mail.Subject = "Bill Details";
                    mail.Body = "Bill" + "\n" + "Bill For Product : " + name + "\n" + "Slot_Period  is : " + slot + "\n" + "Total number of days : " + diff + "\n" + "Total Amount : " + price;
                    smtpserver.Send(mail);

                    using(SqlCommand cmd1= new SqlCommand("delete from product_master where id=@id",conn))
                    {
                        cmd1.Parameters.AddWithValue("@id", id1);
                        conn.Open();
                        cmd1.ExecuteNonQuery();
                        conn.Close();
                    }
                    using (SqlCommand cmd2 = new SqlCommand("delete from Mapping_Master where Product_Id=@id", conn))
                    {
                        cmd2.Parameters.AddWithValue("@id", id1);
                        conn.Open();
                        cmd2.ExecuteNonQuery();
                        conn.Close();
                    }
                    using(SqlCommand cmd3= new SqlCommand("insert into report_master (prod_name,add_date,email,slot,remove_date,total_price,company_name) values(@name,@date,@email,@slot,getdate(),@price,@comp_name)",conn))
                    {
                        cmd3.Parameters.AddWithValue("@name", name);
                        cmd3.Parameters.AddWithValue("@date", date);
                        cmd3.Parameters.AddWithValue("@email", email);
                        cmd3.Parameters.AddWithValue("@slot", slot);
                        cmd3.Parameters.AddWithValue("@price", price);
                        cmd3.Parameters.AddWithValue("@comp_name", Company_Name);
                        conn.Open();
                        cmd3.ExecuteNonQuery();
                        conn.Close();
                        Response.Redirect("Slots.aspx");

                    }


                    using (SqlCommand cmd4 = new SqlCommand("select slot from mapping_master where product_id=@id", conn))
                    {
                        cmd4.Parameters.AddWithValue("@id", id1);
                        using (SqlDataAdapter adp4 = new SqlDataAdapter(cmd4))
                        {
                            DataTable dt4 = new DataTable();
                            adp4.Fill(dt4);
                            if (dt4.Rows.Count > 0)
                            {
                                string slots = "S" + dt4.Rows[0]["slot"].ToString();
                                SmtpClient smtpserver1 = new SmtpClient();
                                MailMessage mail1 = new MailMessage();
                                smtpserver1.Credentials = new System.Net.NetworkCredential("nipulgothal@gmail.com", "8652415809n");
                                smtpserver1.Port = 587;
                                smtpserver1.EnableSsl = true;
                                smtpserver1.Host = "smtp.gmail.com";
                                mail1 = new MailMessage();
                                mail1.From = new MailAddress("nipulgothal@gmail.com");
                                mail1.To.Add(TextBox1.Text);
                                mail1.Subject = "Product Details Details";
                                mail1.Body = "Details" + "\n" + "Name of Product : " + name + "\n" + "Slot_Period  is : " + slot + "\n" + "Slot Numbert : " + slots;
                                smtpserver.Send(mail1);
                            }
                        }
                    }
                }


                
            }
        }
    }
}