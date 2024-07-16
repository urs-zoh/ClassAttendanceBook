<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="ClassAttendanceBook.Students" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Students</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Manage Students</h2>
            <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
                DataSourceID="SqlDataSourceStudents">
                <Columns>
                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" InsertVisible="False" ReadOnly="True" SortExpression="StudentID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="GroupID" HeaderText="GroupID" SortExpression="GroupID" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server"
                ConnectionString="<%$ ConnectionStrings:SchoolDB %>"
                SelectCommand="SELECT * FROM [Students]"
                UpdateCommand="UPDATE [Students] SET [FirstName] = @FirstName, [LastName] = @LastName, [DateOfBirth] = @DateOfBirth, [GroupID] = @GroupID WHERE [StudentID] = @StudentID"
                DeleteCommand="DELETE FROM [Students] WHERE [StudentID] = @StudentID">
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="DateOfBirth" Type="DateTime" />
                    <asp:Parameter Name="GroupID" Type="Int32" />
                    <asp:Parameter Name="StudentID" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="StudentID" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <br />
            <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name"></asp:TextBox>
            <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name"></asp:TextBox>
            <asp:TextBox ID="txtDateOfBirth" runat="server" placeholder="Date of Birth (yyyy-MM-dd)"></asp:TextBox>
            <asp:TextBox ID="txtGroupID" runat="server" placeholder="Group ID"></asp:TextBox>
            <asp:Button ID="btnAddStudent" runat="server" Text="Add Student" OnClick="btnAddStudent_Click" />
        </div>
    </form>
</body>
</html>
