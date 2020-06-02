<%@ Page Title="" Language="C#" MasterPageFile="MasterPage_Tpo.master" AutoEventWireup="true" CodeFile="manage_files.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="container">
        <a href="Upload_Files.aspx" class="genric-btn link circle linkmargin">UPLOAD FILE</a>
        
        <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">ID</th>
                  <th scope="col">Date</th>
                <th scope="col">Branch</th>
                <th scope="col">Semseter</th>
                <th scope="col">Student_ID</th>
                  <th scope="col">File</th>
                 
                    <%--<th scope="col">Delete</th>--%>
              </tr>
            </thead>
           
                <% if (flag == true)
                   {
                       foreach (System.Data.DataRow row in dt.Rows)
                       {%>
                            <tbody>
                                <tr>
                                    <td><%=row["id"]%></td>
                                    <td><%=row["date"]%></td>
                                    <td><%=row["branch"]%></td>
                                    <td><%=row["sem"]%></td>
                                    <td><%=row["student_id"]%></td>
                                    <td><%=row["file_name"]%></td>
                                    <td><a href="download.aspx?id=<%=row.ItemArray[0]%>" class="btn btn-outline-danger" onclick="return ConfirmDelete()" >Download</a></td>
<%--                                      <td><a href="deletefile.aspx?id=<%=row.ItemArray[0]%>" class="btn btn-outline-danger" onclick="return ConfirmDelete()" >Delete</a></td>--%>
                 

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

