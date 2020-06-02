<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="View_Profile.aspx.cs" Inherits="_Default" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/external_css.css" rel="stylesheet" />
    <link href="css/nice-select.css" rel="stylesheet" />


    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <center>
        <div class="container">
            
             <div class="col-6 div_addprod">
             
                <asp:Image ID="showimge" runat="server" Height="100" Width="150" />
                 
		  </div>
            

                         
                 <div class="col-6 div_addprod">
               <asp:TextBox ID="txtbranch" runat="server" placeholder="BRANCH" class="single-input" ReadOnly="True"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtbranch" ErrorMessage="BRANCH"></asp:RequiredFieldValidator>
						</div>
               
                       
                     
                
                 
               
            
                 <div class="col-6 div_addprod">
                       
                      <asp:TextBox ID="txtsem" runat="server" placeholder="SEMESTER" class="single-input" ReadOnly="True"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtsem" ErrorMessage="SEMESTER"></asp:RequiredFieldValidator>
						</div>

		  
                 
                  <div class="col-6 div_addprod">
              <asp:TextBox ID="txtid" runat="server" placeholder="STUDENT ID" class="single-input" ReadOnly="True"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtid" ErrorMessage="STUDENT ID"></asp:RequiredFieldValidator>
						</div>
                 

             <div class="col-6 div_addprod">
              <asp:TextBox ID="txtname" runat="server" placeholder="FULL NAME" class="single-input" ReadOnly="True"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtname" ErrorMessage="FULL NAME"></asp:RequiredFieldValidator>
						</div>
                 
                 <div  class="form-select col-6 div_addprod" id="default-select" >
                  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
              <asp:TextBox ID="txtdate" runat="server" placeholder="Date" class="single-input"></asp:TextBox>
                  <ajax:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtdate"
                                    Format="dd/MM/yyyy">
                                </ajax:CalendarExtender>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtdate" ErrorMessage="DATE OF BIRTH"></asp:RequiredFieldValidator>

						</div>

             <div class="col-6 div_addprod">
              <asp:TextBox ID="txtemail" runat="server" placeholder="EMAIL" class="single-input" ReadOnly="True"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtemail" ErrorMessage="EMAIL"></asp:RequiredFieldValidator>
						</div>
                 
            <div class="col-6 div_addprod">
              <asp:TextBox ID="txtphone" runat="server" placeholder="PHONE NB" class="single-input" ReadOnly="True"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtphone" ErrorMessage="PHONE NB"></asp:RequiredFieldValidator>
						</div>
                 
                 <div class="col-6 div_addprod">
              <asp:TextBox ID="txtaddress" runat="server" placeholder="ADDRESS" class="single-input" ReadOnly="True"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtaddress" ErrorMessage="ADDRESS"></asp:RequiredFieldValidator>
						</div>
            
            
            
            

                 
                 <div class="col-8 div_addprod">
                
                  <%--<asp:Button ID="btnsubmit" runat="server" Text="SAVE" class="genric-btn success circle" OnClick="btnsubmit_Click"></asp:Button>--%>
            </div>
                 
           
    </div>
    </center>
</asp:Content>

