using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Windows.Forms;

public partial class Admin_Default : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    protected static bool flag;
    protected static DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            SqlConnection conn = new SqlConnection(cs);
            using (SqlCommand cmd1 = new SqlCommand("select distinct(company_name) from manager_master", conn))
            {
                //cmd1.Parameters.AddWithValue("@cname", Session["cname"].ToString());
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


        }


    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        flag = true;

        SqlConnection conn = new SqlConnection(cs);
        using (SqlCommand cmd = new SqlCommand("select slot from mapping_master where company_name=@cname", conn))
        {
            cmd.Parameters.AddWithValue("@cname",DropDownList1.SelectedItem.Text);
            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string id = dt.Rows[i]["slot"].ToString();
                        if (id == "1")
                        {
                            Button1.BackColor = Color.Red;
                        }
                        else if (id == "2")
                        {
                            Button2.BackColor = Color.Red;
                        }
                        else if (id == "3")
                        {
                            Button3.BackColor = Color.Red;
                        }
                        else if (id == "4")
                        {
                            Button4.BackColor = Color.Red;
                        }
                        else if (id == "5")
                        {
                            Button5.BackColor = Color.Red;
                        }
                        else if (id == "6")
                        {
                            Button6.BackColor = Color.Red;
                        }
                        else if (id == "7")
                        {
                            Button7.BackColor = Color.Red;
                        }
                        else if (id == "8")
                        {
                            Button8.BackColor = Color.Red;
                        }
                        else if (id == "9")
                        {
                            Button9.BackColor = Color.Red;
                        }
                        else if (id == "10")
                        {
                            Button10.BackColor = Color.Red;
                        }
                        else if (id == "11")
                        {
                            Button11.BackColor = Color.Red;
                        }
                        else if (id == "12")
                        {
                            Button12.BackColor = Color.Red;
                        }
                        else if (id == "13")
                        {
                            Button13.BackColor = Color.Red;
                        }
                        else if (id == "14")
                        {
                            Button14.BackColor = Color.Red;
                        }
                        else if (id == "15")
                        {
                            Button15.BackColor = Color.Red;
                        }
                        else if (id == "16")
                        {
                            Button16.BackColor = Color.Red;
                        }
                        else if (id == "17")
                        {
                            Button17.BackColor = Color.Red;
                        }
                        else if (id == "18")
                        {
                            Button18.BackColor = Color.Red;
                        }

                        else if (id == "19")
                        {
                            Button19.BackColor = Color.Red;
                        }
                        else if (id == "20")
                        {
                            Button20.BackColor = Color.Red;
                        }
                        else if (id == "21")
                        {
                            Button21.BackColor = Color.Red;
                        }
                        else if (id == "22")
                        {
                            Button22.BackColor = Color.Red;
                        }
                        else if (id == "23")
                        {
                            Button23.BackColor = Color.Red;
                        }
                        else if (id == "24")
                        {
                            Button24.BackColor = Color.Red;
                        }
                        else if (id == "25")
                        {
                            Button25.BackColor = Color.Red;
                        }
                        else if (id == "26")
                        {
                            Button26.BackColor = Color.Red;
                        }
                        else if (id == "27")
                        {
                            Button27.BackColor = Color.Red;
                        }
                        else if (id == "28")
                        {
                            Button28.BackColor = Color.Red;
                        }
                        else if (id == "29")
                        {
                            Button29.BackColor = Color.Red;
                        }
                        else if (id == "30")
                        {
                            Button30.BackColor = Color.Red;
                        }

                    }
                }

            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=1");


    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=2");


    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=3");


    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=4");


    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=5");


    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=6");


    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=7");


    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=8");


    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=9");


    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=10");


    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=11");


    }
    protected void Button12_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=12");


    }
    protected void Button13_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=13");


    }
    protected void Button14_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=14");


    }
    protected void Button15_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=15");


    }
    protected void Button16_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=16");


    }
    protected void Button17_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=17");


    }
    protected void Button18_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=18");


    }
    protected void Button19_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=19");


    }
    protected void Button20_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=20");


    }
    protected void Button21_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=21");


    }
    protected void Button22_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=22");


    }
    protected void Button23_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=23");


    }
    protected void Button24_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=24");


    }
    protected void Button25_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=25");


    }
    protected void Button26_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=26");


    }
    protected void Button27_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=27");


    }
    protected void Button28_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=28");


    }
    protected void Button29_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=29");


    }
    protected void Button30_Click(object sender, EventArgs e)
    {
        Response.Redirect("Details.aspx?id=30");
    }



}