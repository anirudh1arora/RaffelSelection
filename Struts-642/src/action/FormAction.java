package action;
import java.sql.SQLException;
import java.text.ParseException;

import model.Student_Model;
import object.DataObject;
import backend.Dao;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class FormAction extends ActionSupport implements ModelDriven{
	private static final long serialVersionUID = 969192015100992507L;

	private String listofids;
	

	private String[] listofidsspilt;
	

	Student_Model student = new Student_Model();
	Student_Model student1=new Student_Model();
	DataObject dob = new DataObject();


	public String getListofids() {
		return listofids;
	}


	public void setListofids(String listofids) {
		this.listofids = listofids;
	}

	Dao dao =new Dao();
	private String studentid;


	public String[] getListofidsspilt() {
		return listofidsspilt;
	}


	public void setListofidsspilt(String[] listofidsspilt) {
		this.listofidsspilt = listofidsspilt;
	}


	public Student_Model getStudent1() {
		return student1;
	}


	public void setStudent1(Student_Model student1) {
		this.student1 = student1;
	}


	public Dao getDao() {
		return dao;
	}


	public void setDao(Dao dao) {
		this.dao = dao;
	}


	public String getStudentid() {
		return studentid;
	}


	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}


	public DataObject getDob() {
		return dob;
	}


	public void setDob(DataObject dob) {
		this.dob = dob;
	}


	@Override
	public Object getModel() {
		return student;
	}


	public Student_Model getStudent() {
		return student;
	}

	public void setStudent(Student_Model student) {
		this.student = student;
	}
	public String execute() throws ClassNotFoundException, SQLException
	{



		String result=	dao.save(student,dob);
		
		Dao dao =new Dao();
		String list[]=dao.id();
		int i=0;
		listofids=list[0];
		for( i =1; i<list.length;i++){
	
			listofids= listofids+ ","+ list[i]  ;
		}
		listofidsspilt=listofids.split(",");

		return result;

	}

	public String identify() throws ClassNotFoundException, SQLException, ParseException
	{
		String[] checkbox;
		DataObject dob = new DataObject();
		studentid=	student.getStudentid();
		student=	dao.retrieve(studentid);
		if(student==null)
		{	return "fail";}
		return "displaylist";
	}

}
