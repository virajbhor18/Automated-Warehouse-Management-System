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
            using (SqlCommand cmd1 = new SqlCommand("select * from Dimension_master", conn))
            {
                using (SqlDataAdapter adp1 = new SqlDataAdapter(cmd1))
                {
                    DataTable dt1 = new DataTable();
                    adp1.Fill(dt1);
                    if (dt1.Rows.Count > 0)
                    {
                        DropDownList1.DataSource = dt1;
                        DropDownList1.DataTextField = "dimension";
                        DropDownList1.DataValueField = "Category";
                        DropDownList1.DataBind();
                    }

                }
                DropDownList1.Items.Insert(0, new ListItem("SELECT DIMENSION"));

            }



            if (Request.QueryString["msg"] != null)
            {

                msg = Request.QueryString["msg"].ToString();
                id = Request.QueryString["id"].ToString();
                if (msg == "edit")
                {
                    using (SqlCommand cmd = new SqlCommand("select * from product_master where id=@id", conn))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            adp.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                Label1.Visible = true;
                                Label2.Visible = true;
                                txtName.Text = dt.Rows[0]["Name"].ToString();
                                txtNumber.Text = dt.Rows[0]["Company_name"].ToString();
                                txtdoj.Text = dt.Rows[0]["Date"].ToString();
                                TextBox1.Text = dt.Rows[0]["Email"].ToString();
                                Label2.Text = dt.Rows[0]["Slot_Period"].ToString();

                            }

                        }
                    }

                }

                //using(SqlCommand cmd1= new SqlCommand("update mapping_master where product_id=@id"))
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
                        "update product_master set name=@name,Product_Company_Name=@pcname,Company_Name=@cname,date=@date,Dimension=@period,email=@email where id=@id",
                        conn))
            {
                DateTime date1 = Convert.ToDateTime(txtdoj.Text);
                Label1.Visible = true;
                Label2.Visible = true;
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@cname", Session["cname"].ToString());
                cmd.Parameters.AddWithValue("@pcname", txtNumber.Text);
                cmd.Parameters.AddWithValue("@date", date1);
                cmd.Parameters.AddWithValue("@email", TextBox1.Text);
                cmd.Parameters.AddWithValue("@period", DropDownList1.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();



                Response.Redirect("manage_Product.aspx");
            }



        }
        else
        {
                using (
           SqlCommand cmd1 =
               new SqlCommand(
                   "insert into product_master (name,Company_name,email,date,dimension,Product_Company_Name) values(@name,@cname,@email,@date,@dimension,@pcname)",
                   conn))
                {
                    DateTime date1 = Convert.ToDateTime(txtdoj.Text);
                    Label1.Visible = false;
                    Label2.Visible = false;
                    cmd1.Parameters.AddWithValue("@name", txtName.Text);
                    cmd1.Parameters.AddWithValue("@cname", Session["cname"].ToString());
                    cmd1.Parameters.AddWithValue("@pcname", txtNumber.Text);
                    cmd1.Parameters.AddWithValue("@date", date1);
                    cmd1.Parameters.AddWithValue("@dimension", DropDownList1.SelectedItem.Text);
                    cmd1.Parameters.AddWithValue("@email", TextBox1.Text);
                    conn.Open();
                    cmd1.ExecuteNonQuery();
                    conn.Close();
                }

                

                    //using (SqlCommand cmd2 = new SqlCommand("select top 1 id from product_master order by id desc ", conn))
                    //{
                    //    using (SqlDataAdapter adp2 = new SqlDataAdapter(cmd2))
                    //    {
                    //        DataTable dt2 = new DataTable();
                    //        adp2.Fill(dt2);
                    //        if (dt2.Rows.Count > 0)
                    //        {
                    //            string prod_id = dt2.Rows[0]["id"].ToString();
                    //            using (SqlCommand cmd3 = new SqlCommand("select slot from mapping_master where product_id=@id", conn))
                    //            {
                    //                cmd3.Parameters.AddWithValue("@id", prod_id);
                    //                using (SqlDataAdapter adp3 = new SqlDataAdapter(cmd3))
                    //                {
                    //                    DataTable dt3 = new DataTable();
                    //                    adp3.Fill(dt3);
                    //                    if (dt3.Rows.Count > 0)
                    //                    {
                    //                        string slot = "S" + dt3.Rows[0]["slot"].ToString();
                    //                        SmtpClient smtpserver = new SmtpClient();
                    //                        MailMessage mail = new MailMessage();
                    //                        smtpserver.Credentials = new System.Net.NetworkCredential("nipulgothal@gmail.com", "8652415809n");
                    //                        smtpserver.Port = 587;
                    //                        smtpserver.EnableSsl = true;
                    //                        smtpserver.Host = "smtp.gmail.com";
                    //                        mail = new MailMessage();
                    //                        mail.From = new MailAddress("nipulgothal@gmail.com");
                    //                        mail.To.Add(TextBox1.Text);
                    //                        mail.Subject = "Product Details Details";
                    //                        mail.Body = "Details" + "\n" + "Name Of Product : " + txtName.Text + "\n" + "Slot_Period  is : " + DropDownList1.SelectedItem.Text + "\n" + "Slot Numbert : " + slot;
                    //                        smtpserver.Send(mail);
                    //                    }
                    //                }
                    //            }
                    //        }
                    //    }
                    //}





                    Response.Redirect("manage_Product.aspx");
                
            


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
        using(SqlCommand sqcmd = new SqlCommand("select * from dimension_master where dimension=@dimension",conn))
        {
            sqcmd.Parameters.AddWithValue("@dimension", DropDownList1.SelectedItem.ToString());
            using(SqlDataAdapter sqadp = new SqlDataAdapter(sqcmd))
            {
                DataTable sqdt= new DataTable();
                sqadp.Fill(sqdt);
                Label2.Text = sqdt.Rows[0]["Category"].ToString();
            }


        }
        
        //if (msg == "edit")
        //{
        //    id = Request.QueryString["id"].ToString();
           

        //    string day = DropDownList1.SelectedItem.Text;
        //    j = 0;
        //    if (day == "7Days")
        //    {
        //        for (int i = 1; i <= 10; i++)
        //        {
        //            using (SqlCommand cmd = new SqlCommand("select * from mapping_master where slot=" + i, conn))
        //            {
        //                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
        //                {
        //                    DataTable dt = new DataTable();
        //                    adp.Fill(dt);
        //                    if (dt.Rows.Count > 0)
        //                    {
        //                        continue;
        //                        j = j + 1;
        //                    }
        //                    else
        //                    {
        //                        using (SqlCommand cmd1 = new SqlCommand("update mapping_master  set slot=@slot where Product_id=@id", conn))
        //                        {
        //                            cmd1.Parameters.AddWithValue("@id", id);
        //                            cmd1.Parameters.AddWithValue("@slot", i);
        //                            conn.Open();
        //                            cmd1.ExecuteNonQuery();
        //                            conn.Close();

        //                        }
        //                        break;
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    else if (day == "15Days")
        //    {
        //        for (int i = 11; i <= 20; i++)
        //        {
        //            using (SqlCommand cmd = new SqlCommand("select * from mapping_master where slot=" + i, conn))
        //            {
        //                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
        //                {
        //                    DataTable dt = new DataTable();
        //                    adp.Fill(dt);
        //                    if (dt.Rows.Count > 0)
        //                    {
        //                        continue;
        //                    }
        //                    else
        //                    {
        //                        using (SqlCommand cmd1 = new SqlCommand("update mapping_master  set slot=@slot where Product_id=@id", conn))
        //                        {
        //                            cmd1.Parameters.AddWithValue("@id", id);
        //                            cmd1.Parameters.AddWithValue("@slot", i);
        //                            conn.Open();
        //                            cmd1.ExecuteNonQuery();
        //                            conn.Close();

        //                        }
        //                        break;
        //                    }
        //                }
        //            }
        //        }
        //    }

        //    else
        //    {
        //        for (int i = 21; i <= 30; i++)
        //        {
        //            using (SqlCommand cmd = new SqlCommand("select * from mapping_master where slot=" + i, conn))
        //            {
        //                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
        //                {
        //                    DataTable dt = new DataTable();
        //                    adp.Fill(dt);
        //                    if (dt.Rows.Count > 0)
        //                    {
        //                        continue;
        //                        j = j + 1;


        //                    }
        //                    else
        //                    {
        //                        using (SqlCommand cmd1 = new SqlCommand("update mapping_master  set slot=@slot where Product_id=@id", conn))
        //                        {
        //                            cmd1.Parameters.AddWithValue("@id", id);
        //                            cmd1.Parameters.AddWithValue("@slot", i);
        //                            conn.Open();
        //                            cmd1.ExecuteNonQuery();
        //                            conn.Close();

        //                        }
        //                        break;
        //                        j = j + 1;
        //                    }
        //                }
        //            }
        //        }
        //    }
        //}
        //else
        //{
        //    SqlConnection conn = new SqlConnection(cs);
        //    int id1;
        //    using (SqlCommand cm = new SqlCommand("select top 1 id from product_master order by id desc", conn))
        //    {
        //        using (SqlDataAdapter ad = new SqlDataAdapter(cm))
        //        {
        //            DataTable dtable = new DataTable();
        //            ad.Fill(dtable);
        //            if (dtable.Rows.Count > 0)
        //            {
        //                id1 = Convert.ToInt32(dtable.Rows[0]["id"].ToString());
        //                id1 = id1 + 1;
        //            }
        //            else
        //            {
        //                id1 = 1;
        //            }
        //        }
        //    }


        //    string day = DropDownList1.SelectedItem.Text;
        //    j = 0;
        //    if (day == "7Days")
        //    {
        //        for (int i = 1; i <= 10; i++)
        //        {
        //            using (SqlCommand cmd = new SqlCommand("select * from mapping_master where slot=" + i, conn))
        //            {
        //                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
        //                {
        //                    DataTable dt = new DataTable();
        //                    adp.Fill(dt);
        //                    if (dt.Rows.Count > 0)
        //                    {
        //                        continue;
        //                        j = j + 1;
        //                    }
        //                    else
        //                    {
        //                        using (SqlCommand cmd1 = new SqlCommand("insert into mapping_master (Product_id,slot) values(@id,@slot)", conn))
        //                        {
        //                            cmd1.Parameters.AddWithValue("@id", id1);
        //                            cmd1.Parameters.AddWithValue("@slot", i);
        //                            conn.Open();
        //                            cmd1.ExecuteNonQuery();
        //                            conn.Close();

        //                        }
        //                        break;
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    else if (day == "15Days")
        //    {
        //        for (int i = 11; i <= 20; i++)
        //        {
        //            using (SqlCommand cmd = new SqlCommand("select * from mapping_master where slot=" + i, conn))
        //            {
        //                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
        //                {
        //                    DataTable dt = new DataTable();
        //                    adp.Fill(dt);
        //                    if (dt.Rows.Count > 0)
        //                    {
        //                        continue;
        //                    }
        //                    else
        //                    {
        //                        using (SqlCommand cmd1 = new SqlCommand("insert into mapping_master (Product_id,slot) values(@id,@slot)", conn))
        //                        {
        //                            cmd1.Parameters.AddWithValue("@id", id1);
        //                            cmd1.Parameters.AddWithValue("@slot", i);
        //                            conn.Open();
        //                            cmd1.ExecuteNonQuery();
        //                            conn.Close();

        //                        }
        //                        break;
        //                    }
        //                }
        //            }
        //        }
        //    }

        //    else
        //    {
        //        for (int i = 21; i <= 30; i++)
        //        {
        //            using (SqlCommand cmd = new SqlCommand("select * from mapping_master where slot=" + i, conn))
        //            {
        //                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
        //                {
        //                    DataTable dt = new DataTable();
        //                    adp.Fill(dt);
        //                    if (dt.Rows.Count > 0)
        //                    {
        //                        continue;
        //                        j = j + 1;


        //                    }
        //                    else
        //                    {
        //                        using (SqlCommand cmd1 = new SqlCommand("insert into mapping_master (Product_id,slot) values(@id,@slot)", conn))
        //                        {
        //                            cmd1.Parameters.AddWithValue("@id", id1);
        //                            cmd1.Parameters.AddWithValue("@slot", i);
        //                            conn.Open();
        //                            cmd1.ExecuteNonQuery();
        //                            conn.Close();

        //                        }
        //                        break;
        //                        j = j + 1;
        //                    }
        //                }
        //            }
        //        }
        //    }
        //}





    }
}