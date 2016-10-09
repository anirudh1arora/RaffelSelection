<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="backend.Dao"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
    <!-- for displaying the result if mean is less than90 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Winner</title>
</head>

Thank you for submitting the information ,${student.studentid}. <br/>
The mean of your data is ${dob.mean}<br/>
The Standard deviation of your data is ${dob.sd}<br/>
<s:iterator value="listofidsspilt" >

<ul>
<tr><td><li><a href="/Struts-642/list?studentid=<s:property/>"><s:property/></a></li></td></tr>
</ul>

</s:iterator>
</body>
</html>	