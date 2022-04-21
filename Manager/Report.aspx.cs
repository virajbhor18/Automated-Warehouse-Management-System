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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["aid"] == null)
        {
            Response.Redirect("MainLogin.aspx");
        }
        SqlConnection conn = new SqlConnection(cs);
        //using (SqlCommand cmd1 = new SqlCommand("select distinct remove_date as dates from report_master union select distinct add_date from report_master  ", conn))
        //{
        //    //cmd1.Parameters.AddWithValue("@cname", Session["cname"].ToString());
        //    using (SqlDataAdapter adp1 = new SqlDataAdapter(cmd1))
        //    {
        //        DataTable dt1 = new DataTable();
        //        adp1.Fill(dt1);
        //        if (dt1.Rows.Count > 0)
        //        {
        //            DropDownList1.DataSource = dt1;
        //            DropDownList1.DataTextField = "dates";
        //            DropDownList1.DataValueField = "dates";
        //            DropDownList1.DataBind();
        //        }

        //    }
        //    DropDownList1.Items.Insert(0, new ListItem("SELECT COMPANY"));

        //}

        using (SqlCommand cmd1 = new SqlCommand("select distinct(add_date), count(prod_name)as Cnt from report_master where company_name =@cname group by add_date", conn))
        {
            cmd1.Parameters.AddWithValue("@cname", Session["cname"].ToString());
            DataTable dt1 = new DataTable();
            using (SqlDataAdapter adp1 = new SqlDataAdapter(cmd1))
            {
                adp1.Fill(dt1);
            }
            string[] x = new string[dt1.Rows.Count];
            double[] y = new double[dt1.Rows.Count];
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                x[i] = dt1.Rows[i].ItemArray[0].ToString();
                y[i] = Convert.ToDouble(dt1.Rows[i].ItemArray[1]);
                Chart1.ChartAreas[0].AxisX.Interval = 1;
                Chart1.Series["Series1"].Points.DataBindXY(x, y);

            }
        }



        using (SqlCommand cmd = new SqlCommand("select distinct(remove_date), count(prod_name)as Cnt from report_master group by remove_date", conn))
        {
            DataTable dt = new DataTable();
            cmd.Parameters.AddWithValue("@cname", Session["cname"].ToString());
            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                adp.Fill(dt);
            }
            string[] x = new string[dt.Rows.Count];
            double[] y = new double[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i].ItemArray[0].ToString();
                y[i] = Convert.ToDouble(dt.Rows[i].ItemArray[1]);
                Chart2.ChartAreas[0].AxisX.Interval = 1;
                Chart2.Series["Series1"].Points.DataBindXY(x, y);

            }
        }

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

}