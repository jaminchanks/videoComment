package com.jaminchanks.util;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

public class UrlUtil {
	public static String getUrl(HttpServletRequest request){
		String url = "";
		url = request.getRequestURL()+"?";
		url += param(request);
		return url;
	}

	public static String param(HttpServletRequest request){
		String url = "";
		Enumeration param = request.getParameterNames();
		while(param.hasMoreElements()){
			String pname = (String) param.nextElement();
			url += pname+"="+request.getParameter(pname)+"&";
		}

		if(url.endsWith("&")){
			url = url.substring(0, url.lastIndexOf("&"));
		}
		return url;
	}
}
