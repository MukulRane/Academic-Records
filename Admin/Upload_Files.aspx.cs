using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Management;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static string msg = "";
    protected static string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["admin_id"] == null)
            {
                Response.Redirect("admin_login.aspx");
            }


            conn = new SqlConnection(cs);

            bind1();
            bind2();
            DropDownList3.Visible = false;
            btnsubmit.Visible = false;
            fileuplogo.Visible = false;
        }
        
       // 


        }
    public void bind1()
    {
        conn = new SqlConnection(cs);
        using (SqlCommand cmd = new SqlCommand("select * from branch_master", conn))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    DropDownList1.DataSource = dt;
                    DropDownList1.DataValueField = "branch_id";
                    DropDownList1.DataTextField = "branch_name";
                    DropDownList1.DataBind();

                }
            }
        }
        DropDownList1.Items.Insert(0, new ListItem("--Select Branch.--", ""));

    }


    public void bind2()
    {
        conn = new SqlConnection(cs);
        using (SqlCommand cmd = new SqlCommand("select * from sem_master", conn))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    DropDownList2.DataSource = dt;
                    DropDownList2.DataValueField = "sem_id";
                    DropDownList2.DataTextField = "semester";
                    DropDownList2.DataBind();

                }
            }
        }
        DropDownList2.Items.Insert(0, new ListItem("--Select Semester.--", ""));

    }



    protected void btnsubmit_Click(object sender, EventArgs e)
    {
       

        conn = new SqlConnection(cs);


    

            DataTable dt = new DataTable();

            using (SqlCommand cmd1 = new SqlCommand("select * from File_master where student_id=@id and file_name=@fname", conn))
            {
                string str = fileuplogo.FileName;
                fileuplogo.PostedFile.SaveAs(Server.MapPath("~/File/" + str));
                string image = "~/File/" + str.ToString();
                cmd1.Parameters.AddWithValue("@id", DropDownList1.SelectedValue);
                cmd1.Parameters.AddWithValue("@fname", str);


                SqlDataAdapter sda = new SqlDataAdapter(cmd1);
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('File Already Exist')</script>");
                }
                else
                {

                    using (SqlCommand cmd = new SqlCommand("insert into file_master (branch,sem,file_name,student_id,date) values(@branch,@sem,@fname,@id,getdate())", conn))
                    {

                        cmd.Parameters.AddWithValue("@branch", DropDownList1.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@sem", DropDownList2.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@id", DropDownList3.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@fname", str);



                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        Response.Redirect("manage_files.aspx");
                    }
                }




            

        }
    }


    //protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    conn = new SqlConnection(cs);
    //    using (
    //        SqlCommand cmd = new SqlCommand("select student_id from student_master where branch=@branch and semester=@sem", conn)
    //        )
    //    {
    //        cmd.Parameters.AddWithValue("@branch", DropDownList1.SelectedItem.Text);
    //        cmd.Parameters.AddWithValue("@sme", DropDownList2.SelectedItem.Text);
    //        using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
    //        {
    //            DataTable dt = new DataTable();
    //            adp.Fill(dt);
    //            if (dt.Rows.Count > 0)
    //            {
    //                DropDownList3.DataSource = dt;
    //                DropDownList3.DataValueField = "student_id";
    //                DropDownList3.DataTextField = "student_id";
    //                DropDownList3.DataBind();
    //                // DropDownList3.Items.Insert(0, new ListItem("--Select Student.--", ""));
    //            }
    //        }
    //    }
    //}

    protected void btnsubmit0_Click(object sender, EventArgs e)
    {
        DropDownList3.Visible = true;
        btnsubmit.Visible = true;
        btnsubmit0.Visible = false;
        fileuplogo.Visible = true;
        conn = new SqlConnection(cs);
        using (
            SqlCommand cmd = new SqlCommand("select student_id from student_master where branch=@branch and semester=@sem", conn)
            )
        {
            cmd.Parameters.AddWithValue("@branch", DropDownList1.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@sem", DropDownList2.SelectedItem.Text);
            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    DropDownList3.DataSource = dt;
                    DropDownList3.DataValueField = "student_id";
                    DropDownList3.DataTextField = "student_id";
                    DropDownList3.DataBind();
                     DropDownList3.Items.Insert(0, new ListItem("--Select Student.--", ""));
                }
            }
        }
    }
}