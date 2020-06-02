using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static string msg = "";
    protected static string id;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            if (Session["sid"] == null)
            {
                Response.Redirect("login.aspx");
            }
            string id = Session["sid"].ToString();
         
            conn = new SqlConnection(cs);
            using (SqlCommand cmd = new SqlCommand("select * from student_master where student_id=@id", conn))
            {
                cmd.Parameters.AddWithValue("@id",id);
                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        txtid.Text = dt.Rows[0]["Student_id"].ToString();
                        txtname.Text = dt.Rows[0]["Name"].ToString();
                        txtaddress.Text = dt.Rows[0]["address"].ToString();
                        txtemail.Text = dt.Rows[0]["email"].ToString();
                        txtphone.Text = dt.Rows[0]["phone"].ToString();
                        txtdate.Text = dt.Rows[0]["dob"].ToString();
                        txtbranch.Text = dt.Rows[0]["Branch"].ToString();
                        txtsem.Text = dt.Rows[0]["Semester"].ToString();
                        string str = dt.Rows[0]["profile"].ToString();
                        showimge.ImageUrl = ("~/admin/img/" + str);
                    }
                }
            }


        }

    }



    }
