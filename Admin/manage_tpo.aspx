<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="manage_tpo.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <a href="Add_Tpo.aspx" class="genric-btn link circle linkmargin">Add TPO</a>
        
        <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Id</th>
                <th scope="col">Company Name</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                  <th scope="col">Phone</th>
                    <th scope="col">Address</th>
              
                  
                   <th scope="col">Edit</th>
                    <th scope="col">Delete</th>
              </tr>
            </thead>
           
                <% if (flag == true)
                   {
                       foreach (System.Data.DataRow row in dt.Rows)
                       {%>
                            <tbody>
                                <tr>
                                    <td><%=row["id"]%></td>
                                    <td><%=row["company_name"]%></td>
                                    <td><%=row["name"]%></td>
                                    <td><%=row["email"]%></td>
                                    <td><%=row["phone"]%></td>
                                    <td><%=row["address"]%></td>
                                     
                                   
                                     
                                    <td><a href="Add_Tpo.aspx?id=<%=row.ItemArray[0]%>&msg=edit" class="btn btn-outline-success btn-sm">Edit</a></td>
                                      <td><a href="deletetpo.aspx?id=<%=row.ItemArray[0]%>" class="btn btn-outline-danger" onclick="return ConfirmDelete()" >Delete</a></td>
                 

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

