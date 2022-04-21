using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    public string countprod;
    public string countreport;
    public int countfaculty;
    //public int countcommittee;
    //public int countplacecom;
    //public int countexam;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["aid"] == null)
        {
            Response.Redirect("adminLogin.aspx");
        }
        SqlConnection conn = new SqlConnection(cs);
        using(SqlCommand cmd = new SqlCommand("select count(id) as count_id from product_master",conn))
        {
            using(SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                adp.Fill(dt);
                if(dt.Rows.Count>0)
                {
                    countprod = dt.Rows[0]["count_id"].ToString(); 
                }
            }
        }


        using (SqlCommand cmd1 = new SqlCommand("select count(id) as count_id from report_master", conn))
        {
            using (SqlDataAdapter adp1 = new SqlDataAdapter(cmd1))
            {
                DataTable dt1 = new DataTable();
                adp1.Fill(dt1);
                if (dt1.Rows.Count > 0)
                {
                    countreport = dt1.Rows[0]["count_id"].ToString();
                }
            }
        }

        //---startoldcode---
        //SqlConnection conn = new SqlConnection(cs);
        //SqlDataAdapter da = new SqlDataAdapter(new SqlCommand("select count(sid)as countstudent from student_master;select count(exam_id) as countnotes from notes_master;", conn));
       
        //DataSet ds = new DataSet();
        //da.Fill(ds);
        //countEmployee = (int)(ds.Tables[0].Rows[0]["countstudent"]);
        //countnotes = (int)(ds.Tables[1].Rows[0]["countnotes"]);

        //countcommittee = (int)(ds.Tables[2].Rows[0]["countcommittee"]);
        //countplacecom = (int)(ds.Tables[3].Rows[0]["countplacecom"]);
        //countexam = (int)(ds.Tables[4].Rows[0]["countexam"]);

        //----endoldcode---

        //SqlConnection conn = new SqlConnection(cs);
        //SqlDataAdapter da = new SqlDataAdapter(new SqlCommand("select count(Stu_id) as countStudent from [Student_Master]", conn));
        //DataTable dt = new DataTable();
        //da.Fill(dt);
        //countEmployee = (int)(dt.Rows[0]["countStudent"]);

       
        //SqlDataAdapter da1 = new SqlDataAdapter(new SqlCommand("select count(Fac_id) as countfaculty from [Faculty_master]", conn));
        //DataTable dt1 = new DataTable();
        //da1.Fill(dt1);
        //countfaculty = (int)(dt1.Rows[0]["countfaculty"]);

        //SqlDataAdapter da2 = new SqlDataAdapter(new SqlCommand("select count(Notice_id) as countnotice from [Notice_master]", conn));
        //DataTable dt2 = new DataTable();
        //da2.Fill(dt2);
        //countnotice = (int)(dt2.Rows[0]["countnotice"]);



    }
}