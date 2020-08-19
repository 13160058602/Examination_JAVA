package com.ecit.controller.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ecit.job.base.BaseJobBean;
import com.ecit.job.thread.JobThread;

public class BaseInterceptor  implements HandlerInterceptor {
	
	
	public void afterCompletion(HttpServletRequest req,
			HttpServletResponse resp, Object obj, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void postHandle(HttpServletRequest req, HttpServletResponse resp,
			Object obj, ModelAndView mv) throws Exception {
		// TODO Auto-generated method stub
		
		BaseJobBean.getBaseJobBean(req.getSession());//Æô¶¯ÈÎÎñ
	}

	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp,
			Object obj) throws Exception {
		// TODO Auto-generated method stub
		return true;
	}

}
