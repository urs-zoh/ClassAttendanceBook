using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClassAttendanceBook
{
    public partial class Groups : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddGroup_Click(object sender, EventArgs e)
        {
            string groupName = txtGroupName.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Groups (GroupName) VALUES (@GroupName)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@GroupName", groupName);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            GridViewGroups.DataBind();
            txtGroupName.Text = string.Empty;
        }
    }
}