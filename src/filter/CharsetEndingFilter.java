package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CharsetEndingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }
//通过过滤器解决中文乱码问题
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
           //强转成httpServlet请求
        HttpServletResponse response=(HttpServletResponse)servletResponse;
        HttpServletRequest request=(HttpServletRequest)servletRequest;
        //设置编码
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //设置请求响应的过滤器
        filterChain.doFilter(servletRequest,servletResponse);

    }

    @Override
    public void destroy() {

    }
}
