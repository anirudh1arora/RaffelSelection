package processor;
import object.DataObject;

public class DataProcessor {

	String value[]=null;
	private int []num = new int[10];
	
	
	 float mean=0;
	public float calculation(String data,DataObject dob){
		int cal=0;
		if(data!=null)
		{
			String[] value=data.split(",");
			
			for(int i=0;i<value.length;i++)
			{
				num[i]=Integer.parseInt(value[i]);
			} 
			int count=0;
			
			for(int i=0;i<num.length;i++)
			{
				count =count + num[i];
			}
			
			mean=count/10;
			float std=0;
			dob.setMean(mean);
			for (int i=0; i<value.length;i++)
			{
				std = (float) (std + Math.pow(num[i] - dob.getMean(), 2));
			}
			dob.setSd((float) Math.sqrt(std/(value.length-1)));
			}

		
		return mean;
			
			
		}
	}
	

