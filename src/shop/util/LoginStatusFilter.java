package shop.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter( urlPatterns = {"/user/cart.jsp","/user/checkout.jsp"})
public class LoginStatusFilter implements Filter {
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession ss = req.getSession();
		String hasLogin = (String) ss.getAttribute("hasLogin");

		boolean isExclude = false;
		String targetPath = req.getRequestURI();

		if (targetPath.contains("login")||targetPath.contains("operation"))//排除过滤的页面
			isExclude = true;
		String qStr = req.getQueryString();
		if ((qStr != null) && ((qStr.contains("checkout")) || (qStr.contains("cart"))|| (qStr.contains("class")))) { //URL
			isExclude = true;
		}

		if ((!isExclude) && (hasLogin == null)) {
			 HttpServletResponse resp = (HttpServletResponse)response;
			 resp.sendRedirect(req.getContextPath()+"/user/authorization.jsp");
			return;
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}
}