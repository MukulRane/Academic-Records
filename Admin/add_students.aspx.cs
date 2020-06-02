using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
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

            bind1();
            bind2();
            conn = new SqlConnection(cs);
            if (Request.QueryString["msg"] != null)
            {

                msg = Request.QueryString["msg"].ToString();
                id = Request.QueryString["id"].ToString();
                if (msg == "edit")
                {
                    using (SqlCommand cmd = new SqlCommand("select * from student_master where student_id=@id",conn))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
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
                                DropDownlist1.SelectedItem.Text=dt.Rows[0]["Branch"].ToString();
                                DropDownList2.SelectedItem.Text=dt.Rows[0]["Semester"].ToString();
                                string str= dt.Rows[0]["profile"].ToString();
                                showimge.ImageUrl = ("img/" + str);
                            }
                        }
                    }

                   //fileuplogo.Visible = false;
                   
                }
            }


        }

    }


    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);

        string msg1 = Request.QueryString["msg"] != null ? Request.QueryString["msg"].ToString() : "";
        if (msg1 == "edit")
        {
            string str = fileuplogo.FileName;
            fileuplogo.PostedFile.SaveAs(Server.MapPath("img/" + str));
            string image = "img/" + str.ToString();
            using (
                SqlCommand cmd =
                    new SqlCommand(
                        "update student_master set student_id=@id,name=@name,branch=@branch,semester=@sem,email=@email,phone=@phone,address=@address,dob=@dob,profile=@profile",
                        conn))
            {
                cmd.Parameters.AddWithValue("@id", txtid.Text);
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@branch", DropDownlist1.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@sem", DropDownList2.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                cmd.Parameters.AddWithValue("@phone", txtphone.Text);
                cmd.Parameters.AddWithValue("@address", txtaddress.Text);
                cmd.Parameters.AddWithValue("@dob", txtdate.Text);
                cmd.Parameters.AddWithValue("@profile", str);
                
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("manage_student.aspx");
            }

           

            
        }

        else
        {

            DataTable dt1 = new DataTable();

            if (fileuplogo.HasFile)
            {
                var chars = "QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm0987654321";
                var stringargs = new char[8];
                var random = new Random();
                for (int i = 0; i < stringargs.Length; i++)
                {
                    stringargs[i] = chars[random.Next(chars.Length)];
                }

                string password = new String(stringargs);

                string str = fileuplogo.FileName;
                fileuplogo.PostedFile.SaveAs(Server.MapPath("img/" + str));
                string image = "img/" + str.ToString();
                using (
                    SqlCommand cmd =
                        new SqlCommand(
                            "select * from student_master where student_id=@id1 and branch=@branch1 and semester=@sem1",
                            conn))
                {
                    cmd.Parameters.AddWithValue("@id1", txtid.Text);
                    cmd.Parameters.AddWithValue("@name1", txtname.Text);
                    cmd.Parameters.AddWithValue("@branch1", DropDownlist1.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@sem1", DropDownList2.SelectedItem.Text);
                    using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        adp.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            Response.Write("<script>alert('ERROR!! Student already exist.')</script>");
                        }
                        else
                        {
                            using (
                                SqlCommand cmd1 =
                                    new SqlCommand(
                                        "insert into student_master(student_id,name,branch,semester,email,phone,address,dob,profile,password) values(@id,@name,@branch,@sem,@email,@phone,@address,@dob,@profile,@pass)",
                                        conn))
                            {
                                cmd1.Parameters.AddWithValue("@id", txtid.Text);
                                cmd1.Parameters.AddWithValue("@name", txtname.Text);
                                cmd1.Parameters.AddWithValue("@branch", DropDownlist1.SelectedItem.Text);
                                cmd1.Parameters.AddWithValue("@sem", DropDownList2.SelectedItem.Text);
                                cmd1.Parameters.AddWithValue("@email", txtemail.Text);
                                cmd1.Parameters.AddWithValue("@phone", txtphone.Text);
                                cmd1.Parameters.AddWithValue("@address", txtaddress.Text);
                                cmd1.Parameters.AddWithValue("@dob", txtdate.Text);
                                cmd1.Parameters.AddWithValue("@profile", str);
                                cmd1.Parameters.AddWithValue("@pass", password);
                                conn.Open();
                                cmd1.ExecuteNonQuery();
                                conn.Close();
                                Response.Redirect("manage_student.aspx");
                            }
                        }
                    }
                }
            }
        }
    }

    public void bind1()
    {
        conn = new SqlConnection(cs);
        using (SqlCommand cmd = new SqlCommand("select * from branch_master", conn))
        {
            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                DataTable dt= new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    DropDownlist1.DataSource = dt;
                    DropDownlist1.DataTextField = "branch_name";
                    DropDownlist1.DataValueField = "branch_id";
                    DropDownlist1.DataBind();
                }
            }

       }
    }
    public void bind2()
    {
        conn = new SqlConnection(cs);
        using (SqlCommand cmd = new SqlCommand("select * from Sem_master", conn))
        {
            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    DropDownList2.DataSource = dt;
                    DropDownList2.DataTextField = "Semester";
                    DropDownList2.DataValueField = "sem_id";
                    DropDownList2.DataBind();
                }
            }

        }
    }
}
        

        
    

    
