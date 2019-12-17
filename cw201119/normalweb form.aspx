<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="normalweb form.aspx.cs" Inherits="cw201119.normalweb_form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <script type ="text/javascript">
       function validation() {
           var dabba = "";
           dabba += checkF_Name();
           dabba += checkL_Name();
           dabba += checkSalary();
           if (dabba == "") {
               return true;
           }
           else {
               alert(dabba);
               return false;
           }
       }
       {
           function checkF_Name() {
               var TB = document.getElementById('txtfname');
               if (TB.value == "") {
                   return 'Plz enter your fname!!\n';
               }
               else {
                   return "";
               }
           }
           function checkL_Name() {
               var TB = document.getElementById('txtlname');
               if (TB.value == "") {
                   return 'Plz enter your lname!!\n';

               }
               else {
                   return "";
               }
           }
           function checkSalary() {
               var TB = document.getElementById('txtsalary');
               if (TB.value == "") {
                   return 'Plz enter your salary!!\n';
               }
               else {
                   return "";
               }
           }

       }
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>F_Name</td>
                <td><asp:TextBox ID ="txtfname" runat="server"></asp:TextBox></td>
            </tr>

              <tr>
                <td>L_Name</td>
                <td><asp:TextBox ID ="txtlname" runat="server"></asp:TextBox></td>
            </tr>

              <tr>
                <td>Salary</td>
                <td><asp:TextBox ID ="txtsalary" runat="server"></asp:TextBox></td>
            </tr>

              <tr>
                <td></td>
                <td><asp:Button ID ="txtbtn" runat="server" Text="Save" OnClientClick="return validation()" OnClick="txtbtn_Click"></asp:Button></td>
            </tr>

              <tr>
                <td></td>
                <td><asp:GridView ID ="grd" runat="server" OnRowCommand="grd_RowCommand" >
                   <Columns>
                          <asp:TemplateField>
                              <ItemTemplate>
                                  <asp:linkButton ID="btndelete" runat="server"  Text="Delete" CommandArgument='<%#Eval("Id") %>'></asp:linkButton>
                              </ItemTemplate>
                          </asp:TemplateField>
                    </Columns>
                    </asp:GridView></td>
                 
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
