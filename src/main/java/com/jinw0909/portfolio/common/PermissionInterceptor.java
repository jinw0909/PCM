package com.jinw0909.portfolio.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		String permission = (String)session.getAttribute("permission");
		
		if (session.getAttribute("pokemonId") == null) {
			if (uri.startsWith("/commons/main_view") || uri.startsWith("/members") || uri.startsWith("/manangers") || uri.startsWith("/notice")) {
				response.sendRedirect("/commons/login_view");
				return false;
			}
		} else {
			if (uri.startsWith("/commons/login_view")) {
				response.sendRedirect("/commons/main_view");
				return false;
			}
//			return true;
		}
		if (permission != null) {
			if (permission.equals("인턴")) {
				if (uri.startsWith("/managers")) {
					response.sendRedirect("/commons/main_view");
					return false;
				}
				if (uri.startsWith("/members")) {
					response.sendRedirect("/commons/main_view");
					return false;
				}
			} else if (permission.equals("직원")) {
				if (uri.startsWith("/managers")) {
					response.sendRedirect("/commons/main_view");
					return false;
				}
			}
		}
		return true;
	};
	@Override 
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler, 
			ModelAndView modelAndView) {
		
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler, 
			Exception ex) {
		
	}
}
