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
            if (Request.QueryString["msg"] != null)
            {

                msg = Request.QueryString["msg"].ToString();
                id = Request.QueryString["id"].ToString();
                if (msg == "edit")
                {

                    using (SqlCommand cmd = new SqlCommand(
                                " select * from tpo_master where id=@id", conn))
                    {

                        cmd.Parameters.AddWithValue("@id", id);
                        DataTable dt = new DataTable();
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(dt);
                        }
                        if (dt.Rows.Count > 0)
                        {

                            txtcompany.Text = dt.Rows[0]["Company_name"].ToString();
                            txtname.Text = dt.Rows[0]["name"].ToString();
                            txtcontact.Text = dt.Rows[0]["phone"].ToString();
                            txtadd.Text = dt.Rows[0]["address"].ToString();
                            txtemail.Text = dt.Rows[0]["email"].ToString();
                        }
                    }
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

            using (
                SqlCommand cmd =
                    new SqlCommand(
                        "update tpo_master set company_name=@comp,name=@name,email=@email,@phone=@phone,@address=@address",
                        conn))
            {
                cmd.Parameters.AddWithValue("@comp", txtcompany.Text);
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);

                cmd.Parameters.AddWithValue("@phone", txtcontact.Text);

                cmd.Parameters.AddWithValue("@address", txtadd.Text);
                

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("manage_to.aspx");

            }
        }

        else
        {
                var chars = "QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm0987654321";
                var stringargs = new char[8];
                var random = new Random();
                for (int i = 0; i < stringargs.Length; i++)
                {
                    stringargs[i] = chars[random.Next(chars.Length)];
                }

                string password = new String(stringargs);

            DataTable dt = new DataTable();

            using (SqlCommand cmd1 = new SqlCommand("select * from tpo_master where email=@email and company_name=@comp", conn))
            {

                cmd1.Parameters.AddWithValue("@email", txtemail.Text);
                cmd1.Parameters.AddWithValue("@comp", txtcompany.Text);


                SqlDataAdapter sda = new SqlDataAdapter(cmd1);
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('shop already exist')</script>");
                }
                else
                {

                    using (SqlCommand cmd = new SqlCommand("insert into tpo_master (company_name,name,email,phone,address,password) values(@comp,@name,@email,@phone,@address,@pass)", conn))
                    {

                        cmd.Parameters.AddWithValue("@comp",txtcompany.Text);
                        cmd.Parameters.AddWithValue("@name",txtname.Text);
                        cmd.Parameters.AddWithValue("@email",txtemail.Text);

                        cmd.Parameters.AddWithValue("@phone", txtcontact.Text);

                        cmd.Parameters.AddWithValue("@address", txtadd.Text);
                        cmd.Parameters.AddWithValue("@pass",password);
                        

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        Response.Redirect("manage_to.aspx");
                    }
                }
            }
        }
    }
}
