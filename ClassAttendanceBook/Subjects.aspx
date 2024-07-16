<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subjects.aspx.cs" Inherits="ClassAttendanceBook.Subjects" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Subjects</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Manage Subjects</h2>
            <asp:GridView ID="GridViewSubjects" runat="server" AutoGenerateColumns="False" DataKeyNames="SubjectID"
                DataSourceID="SqlDataSourceSubjects">
                <Columns>
                    <asp:BoundField DataField="SubjectID" HeaderText="SubjectID" InsertVisible="False" ReadOnly="True" SortExpression="SubjectID" />
                    <asp:BoundField DataField="SubjectName" HeaderText="SubjectName" SortExpression="SubjectName" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceSubjects" runat="server"
                ConnectionString="<%$ ConnectionStrings:SchoolDB %>"
                SelectCommand="SELECT * FROM [Subjects]"
                UpdateCommand="UPDATE [Subjects] SET [SubjectName] = @SubjectName WHERE [SubjectID] = @SubjectID"
                DeleteCommand="DELETE FROM [Subjects] WHERE [SubjectID] = @SubjectID">
                <UpdateParameters>
                    <asp:Parameter Name="SubjectName" Type="String" />
                    <asp:Parameter Name="SubjectID" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="SubjectID" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <br />
            <asp:TextBox ID="txtSubjectName" runat="server" placeholder="Subject Name"></asp:TextBox>
            <asp:Button ID="btnAddSubject" runat="server" Text="Add Subject" OnClick="btnAddSubject_Click" />
        </div>
    </form>
</body>
</html>
