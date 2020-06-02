<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Upload_Files.aspx.cs" Inherits="Admin_Default" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%--     <link href="css/external_css.css" rel="stylesheet" />
    <link href="css/nice-select.css" rel="stylesheet" />--%>
        <link href="../css/external_css.css" rel="stylesheet" />
    <link href="../css/nice-select.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>
        <div class="container">
      

             <div class="form-select col-6 div_addprod" id="default-select">
                
            
                 <asp:DropDownList ID="DropDownList1" runat="server" >
               
								</asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Select Branch "></asp:RequiredFieldValidator>
                       
                    
		  </div>


            
             <div class="form-select col-6 div_addprod" id="default-select1">
                
            
                 <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="btnsubmit0_Click" AutoPostBack="False" EnableViewState="true" >
               
								</asp:DropDownList>
                     <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Select Semester"></asp:RequiredFieldValidator>--%>
                       
                   <asp:Button ID="btnsubmit0" runat="server" Text="ADD" class="genric-btn success circle" OnClick="btnsubmit0_Click" Width="83px" ></asp:Button>
                       
                  
                       
                    <div >

                       
                    </div>
		  </div>
            
            
            
            <div class="form-select col-6 div_addprod" id="default-select2">
                
            
                 <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList>
                    
                       
                    
		  </div>
            

              <div class="col-6 div_addprod">
   
            <asp:FileUpload ID="fileuplogo" runat="server" />
						</div>


   
            <div class="col-8 div_addprod">
                
                  <asp:Button ID="btnsubmit" runat="server" Text="SAVE" class="genric-btn success circle" OnClick="btnsubmit_Click"></asp:Button>
            </div>
           
    </div>
       
    </center>

</asp:Content>

