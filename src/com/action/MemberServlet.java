package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class MemberServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public MemberServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("mreg")){ //会员注册
			String username = request.getParameter("username"); 
			String password = request.getParameter("password"); 
			String realname = request.getParameter("realname"); 
			String sex = request.getParameter("sex"); 
			String age = request.getParameter("age"); 
			String address = request.getParameter("address"); 
			String email = request.getParameter("email");
			
			if(username.equals("admin")){
				request.setAttribute("message", "非法的用户名！");
				request.getRequestDispatcher("reg.jsp").forward(request, response); 
			}
			else{
				String str=cBean.getString("select id from member where username='"+username+"'");
				if(str==null){
					int flag=cBean.comUp("insert into member(username,password,realname,sex,age,address,email,regtime) " +
							"values('"+username+"','"+password+"','"+realname+"','"+sex+"','"+age+"','"+address+"','"+email+"','"+date+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "注册成功请登录！");
						request.getRequestDispatcher("login.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("reg.jsp").forward(request, response); 
					}
				}
				else{
					request.setAttribute("message", "该用户名已存在！");
					request.getRequestDispatcher("reg.jsp").forward(request, response); 
				} 
			}
			
		}
		else if(method.equals("mupreg")){ //会员修改注册资料
			String member=(String)session.getAttribute("member"); 
			String realname = request.getParameter("realname"); 
			String sex = request.getParameter("sex"); 
			String age = request.getParameter("age"); 
			String address = request.getParameter("address"); 
			String email = request.getParameter("email"); 
			int flag=cBean.comUp("update member set realname='"+realname+"',sex='"+sex+"',age='"+age+"'," +
					"address='"+address+"',email='"+email+"' where username='"+member+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("member/info/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("member/info/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("mlogin")){//会员登录
			String username = request.getParameter("username"); 
			String password = request.getParameter("password"); 
			String sf = request.getParameter("sf"); 
			if(!sf.equals("普通用户")){
				String str=cBean.getString("select id from admin where username='"+username+"' and  password='"+password+"' and  sf='"+sf+"'");
				if(str==null){
					request.setAttribute("message", "登录信息错误！");
					request.getRequestDispatcher("login.jsp").forward(request, response); 
				}
				else{
					session.setAttribute("user", username);session.setAttribute("sf", sf);
					request.getRequestDispatcher("admin/index.jsp").forward(request, response); 
				}
			}
			else{
				String str=cBean.getString("select id from member where username='"+username+"' and  password='"+password+"'  and ifuse='在用'");
				if(str==null){
					request.setAttribute("message", "登录信息错误！");
					request.getRequestDispatcher("login.jsp").forward(request, response); 
				}
				else{
					session.setAttribute("member", username); 
					request.getRequestDispatcher("member/index.jsp").forward(request, response); 
				}
			}
			
		}
		else if(method.equals("lost")){ //丢失密码
			request.setAttribute("message", "新密码已经发到注册邮箱！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else if(method.equals("memberexit")){ //退出登录
			session.removeAttribute("member");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else if(method.equals("muppwd")){//会员修改密码
			String member=(String)session.getAttribute("member"); 
			String oldpwd = request.getParameter("oldpwd"); 
			String newpwd = request.getParameter("newpwd"); 
			String str=cBean.getString("select id from member where username='"+member+"' and  password='"+oldpwd+"'");
			if(str==null){
				request.setAttribute("message", "原始密码信息错误！");
				request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response); 
			}
			else{
				int flag=cBean.comUp("update member set password='"+newpwd+"' where username='"+member+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response); 
				}
			}
		}
		/////////////////////////////管理员操作
		else if(method.equals("delm")){//删除会员
			String id = request.getParameter("id");  
			int flag=cBean.comUp("delete from member where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("ifusem")){//停用/在用 会员
			String id = request.getParameter("id");  
			String sql="";
			String str=cBean.getString("select ifuse from member where id='"+id+"'");
			if(str.equals("在用")){
				sql="update member set ifuse='停用' where id='"+id+"'";
			}
			else{
				sql="update member set ifuse='在用' where id='"+id+"'";
			}
			int flag=cBean.comUp(sql);
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
		}
		
		//////////
		else if(method.equals("delm2")){//删除会员
			String id = request.getParameter("id");  
			int flag=cBean.comUp("delete from member where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/member/index2.jsp").forward(request, response); 
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/member/index2.jsp").forward(request, response); 
			}
		}
		else if(method.equals("ifusem2")){//停用/在用 会员
			String id = request.getParameter("id");  
			String sql="";
			String str=cBean.getString("select ifuse from member where id='"+id+"'");
			if(str.equals("在用")){
				sql="update member set ifuse='停用' where id='"+id+"'";
			}
			else{
				sql="update member set ifuse='在用' where id='"+id+"'";
			}
			int flag=cBean.comUp(sql);
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/member/index2.jsp").forward(request, response); 
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/member/index2.jsp").forward(request, response); 
			}
		}
//////////
		else if(method.equals("delm3")){//删除会员
			String id = request.getParameter("id");  
			int flag=cBean.comUp("delete from member where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/member/index3.jsp").forward(request, response); 
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/member/index3.jsp").forward(request, response); 
			}
		}
		else if(method.equals("ifusem3")){//停用/在用 会员
			String id = request.getParameter("id");  
			String sql="";
			String str=cBean.getString("select ifuse from member where id='"+id+"'");
			if(str.equals("在用")){
				sql="update member set ifuse='停用' where id='"+id+"'";
			}
			else{
				sql="update member set ifuse='在用' where id='"+id+"'";
			}
			int flag=cBean.comUp(sql);
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/member/index3.jsp").forward(request, response); 
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/member/index3.jsp").forward(request, response); 
			}
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
