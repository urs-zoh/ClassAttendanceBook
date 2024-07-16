<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="ClassAttendanceBook.Attendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Attendance</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Manage Attendance</h2>
            <asp:GridView ID="GridViewAttendance" runat="server" AutoGenerateColumns="False" DataKeyNames="AttendanceID"
                DataSourceID="SqlDataSourceAttendance">
                <Columns>
                    <asp:BoundField DataField="AttendanceID" HeaderText="AttendanceID" InsertVisible="False" ReadOnly="True" SortExpression="AttendanceID" />
                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
                    <asp:BoundField DataField="SubjectID" HeaderText="SubjectID" SortExpression="SubjectID" />
                    <asp:BoundField DataField="AttendanceDate" HeaderText="AttendanceDate" SortExpression="AttendanceDate" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="IsPresent" HeaderText="IsPresent" SortExpression="IsPresent" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceAttendance" runat="server"
                ConnectionString="<%$ ConnectionStrings:SchoolDB %>"
                SelectCommand="SELECT * FROM [Attendance]"
                UpdateCommand="UPDATE [Attendance] SET [StudentID] = @StudentID, [SubjectID] = @SubjectID, [AttendanceDate] = @AttendanceDate, [IsPresent] = @IsPresent WHERE [AttendanceID] = @AttendanceID"
                DeleteCommand="DELETE FROM [Attendance] WHERE [AttendanceID] = @AttendanceID">
                <UpdateParameters>
                    <asp:Parameter Name="StudentID" Type="Int32" />
                    <asp:Parameter Name="SubjectID" Type="Int32" />
                    <asp:Parameter Name="AttendanceDate" Type="DateTime" />
                    <asp:Parameter Name="IsPresent" Type="Boolean" />
                    <asp:Parameter Name="AttendanceID" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="AttendanceID" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <br />
            <asp:TextBox ID="txtStudentID" runat="server" placeholder="Student ID"></asp:TextBox>
            <asp:TextBox ID="txtSubjectID" runat="server" placeholder="Subject ID"></asp:TextBox>
            <asp:TextBox ID="txtAttendanceDate" runat="server" placeholder="Attendance Date (yyyy-MM-dd)"></asp:TextBox>
            <asp:CheckBox ID="chkIsPresent" runat="server" Text="Is Present" />
            <asp:Button ID="btnAddAttendance" runat="server" Text="Add Attendance" OnClick="btnAddAttendance_Click" />
        </div>
    </form>
</body>
</html>
