<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="s" uri="/struts-tags" %>
     <!-- for displaying the list of values -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<td>Studentid :<s:property value="student.getStudentid()"/></td><br/>
<td>Username :<s:property value="student.getUsrname()"/></td><br/>
<td>StreetAddress :<s:property value="student.getSaddress()"/></td><br/>
<td>City :<s:property value="student.getCity()"/></td><br/>
<td>State :<s:property value="student.getState()"/></td><br/>
<td>Zip :<s:property value="student.getZip()"/></td><br/>
<td>Telephone :<s:property value="student.getTphone()"/></td><br/>
<td>E-mail :<s:property value="student.getEmail()"/></td><br/>
<td>Url :<s:property value="student.getUrl()"/></td><br/>
<td>Date :<s:property value="student.getDate()"/></td><br/>
Would you like to recommend this university to anyone:<s:property value="student.getCheckbox()"/></br>
Comments:<s:property value="student.getComments()"/></br>
Graduation Month:<s:property value="student.getGrad()"/></br>
Year :<s:property value="student.getYear()"/></br>
</body>
</html>