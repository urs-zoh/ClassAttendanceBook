<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Groups.aspx.cs" Inherits="ClassAttendanceBook.Groups" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Groups</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Manage Groups</h2>
            <asp:GridView ID="GridViewGroups" runat="server" AutoGenerateColumns="False" DataKeyNames="GroupID"
                DataSourceID="SqlDataSourceGroups">
                <Columns>
                    <asp:BoundField DataField="GroupID" HeaderText="GroupID" InsertVisible="False" ReadOnly="True" SortExpression="GroupID" />
                    <asp:BoundField DataField="GroupName" HeaderText="GroupName" SortExpression="GroupName" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceGroups" runat="server"
                ConnectionString="<%$ ConnectionStrings:SchoolDB %>"
                SelectCommand="SELECT * FROM [Groups]"
                UpdateCommand="UPDATE [Groups] SET [GroupName] = @GroupName WHERE [GroupID] = @GroupID"
                DeleteCommand="DELETE FROM [Groups] WHERE [GroupID] = @GroupID">
                <UpdateParameters>
                    <asp:Parameter Name="GroupName" Type="String" />
                    <asp:Parameter Name="GroupID" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="GroupID" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <br />
            <asp:TextBox ID="txtGroupName" runat="server" placeholder="Group Name"></asp:TextBox>
            <asp:Button ID="btnAddGroup" runat="server" Text="Add Group" OnClick="btnAddGroup_Click" />
        </div>
    </form>
</body>
</html>
