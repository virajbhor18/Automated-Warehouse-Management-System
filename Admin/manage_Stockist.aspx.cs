using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    protected static bool flag;
    protected static DataTable dt;
    public static string msg = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["aid"] == null)
        {
            Response.Redirect("MainLogin.aspx");
        }
        if(!IsPostBack)
        {
            msg = Request.QueryString["msg"].ToString();
            if (msg == "add")
            {
                Response.Write("<script>alert('Stockist add successfully.')</script>");
            }
            else if(msg == "update")
            {
                Response.Write("<script>alert('Stockist updated successfully.')</script>");
            }

            SqlConnection conn = new SqlConnection(cs);
            dt = new DataTable();
            using (SqlCommand cmd = new SqlCommand("select * from stockist_master", conn))
            {
                //String ActionS = "SELECT";
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@Action", ActionS);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                }
                if (dt.Rows.Count > 0)
                {
                    flag = true;
                }
            }
        }
        

    }
}