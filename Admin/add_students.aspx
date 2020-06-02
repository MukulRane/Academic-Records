<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="add_students.aspx.cs" Inherits="Admin_Default" enableEventValidation="false" %>


<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="../css/external_css.css" rel="stylesheet" />
    <link href="../css/nice-select.css" rel="stylesheet" />
    <script type="text/javascript">
         var chkvalue = "";

         
         function showimg() {
             debugger;
             var showimage = document.querySelector('#<%=showimge.ClientID %>');
              var file = document.querySelector('#<%=fileuplogo.ClientID%>').files[0];

              var reader = new window.FileReader();

              reader.onload = function () {
                  showimage.src = reader.result;

              }
              if (file) {
                  //reader.readasdataurl(file);
                  reader.readAsDataURL(file);

              }
              else {
                  showimage.src = "";
              }
          }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <div class="container">
             <div class="form-select col-6 div_addprod" id="default-select">
                 
              
                 <asp:DropDownList ID="DropDownlist1" runat="server">
                
								</asp:DropDownList>
                      <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txttime" ErrorMessage="Select Branch"></asp:RequiredFieldValidator>--%>
                       
                     
                 </div>
                 
                 <div class="form-select col-6 div_addprod" id="default-select">
            
                 <asp:DropDownList ID="DropDownList2" runat="server">
                
				</asp:DropDownList>
                     <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txttime" ErrorMessage="Select Semester"></asp:RequiredFieldValidator>--%>
                       
                     

		  </div>

                 
                  <div class="col-6 div_addprod">
              <asp:TextBox ID="txtid" runat="server" placeholder="STUDENT ID" class="single-input"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtid" ErrorMessage="STUDENT ID"></asp:RequiredFieldValidator>
						</div>
                 

             <div class="col-6 div_addprod">
              <asp:TextBox ID="txtname" runat="server" placeholder="FULL NAME" class="single-input"></asp:TextBox>
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
              <asp:TextBox ID="txtemail" runat="server" placeholder="EMAIL" class="single-input"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtemail" ErrorMessage="EMAIL"></asp:RequiredFieldValidator>
						</div>
                 
            <div class="col-6 div_addprod">
              <asp:TextBox ID="txtphone" runat="server" placeholder="PHONE NB" class="single-input"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtphone" ErrorMessage="PHONE NB"></asp:RequiredFieldValidator>
						</div>
                 
                 <div class="col-6 div_addprod">
              <asp:TextBox ID="txtaddress" runat="server" placeholder="ADDRESS" class="single-input"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtaddress" ErrorMessage="ADDRESS"></asp:RequiredFieldValidator>
						</div>
            
            
            
             <div class="col-6 div_addprod">
             
                <asp:Image ID="showimge" runat="server" Height="70" Width="100" />
                 
              <asp:FileUpload ID="fileuplogo" runat="server" onchange="showimg()" />
                                                 
		  </div>

                 
                 <div class="col-8 div_addprod">
                
                  <asp:Button ID="btnsubmit" runat="server" Text="SAVE" class="genric-btn success circle" OnClick="btnsubmit_Click"></asp:Button>
            </div>
                 
             
           
    </div>
    </center>
    
    
</asp:Content>

