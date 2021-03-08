package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class TestServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public TestServlet() {
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
		String date=new SimpleDateFormat("yyyyMMddHHmmss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("addbj")){//班级
			String mc=request.getParameter("mc");
			String str=cBean.getString("select id from bj where mc='"+mc+"'");
			if(str==null){
				int flag=cBean.comUp("insert into bj(mc) values('"+mc+"')");
				if(flag==Constant.SUCCESS){
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/bj/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "系统维护中！");
					request.getRequestDispatcher("admin/bj/index.jsp").forward(request, response);
				}
			}
			else{
				request.setAttribute("message", "信息重复！");
				request.getRequestDispatcher("admin/bj/index.jsp").forward(request, response);
			} 
		}
		else if(method.equals("delbj")){//删除班级
			String id=request.getParameter("id");
			int flag=cBean.comUp("delete from bj where id='"+id+"'");
			if(flag==Constant.SUCCESS){
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/bj/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "系统维护中！");
				request.getRequestDispatcher("admin/bj/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("addxz")){ //增加试题  
			String tm = request.getParameter("tm");
			String d1 = request.getParameter("d1");
			String d2 = request.getParameter("d2");
			String d3 = request.getParameter("d3");
			String d4 = request.getParameter("d4");
			String zq = request.getParameter("zq");
			String zsd = request.getParameter("zsd");
				int flag = cBean.comUp("insert into xz(tm,d1,d2,d3,d4,zq,zsd)  values('"+tm+"','"+d1+"','"+d2+"','"+d3+"','"+d4+"','"+zq+"','"+zsd+"' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
				}
			 
		} 
		else if(method.equals("upxz")){ //修改试题
			String id=request.getParameter("id");
			String tm = request.getParameter("tm");
			String d1 = request.getParameter("d1");
			String d2 = request.getParameter("d2");
			String d3 = request.getParameter("d3");
			String d4 = request.getParameter("d4");
			String zq = request.getParameter("zq"); 
			String zsd = request.getParameter("zsd");
				int flag = cBean.comUp("update xz set tm='"+tm+"',d1='"+d1+"',d2='"+d2+"',d3='"+d3+"' ,d4='"+d4+"' ,zq='"+zq+"',zsd='"+zsd+"'  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
				}
			 
		}
		 
		else if(method.equals("delxz")){//删除选择题
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from xz where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
			}
		}
		
		
		else if(method.equals("addpd")){   //判断题
			String tm = request.getParameter("tm"); 
			String zq = request.getParameter("zq");
			String zsd = request.getParameter("zsd");
				int flag = cBean.comUp("insert into pd(tm,zq,zsd)  values('"+tm+"','"+zq+"','"+zsd+"'  )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/pd/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/pd/index.jsp").forward(request, response);
				}
			 
		} 
		else if(method.equals("uppd")){ 
			String id=request.getParameter("id"); 
			String tm = request.getParameter("tm"); 
			String zq = request.getParameter("zq");
			String zsd = request.getParameter("zsd"); 
				int flag = cBean.comUp("update pd set tm='"+tm+"',zq='"+zq+"',zsd='"+zsd+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/pd/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/pd/index.jsp").forward(request, response);
				}
			 
		}
		 
		else if(method.equals("delpd")){//删除判断
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from pd where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/pd/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/pd/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("addjd")){   //主观
			String tm = request.getParameter("tm"); 
			String zq = request.getParameter("zq");
			String zsd = request.getParameter("zsd");
				int flag = cBean.comUp("insert into jd(tm,zq,zsd)  values('"+tm+"','"+zq+"','"+zsd+"'  )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/jd/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/jd/index.jsp").forward(request, response);
				}
			 
		} 
		else if(method.equals("upjd")){ //修改简单
			String id=request.getParameter("id"); 
			String tm = request.getParameter("tm"); 
			String zq = request.getParameter("zq");
			String zsd = request.getParameter("zsd"); 
				int flag = cBean.comUp("update jd set tm='"+tm+"',zq='"+zq+"',zsd='"+zsd+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/jd/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/jd/index.jsp").forward(request, response);
				}
			 
		}
		 
		else if(method.equals("deljd")){//删除主观
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from jd where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/jd/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/jd/index.jsp").forward(request, response);
			}
		}
		 
		else if(method.equals("dt")){//答题  --代码注释
			String sjbh=request.getParameter("sjbh");
			String member=(String)session.getAttribute("member"); 
			String ss=cBean.getString("select id from cj where sjbh='"+sjbh+"' and member='"+member+"'");
			if(ss==null){
				List pagelist3=cBean.getCom("select * from xzsj where sjbh='"+sjbh+"' order by id desc",10);	
				
				String str="";
				for(int i=0;i<pagelist3.size();i++){
					List list2=(List)pagelist3.get(i);
					String ok=request.getParameter("xzda"+list2.get(0).toString());
					//System.out.println("ok"+list2.get(0).toString()+">>>>>>>>>>");
					//System.out.println(ok);
					str=str+"/"+ok;
				}
				 
				
				
				request.setAttribute("sjbh", sjbh);
				request.setAttribute("str", str); 
				request.getRequestDispatcher("member/tk/jg.jsp").forward(request, response); 
			}
			else{
				request.setAttribute("message", "请不要重复答题！");
				request.getRequestDispatcher("member/tk/tk.jsp").forward(request, response);
			}
			 
			
			/**
			 * String str="";
							int id[]= new int[check.length];
							for(int i = 0;i<check.length;i++){
								String ss=check[i];
								System.out.println(ss);
								str=ss+"/"+str;
//								int s = Integer.parseInt(check[i]);				
//								id[i] = s;
							}
							System.out.println(str);
			 */
		}
 
		else if(method.equals("upcj")){ 
			String id=request.getParameter("id");
			String fs = request.getParameter("fs"); 
			String fs2 = request.getParameter("fs2"); 
			String fs3 = request.getParameter("fs3"); 
				int flag = cBean.comUp("update cj set xzfs='"+fs+"',pdfs='"+fs2+"',jdfs='"+fs3+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/cj/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/cj/index.jsp").forward(request, response);
				}
			 
		}
		else if(method.equals("delcj")){//删除成绩
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from cj where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/cj/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/cj/index.jsp").forward(request, response);
			}
		}
		
		
		
		
		else if(method.equals("addtz")){ //增加试题  
			String bt = request.getParameter("bt");
			String nr = request.getParameter("nr"); 
				int flag = cBean.comUp("insert into tz(bt,nr,sj)  values('"+bt+"','"+nr+"','"+date2+"' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/tz/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/tz/index.jsp").forward(request, response);
				}
			 
		} 
		else if(method.equals("uptz")){ //修改试题
			String id=request.getParameter("id");
			String bt = request.getParameter("bt");
			String nr = request.getParameter("nr"); 
				int flag = cBean.comUp("update tz set bt='"+bt+"',nr='"+nr+"'  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/tz/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/tz/index.jsp").forward(request, response);
				}
			 
		}
		 
		else if(method.equals("deltz")){//删除选择题
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from tz where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/tz/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/tz/index.jsp").forward(request, response);
			}
		}
		
		
		else if(method.equals("addbiji")){ //增加试题  
			String bt = request.getParameter("bt");
			String nr = request.getParameter("nr"); 
			String member=(String)session.getAttribute("member"); 
				int flag = cBean.comUp("insert into biji(bt,nr,sj,xs)  values('"+bt+"','"+nr+"','"+date2+"','"+member+"' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("member/biji/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("member/biji/index.jsp").forward(request, response);
				}
			 
		} 
		else if(method.equals("upbiji")){ //修改试题
			String id=request.getParameter("id");
			String bt = request.getParameter("bt");
			String nr = request.getParameter("nr"); 
				int flag = cBean.comUp("update biji set bt='"+bt+"',nr='"+nr+"'  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("member/biji/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("member/biji/index.jsp").forward(request, response);
				}
			 
		}
		 
		else if(method.equals("delbiji")){//删除选择题
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from biji where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("member/biji/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("member/biji/index.jsp").forward(request, response);
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
