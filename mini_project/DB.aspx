<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DB.aspx.cs" Inherits="mini_project_full.DB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .withBorder{
            border:solid;
            border-width:thin;
            margin-top: 30px;
            background-color:cadetblue;
            width:600px;
        }
        textarea{
            width:95%;
            margin:10px;
            background-color:antiquewhite;
        }
        button, span, input{
            margin:10px;
        }
        table{
            width:100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="idResultTable0" runat="server" class="withBorder" style="background-color:aqua"></div>
    <div id="idCountResult0" runat="server" style="margin-top: 20px"></div>
    <button id="btnRetrieveAll" runat="server" onserverclick="btnRetrieveAll_ServerClick" style="display: block">Retrieve All</button>

    <div class="withBorder">
        <div>[connected]</div>
        <textarea id="inSqlCommand" runat="server" rows="2" cols="100">select * from sandboxTable where username like '%us%'</textarea>
        <div class="withBorder">
            <script>
                function selectCommand() {
                    inSqlCommand.innerHTML = idSelectCommand.options[idSelectCommand.selectedIndex].innerHTML;
                }
            </script>
            <select id="idSelectCommand" runat="server" onchange="selectCommand();">
                <option>select * from sandboxTable</option>
                <option>select username, password from sandboxTable where username = 'user1' or username = 'user2'</option>
                <option>insert into sandboxTable (username, password) values('user100','p1234'), ('user101','p12345')</option>
                <option>update sandboxTable set password = '0123456789' where username='user3'</option>
                <option>delete from sandboxTable where username = 'user6'</option>
            </select>
        </div>
        <button id="btnGetSomeFromTable" runat="server" onserverclick="btnRetrieveFromTable_ServerClick" style="display: block">Run Command</button>
        <div id="idResultTable1" runat="server" class="withBorder"></div>
        <div id="idCountResult1" runat="server" style="margin-top: 20px"></div>
    </div>

    <div class="withBorder">
        <div>[connected]</div>
        <span>Add new user</span>        
        <input id="inUserToAdd" runat="server" placeholder="user name"/>
        <input id="inPasswordToAdd" runat="server" placeholder="password" />
        <button id="btnAddUser" runat="server" onserverclick="btnAddUser_ServerClick" style="display: block">Add User</button>
        <div id="idAddUser" runat="server" style="margin-top: 20px"></div>
        <div id="idCountResult2" runat="server" style="margin-top: 20px"></div>
    </div>

    <div class="withBorder">
        <div>[disconnected]</div>
        <textarea id="inSqlCommand2" runat="server" rows="2" cols="100">select count(id) from sandboxTable  where username='user3' and password='ab12'</textarea>
        <button id="btnExecuteScalar" runat="server" onserverclick="btnExecuteScalar_ServerClick" style="display: block">Execute Scalar</button>
        <div id="idCountResult3" runat="server" style="margin-top: 20px"></div>
    </div>

    <div class="withBorder">
        <div>[disconnected]</div>
        <textarea id="inSqlCommand3" runat="server" rows="2" cols="100">update sandboxTable set password='123456789' where userName='user2'</textarea>
        <button id="btnExecuteNonQuery" runat="server" onserverclick="btnExecuteNonQuery_ServerClick" style="display: block">Execute NonQuery</button>
        <div id="idCountResult4" runat="server" style="margin-top: 20px"></div>
    </div>
</asp:Content>
