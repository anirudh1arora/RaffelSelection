<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
 <!-- survey page and index page for input -->
<html xml:lang="en" lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>George Mason University</title>
	<link rel="stylesheet" href="./jquery-ui.css" type="text/css"/>
<script src="./jquery.js" type="text/javascript"></script>
<script src="./jquery-ui.js"></script>
<script src="./jquery-basic.js" type="text/javascript"></script>





	<style type="text/css">
		
		body {
    background-image: url("gmu.jpg");
	  background-repeat: no-repeat;		
	  background-size: 2000px 1200px;
}
		</style>
		<script type="text/javascript">
	
	var now= new Date();
	var hour=now.getHours();
	var name;
	
	
	if(hour < 12)
	document.write("<h1> Good Morning,");
	
	else
	{
	hour=hour -12;
	
	if ( hour < 6 ) 
	
	document.write( "<h1>Good Afternoon, " ); 

	else
	
	document.write( "<h1>Good Evening, " );
	}
	var flag=true;
	
	if(document.cookie)
	{
	var myCookie= unescape(document.cookie);
	
	var cookieTokens = myCookie.split( "=" ); 

	name = cookieTokens[ 1 ]; 
	
	}
	
	
	else
	{
	name = window.prompt( "Please enter your name", "" );
	while(flag == true)
	{
	if (name =="")
	{
	
	alert("Please enter your name");
	name = window.prompt( "Please enter your name", "" );
	}
	else if(name!="")
	{
	flag=false;}
	}
	var date= new Date();
	date.setTime(date.getTime()+(10*1000));
	var expires=";expires="+date.toGMTString();	
	
	document.cookie = "name=" + escape( name )+expires+"; path=/"; 

	}
	
	document.writeln( 
name + ", welcome to Assignment#3</h1>" ); 
document.writeln( "<a href = 'javascript:wrongPerson()'> " + 
"Click here if you are not " + name + "</a>" ); 
function wrongPerson() 
{
name = window.prompt( "Please enter your name", "" );
var date= new Date();
	date.setTime(date.getTime()+(10*1000));
	var expires=";expires="+date.toGMTString();	
	
	document.cookie = "name=" + escape( name )+expires+"; path=/"; 

location.reload(); 

}
function splitdata()
{
var sum=0;
var inputString = document.getElementById("data").value; 
var tokens = inputString.split( "," ); 

if(tokens.length!=10){
document.getElementById("dataspan").textContent = "enter 10 digits";
return false;
}

for(i=0;i<tokens.length;i++)
{	if(tokens[i]<1 || tokens[i] > 100)

{$( "#dialog" ).text("Numbers below 1 and above 100 are not allowed");
$( "#dialog" ).dialog();

document.getElementById("Avg").value="";
document.getElementById("Max").value="";
return false;
}
else
sum=sum+parseInt(tokens[i]);

}
var avg=0;

avg=sum/10;

	var max=tokens[0];
	for(i=0;i<tokens.length;i++)
{
if(parseInt(tokens[i])>max)
{
max=tokens[i];
}

}

document.getElementById("dataspan").textContent = "" ;

document.getElementById("Avg").value=avg;
document.getElementById("Max").value=max;

}
function validateForm() {
    var x = document.forms["myForm"]["usrname"].value;
   var ck_password =  /^[A-Za-z]+$/;
   var result="";
   if (x == null || x == "") {
        var usernull ="Username must be filled out";
		result= result + "\n" + usernull;
       
    }
	
	
	else if(!x.match(ck_password))
	{
	var user= "Username must contain only alphabets";
	result= result+ "\n" + user;
	document.forms["myForm"]["usrname"].value="";
	 
	}
	 var y = document.forms["myForm"]["saddress"].value;
	
	 
	var address= /^[A-Za-z0-9\s]+$/;
	if (y == null || y == "") {
        var addressnull= "Address must be filled out";
		
      result= result+ "\n" + addressnull;
    }
	
	else if(!y.match(address))
	{
	var addressalert ="Check address syntax";
	result= result+ "\n" +addressalert;
	document.forms["myForm"]["saddress"].value="";
	
	}

	
	 var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/; 
	var email= document.forms["myForm"]["email"].value;
		if (email == null || email == "") {
        var emailnull="Email must be filled out";
		result= result+ "\n" +emailnull;
		document.forms["myForm"]["email"].value="";
      
    }
		
	else	if(!email.match(mailformat))  
		{
		var emailalert="Enter vaild email";
		result= result+ "\n" +emailalert;
		document.forms["myForm"]["email"].value="";
		}
		 var c=0;
		 var radioalert="Select a radio button";
		var radiocheck=document.getElementsByName("radio");
		
		for(var i=0;i<radiocheck.length;i++)
		{
			 if(radiocheck[i].checked){
				 c++;
			 }
			
		}
		
		if(c==0)

 {
			result= result+ "\n" +radioalert;
			
 }
		
		 var t=0;
		 var checkboxalert="Select atleast 2 checkboxes";
		 var checkboxcheck=document.getElementsByName("checkbox");
		 for(var i=0;i<checkboxcheck.length;i++)
			{
				 if(checkboxcheck[i].checked){
					 t++;
				 }
				
			}
		 
		 if(t<2)
		{
				result= result+ "\n" +checkboxalert;
		}
		
if(result!="")
{	
		 $( "#dialog" ).text(result);
		  $( "#dialog" ).dialog();
}	else{  document.getElementById("myForm").submit();}
return false;
}
function myFunction()
{
 var xhttp = new XMLHttpRequest();
 var zippUrl = "zipcode.json"
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
   
     var res_arr = xhttp.responseText;
     var obj = JSON.parse(res_arr);
     var n = obj.zipcodes.length;
     var flag = "false";

     for(i=0; i<n; i++){
       
       var zip_res = parseInt(obj.zipcodes[i].zip);
       var zip_inp = parseInt(document.getElementById("zipcode").value);

       if(zip_res === zip_inp){
         flag = "true"; document.getElementById("city").value = obj.zipcodes[i].city;
         document.getElementById("state").value = obj.zipcodes[i].state;
     	document.getElementById("zipcode1").innerHTML ="";
       }
     }
     
     if(flag.match("false")){

		 $( "#dialog" ).text("Please enter a valid zip code");
		  $( "#dialog" ).dialog();
     	document.getElementById("city").value = " ";
         document.getElementById("state").value = " ";
     	
     }
    }
  }
  xhttp.open("GET", zippUrl, true);
  xhttp.send();


}

</script>
	</head>
	<body>

	<s:form name="myForm" id= "myForm" autocomplete="on" action="formsubmit" theme="simple" >
	<font color="black">
	
<table border="1" width="900">
<!-- 	 <tr>
	<td> StudentId*:<br/><input type="text" name="studentid" placeholder="StudentID" autofocus required/></td>
	<td>Username*: <br/><input type="text"  name="usrname"  placeholder="UserName "/></td>
	<td> Street Address:<br/><input type="text" name="saddress" placeholder="Street Address"/></td>
	</tr>
  -->
 <tr>
    <td>StudentId: <br/><s:textfield label="Student Id" name="studentid"  placeholder="StudentID"  /></td>    
	<td>UserName: <br/><s:textfield label="UserName" name="usrname"  placeholder="Username"  /></td>
	<td>StreetAddress: <br/><s:textfield label="StreetAddress:" name="saddress"  placeholder="StreetAdress"  /> </td>
  </tr>
 <!-- 
 <tr>
	<td>City <br/><input type="text" name="city" id="city" placeholder="City"/></td>
	<td>State <br/><input type="text"  name="state" id="state" placeholder="State "/></td>
	<td>Zip <br/><input type="text" name="Zip" placeholder="Zip" id="zipcode" onblur="myFunction()" /></td>
	</tr>
	 -->
	<tr>
    <td>City <br/><s:textfield label="city" name="city" id="city"  placeholder="City"  /></td>    
	<td>State <br/><s:textfield label="state" name="state" id="state" placeholder="State"  /></td>
	<td>Zip <br/><s:textfield label="Zip:" name="Zip"  placeholder="Zip" id="zipcode" onblur="myFunction()" /> </td>
  </tr>
	
	<!-- 
	<tr>
	<td>Telephone<br/><input type="tel" name="tphone" placeholder="+1  (###)  ### - ####" ></td>
	
	<td>E-mail<br/><input type="text" name="email" placeholder="email@xyz.com" autocomplete="off" ></td>

	<td>URL<br/><input type="url" name="Url" placeholder="URL" ></td>
	
	</tr>
	 -->
	<tr>
    <td>Telephone<br/><s:textfield label="tel" name="tphone"  placeholder="+1  (###)  ### - ####"  /></td>    
<td>E-mail<br/><s:textfield label="email" name="email"  placeholder="email@xyz.com"  /></td>
	<td>URL<br/><s:textfield label="url" name="Url"  placeholder="URL"  /> </td>
  </tr>
	
	<tr>
<!-- 	<td>Date: <br/><input type="date" name="Date"></td> -->
	<td>Date of Survey:<s:textfield  type="date" name="date" id = "date" placeholder="Date"/> </td>
	<td>Data<br/><s:textfield label="data" id="data" name="data"  placeholder="Data" onchange="splitdata()"/> <br/></td>
	<span id="dataspan"></span>
	
	<!-- 
<input type="checkbox" name="checkbox" value="" id="myCheck">Student<br>
<input type="checkbox" name="checkbox" value="" id="myCheck1">Location <br>
<input type="checkbox" name="checkbox" value="" id="myCheck2">Atmosphere <br>
<input type="checkbox" name="checkbox" value="s" id="myCheck3">Dorm Rooms <br>
<input type="checkbox" name="checkbox" value="" id="myCheck4">Sports<br> 	
<input type="checkbox" name="checkbox" value="" id="myCheck5">Campus<br> </td>

 --><td>
 What do you like about the campus:<s:checkboxlist label="Which Campus do you like:"   name="checkbox" id="check"  key="check"
   list="{'Student','Location','Atmosphere','Dorm Rooms','Sports','Campus'}" />
</td>
</tr>	
<tr>
<!-- 
<td><label for="textarea">How do you know about GMU:<br></label>

<input type="radio" name="radio" value="internet"  id="myRadio">Internet<br>
 <input type="radio" name="radio" value="friends"  id="myRadio1">Friends<br>
<input type="radio" name="radio" value="television"  id="myRadio2">Television<br>
<input type="radio" name="radio" value="others"  id="myRadio3">Others<br><br>
	</td>
	 -->
	<td>How did you become interested in the University <s:radio  name="radio" id="radio"
	   key="radio" list="{'Friends','Televison','Internet','Other'}"  /></td>
	<td>

 Would you like to recommend this university to anyone    <s:select    key="recommend" name="recommend"
      headerValue="Select"
      headerKey="-1"
         list="{'Very Likely','Likely','Unlikely'}" />


<br/></td>
	
<td>	 
Comments  <s:textfield label="Comments" name="comments" placeholder="Comments"  key="comments"/> </td><br/></tr>	
	<tr><td>
	<label for = "txtList" >Graduation Month:<br/>
	<input type ="text" id=="txtList" name="grad"
	placeholder="Select a month" list="months" />
	<datalist id="months">
	<option value="January">
	<option value="February">
	<option value="March">
	<option value="April">
	<option value="May">
	<option value="June">
	<option value="July">
	<option value="August">
	<option value="September">
	<option value="October">
	<option value="November">
<option value="December">

</datalist>
</td>
</label><br/>

 <td>Year<br/><s:textfield label="year" name="year"  placeholder="Year"  /></td>
		
	
	
  <td><input type="submit" value="Submit" onclick="return validateForm()"></input>
  <input type="reset" value="Reset"></input></td></tr>
  
  </table>
</s:form>
</font>
<div id="dialog" title="Window error"> 
</div>


<p>
<a href="https://www2.gmu.edu/"><img src="GMULOGO.jpg" alt="Please visit
http://www.gmu.edu for more information." align="right" id="logo"/>
</a>
</p>

	</body>
</html>
