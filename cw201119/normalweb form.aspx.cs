using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace cw201119
{
    public partial class normalweb_form : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            bindData();
        }

          public void bindData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from hw201119", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            grd.DataSource = dt;
            grd.DataBind();
        }

        protected void txtbtn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into hw201119(F_Name,L_Name,Salary)values('" + txtfname.Text + "','" + txtlname.Text + "', '" + txtsalary.Text + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            bindData();
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from hw201119 where Id='" + e.CommandArgument + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            bindData();
        }
    }
}