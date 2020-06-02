<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="manage_student.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <a href="add_students.aspx" class="genric-btn link circle linkmargin">Add STUDENTS</a>
        
        <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Student_Id</th>
                <th scope="col">Branch</th>
                <th scope="col">Sem</th>
                <th scope="col">Name</th>
                  <th scope="col">Email</th>
                <th scope="col">Phone</th>
                    <th scope="col">Address</th>
                   <th scope="col">DOB</th>
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
                                    <td><%=row["student_id"]%></td>
                                    <td><%=row["Branch"]%></td>
                                    <td><%=row["Semester"]%></td>
                                    <td><%=row["Name"]%></td>
                                    <td><%=row["Email"]%></td>
                                      <td><%=row["Phone"]%></td>
                                    <td><%=row["Address"]%></td>
                                     <td><%=row["Dob"]%></td>
                                     
                                    <td><a href="add_students.aspx?id=<%=row.ItemArray[1]%>&msg=edit" class="btn btn-outline-success btn-sm">Edit</a></td>
                                      <td><a href="deletestudent.aspx?id=<%=row.ItemArray[1]%>" class="btn btn-outline-danger" onclick="return ConfirmDelete()" >Delete</a></td>
                 

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

