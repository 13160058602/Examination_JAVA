package com.ecit.job.thread;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Properties;
import javax.servlet.http.HttpSession;


public class JobThread implements Runnable{
	
	private final int time;
	private final HttpSession session;
	private final String jobPath;
	private final Properties p;
	public JobThread(int time , HttpSession session){
		this.time = time;
		this.session = session;
		this.jobPath = session.getServletContext().getRealPath("/WEB-INF/classes/default.properties");
		p = new Properties();
		try {
			p.load(new FileInputStream(new File(jobPath)));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void run() {
		// TODO Auto-generated method stub
		try{
			
			String interfaceImplName = p.getProperty("class");
			
			String[] methods = p.getProperty("method").split(",");
			
			Class interfaceImplClass = Class.forName(interfaceImplName);
			
			Object obj = interfaceImplClass.newInstance();
			
			while(true){
					
					for(String method : methods){
						Method m = interfaceImplClass.getMethod(method);
						m.invoke(obj);
					}
					
					Thread.sleep(this.time);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
