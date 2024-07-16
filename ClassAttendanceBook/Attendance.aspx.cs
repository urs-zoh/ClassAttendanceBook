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
    public partial class Attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddAttendance_Click(object sender, EventArgs e)
        {
            int studentId = int.Parse(txtStudentID.Text);
            int subjectId = int.Parse(txtSubjectID.Text);
            DateTime attendanceDate = DateTime.Parse(txtAttendanceDate.Text);
            bool isPresent = chkIsPresent.Checked;

            string connectionString = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Attendance (StudentID, SubjectID, AttendanceDate, IsPresent) VALUES (@StudentID, @SubjectID, @AttendanceDate, @IsPresent)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentID", studentId);
                cmd.Parameters.AddWithValue("@SubjectID", subjectId);
                cmd.Parameters.AddWithValue("@AttendanceDate", attendanceDate);
                cmd.Parameters.AddWithValue("@IsPresent", isPresent);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            GridViewAttendance.DataBind();
            txtStudentID.Text = string.Empty;
            txtSubjectID.Text = string.Empty;
            txtAttendanceDate.Text = string.Empty;
            chkIsPresent.Checked = false;
        }
    }
}