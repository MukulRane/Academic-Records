<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Add_Tpo.aspx.cs" Inherits="Admin_Default"  enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <center>
        <div class="container">
        <div class="col-6 div_addprod">
   
            <asp:TextBox ID="txtcompany" runat="server" placeholder="COMPANY NAME" class="single-input"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcompany" ErrorMessage="Fill Company Name"></asp:RequiredFieldValidator>

						</div>
             <div class="col-6 div_addprod">
   
                 
                 <asp:TextBox ID="txtname" runat="server" placeholder="FULL NAME" class="single-input"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtname" ErrorMessage="Fill Name"></asp:RequiredFieldValidator>

						</div>
             <div class="col-6 div_addprod">

            <asp:TextBox ID="txtcontact" runat="server" placeholder="CONTACT NO" class="single-input" MaxLength="10"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtcontact" ErrorMessage="Fill Contact No." ></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtcontact" ErrorMessage="Invalid Contact No." ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
						</div>
             <div class="col-6 div_addprod">
              <asp:TextBox ID="txtemail" runat="server" placeholder="EMAIL ID" class="single-input"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemail" ErrorMessage="Fill Email_ID"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Invalid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

						</div>
              <%-- <div class="col-6 div_addprod">
              <asp:TextBox ID="txtpassword" runat="server" placeholder="Password" class="single-input"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtpassword" ErrorMessage="Fill Password"></asp:RequiredFieldValidator>
						</div>--%>
             <div class="col-6 div_addprod">
              <asp:TextBox ID="txtadd" runat="server" placeholder="COMPANY ADDRESS" class="single-input"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtadd" ErrorMessage="Fill Description"></asp:RequiredFieldValidator>
						</div>
           
          
            <div class="col-8 div_addprod">
                
                  <asp:Button ID="btnsubmit" runat="server" Text="SAVE" class="genric-btn success circle" OnClick="btnsubmit_Click"></asp:Button>
            </div>
           
    </div>
    </center>
    

</asp:Content>

