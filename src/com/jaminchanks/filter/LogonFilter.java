package com.jaminchanks.filter;

import com.jaminchanks.util.UrlUtil;
import com.opensymphony.xwork2.ActionContext;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by jamin on 7/8/15.
 */
@WebFilter(filterName = "logonFilter")
public class LogonFilter implements javax.servlet.Filter {
    String LOGON_URL = "afterLogon";

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        System.out.println("---------logon filter--------------");
        HttpServletRequest httpRequest = (HttpServletRequest)req;
		HttpServletResponse httpRespose = (HttpServletResponse)resp;
		HttpSession session = httpRequest.getSession();
		ServletContext application = session.getServletContext();
        if (session.getAttribute("forwardURL") == null){
            session.setAttribute("forwardURL", httpRequest.getContextPath()+"/index.jsp");
        }

        if (isLogonUrl(httpRequest.getRequestURI())) {
            System.out.println("---需要登陆---");
            if (session.getAttribute("logonUser") == null){
                session.setAttribute("forwardURL", UrlUtil.getUrl(httpRequest));
                System.out.println("请求页面：" + UrlUtil.getUrl(httpRequest));
                System.out.println(httpRequest.getRequestURL() + "未登陆状态");
                httpRespose.sendRedirect(httpRequest.getContextPath()+"/login.jsp");
                return;
            } else {
                System.out.println(httpRequest.getRequestURL()+"已登陆状态");
                chain.doFilter(req, resp);
            }
        } else {
            System.out.println("---无需登陆---");
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

    public boolean isLogonUrl(String requestURL){
        return requestURL.contains(LOGON_URL);
    }

}
