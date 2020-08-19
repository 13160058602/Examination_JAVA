package com.ecit.job.base;


import javax.servlet.http.HttpSession;
import com.ecit.job.thread.JobThread;

public class BaseJobBean {
	private static BaseJobBean job = null;
	private HttpSession session;
	private BaseJobBean(HttpSession session){
		this.session = session;
		Thread t = new Thread(new JobThread(3000,session));
		t.start();
	}
	public static BaseJobBean getBaseJobBean(HttpSession session){
		if(job == null){
			job = new BaseJobBean(session);
		}
		return job;
	}
}
