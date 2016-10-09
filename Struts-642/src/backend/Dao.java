package backend;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;

import object.DataObject;
import processor.DataProcessor;
import model.Student_Model;



public class Dao {

	
	Student_Model student = new Student_Model();
	DataProcessor dop=new DataProcessor();
private  String[] dataofid;
	
	public String[] getDataofid() {
		return dataofid;
	}


	public void setDataofid(String[] dataofid) {
		this.dataofid = dataofid;
	}
	public ArrayList<Student_Model> Value() throws ClassNotFoundException, SQLException
	{

		Connection con=con();
		
		
		return null;

	}

Connection con () throws ClassNotFoundException, SQLException
{
	

		Class.forName("oracle.jdbc.driver.OracleDriver");

		Connection	con = DriverManager.getConnection("jdbc:oracle:thin:@apollo.ite.gmu.edu:1521:ite10g","username", "password");
	
	return con;
	
}

public String save(Student_Model studentdao,DataObject dob) throws ClassNotFoundException, SQLException
{
	
	Connection con=con();


	
		PreparedStatement ps = con.prepareStatement("INSERT INTO information VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	
		ps.setString(1, studentdao.getStudentid());
		ps.setString(2, studentdao.getUsrname());
		ps.setString(3, studentdao.getSaddress());
		ps.setString(4, studentdao.getCity());
		ps.setString(5, studentdao.getState());
		ps.setString(6, studentdao.getZip());
		ps.setString(7, studentdao.getTphone());
		ps.setString(8, studentdao.getEmail());
		ps.setString(9, studentdao.getUrl());
		ps.setString(10, studentdao.getDate());
		 String recommed="";
		 recommed=studentdao.getCheckbox()[0];
         for (int i=1;i<studentdao.getCheckbox().length;i++)
         {
        	 recommed+=","+studentdao.getCheckbox()[i];
         }
		ps.setString(11, recommed);
		ps.setString(12, studentdao.getRadio());	
		ps.setString(13, studentdao.getRecommend());	
		ps.setString(14, studentdao.getComments());	
		ps.setString(15, studentdao.getGrad());	
		ps.setString(16, studentdao.getYear());
		ps.executeUpdate(); 			
		
		
		
	 float mean=	 dop.calculation(studentdao.getData(),dob);
	 studentdao.mean1=mean;
	if(mean<90)
	{
		return "SimpleAcknowledgement";
	}
	else
		return "WinnerAcknowledgement";
 		
}



public Student_Model retrieve(String result1) throws ClassNotFoundException, SQLException, ParseException{
	Student_Model student = new Student_Model();

	Connection con=con();
	  Statement stmt = con.createStatement();
	  result1="'"+result1+"'";
	PreparedStatement Prep = con
				.prepareStatement("SELECT * from information where STUDENTID =" + result1);
       
	ResultSet rs = Prep.executeQuery();
	
	while (rs.next()) {

		student.setStudentid(rs.getString(1));
		student.setUsrname(rs.getString(2));
		student.setSaddress(rs.getString(3));
		student.setCity(rs.getString(4));
		student.setState(rs.getString(5));
		student.setZip(rs.getString(6));
		student.setTphone(rs.getString(7));
		student.setEmail(rs.getString(8));
		student.setUrl(rs.getString(9));
		student.setDate(rs.getString(10));
	      String[] tempresult=  rs.getString(11).split(",");
	      student.setCheckbox(tempresult);
	      student.setRadio(rs.getString(12));
	      student.setRecommend(rs.getString(13));
	      student.setComments(rs.getString(14));
	      student.setGrad(rs.getString(15));
	      student.setYear(rs.getString(16));
			
	}
	
	
	return student;
	
	
}
public String[] id() throws ClassNotFoundException, SQLException {
	
	String id = "";
	
	Connection con=con();

	Statement stmt = con.createStatement();
	
	ResultSet result = stmt.executeQuery("Select STUDENTID from information");
	while (result.next()) {
		id = id + result.getString(1) + ",";
	}
	String[] dataofid = id.split(",");
	return dataofid;

}
}
	
