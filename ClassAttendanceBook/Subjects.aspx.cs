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
    public partial class Subjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddSubject_Click(object sender, EventArgs e)
        {
            string subjectName = txtSubjectName.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Subjects (SubjectName) VALUES (@SubjectName)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@SubjectName", subjectName);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            GridViewSubjects.DataBind();
            txtSubjectName.Text = string.Empty;
        }
    }
}