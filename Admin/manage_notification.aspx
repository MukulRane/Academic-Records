<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="manage_notification.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
     <div class="container">
        <a href="add_notification.aspx" class="genric-btn link circle linkmargin">Add New Notification</a>

         <a href="sendnotification.aspx" class="genric-btn link circle linkmargin" style="margin-left:600px">Send Notification</a>
        
        <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Sr No.</th>
                <th scope="col">Flight No.</th>
                <th scope="col">Message</th>
               
                 
                    <th scope="col">Delete</th>
              </tr>
            </thead>
           
                <% if (flag == true)
                   {
                       foreach (System.Data.DataRow row in dt.Rows)
                       {%>
                            <tbody>
                                <tr>
                                    <td><%=row["notification_id"]%></td>
                                    <td><%=row["flight_id"]%></td>
                                    <td><%=row["message"]%></td>
                                  
                                   
                                      <td><a href="deletenotification.aspx?id=<%=row.ItemArray[0]%>" class="btn btn-outline-danger" onclick="return ConfirmDelete()" >Delete</a></td>
                 

                                 </tr>
                            </tbody>
                           
                     <%  }
                      
                       
                   }%>
                   <%  else
                 {%>
                       Response.Write("<script>alert('No Data Found')</script>");
                   <%}%> 
           
          </table>
      
        </div>
      </div>

    </div>
    	</div>
</asp:Content>

