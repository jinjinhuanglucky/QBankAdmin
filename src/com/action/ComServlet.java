// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ComServlet.java

package com.action;

import com.bean.ComBean;
import java.io.IOException;
import java.io.PrintStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ComServlet extends HttpServlet
{

	public ComServlet()
	{
	}

	public void destroy()
	{
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		response.setContentType("text/html;charset=gb2312");
		request.setCharacterEncoding("gb2312");
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date = (new SimpleDateFormat("yyyyMMddHHmmss")).format(Calendar.getInstance().getTime());
		String date2 = (new SimpleDateFormat("yyyy-MM-dd")).format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if (method.equals("addxz"))
		{
			String tm = request.getParameter("tm");
			String d1 = request.getParameter("d1");
			String d2 = request.getParameter("d2");
			String d3 = request.getParameter("d3");
			String d4 = request.getParameter("d4");
			String zq = request.getParameter("zq");
			int flag = cBean.comUp((new StringBuilder("insert into xz(tm,d1,d2,d3,d4,zq )  values('")).append(tm).append("','").append(d1).append("','").append(d2).append("','").append(d3).append("','").append(d4).append("','").append(zq).append("'  )").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("upxz"))
		{
			String id = request.getParameter("id");
			String tm = request.getParameter("tm");
			String d1 = request.getParameter("d1");
			String d2 = request.getParameter("d2");
			String d3 = request.getParameter("d3");
			String d4 = request.getParameter("d4");
			String zq = request.getParameter("zq");
			int flag = cBean.comUp((new StringBuilder("update xz set tm='")).append(tm).append("',d1='").append(d1).append("',d2='").append(d2).append("',d3='").append(d3).append("' ,d4='").append(d4).append("' ,zq='").append(zq).append("'   where id='").append(id).append("'").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("delxz"))
		{
			String id = request.getParameter("id");
			int flag = cBean.comUp((new StringBuilder("delete from xz where id='")).append(id).append("'").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("addpd"))
		{
			String tm = request.getParameter("tm");
			String zq = request.getParameter("zq");
			int flag = cBean.comUp((new StringBuilder("insert into pd(tm,zq )  values('")).append(tm).append("','").append(zq).append("'  )").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/pd/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/pd/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("uppd"))
		{
			String id = request.getParameter("id");
			String tm = request.getParameter("tm");
			String zq = request.getParameter("zq");
			int flag = cBean.comUp((new StringBuilder("update pd set tm='")).append(tm).append("',zq='").append(zq).append("'  where id='").append(id).append("'").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/pd/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/pd/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("delpd"))
		{
			String id = request.getParameter("id");
			int flag = cBean.comUp((new StringBuilder("delete from pd where id='")).append(id).append("'").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/pd/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/pd/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("addjd"))
		{
			String tm = request.getParameter("tm");
			String zq = request.getParameter("zq");
			int flag = cBean.comUp((new StringBuilder("insert into jd(tm,zq )  values('")).append(tm).append("','").append(zq).append("'  )").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/jd/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/jd/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("upjd"))
		{
			String id = request.getParameter("id");
			String tm = request.getParameter("tm");
			String zq = request.getParameter("zq");
			int flag = cBean.comUp((new StringBuilder("update jd set tm='")).append(tm).append("',zq='").append(zq).append("'  where id='").append(id).append("'").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/jd/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/jd/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("deljd"))
		{
			String id = request.getParameter("id");
			int flag = cBean.comUp((new StringBuilder("delete from jd where id='")).append(id).append("'").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/jd/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/jd/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("addcx"))
		{
			String tm = request.getParameter("tm");
			String zq = request.getParameter("zq");
			int flag = cBean.comUp((new StringBuilder("insert into cx(tm,zq )  values('")).append(tm).append("','").append(zq).append("'  )").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/cx/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/cx/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("upcx"))
		{
			String id = request.getParameter("id");
			String tm = request.getParameter("tm");
			String zq = request.getParameter("zq");
			int flag = cBean.comUp((new StringBuilder("update cx set tm='")).append(tm).append("',zq='").append(zq).append("' where id='").append(id).append("'").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/cx/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/cx/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("delcx"))
		{
			String id = request.getParameter("id");
			int flag = cBean.comUp((new StringBuilder("delete from cx where id='")).append(id).append("'").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/cx/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/cx/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("zdsj"))
		{
			String mc = request.getParameter("mc");
			String xzsl = request.getParameter("xzsl");
			String xzfs = request.getParameter("xzfs");
			String pdsl = request.getParameter("pdsl");
			String pdfs = request.getParameter("pdfs");
			String jdsl = request.getParameter("jdsl");
			String jdfs = request.getParameter("jdfs");
			List xzlist = cBean.getCom((new StringBuilder("select top ")).append(xzsl).append(" * from xz order by newid()").toString(), 8);
			if (!xzlist.isEmpty())
			{
				for (int i = 0; i < xzlist.size(); i++)
				{
					List xlist = (List)xzlist.get(i);
					cBean.comUp((new StringBuilder("insert into xzsj(tm,d1,d2,d3,d4,zq,zsd,sjbh,xzid)  values('")).append(xlist.get(1).toString()).append("','").append(xlist.get(2).toString()).append("','").append(xlist.get(3).toString()).append("','").append(xlist.get(4).toString()).append("',").append("'").append(xlist.get(5).toString()).append("','").append(xlist.get(6).toString()).append("','").append(xlist.get(7).toString()).append("','").append(date).append("','").append(xlist.get(0).toString()).append("' )").toString());
				}

			}
			List pdlist = cBean.getCom((new StringBuilder("select top ")).append(pdsl).append(" * from pd order by newid()").toString(), 4);
			if (!pdlist.isEmpty())
			{
				for (int i = 0; i < pdlist.size(); i++)
				{
					List xlist = (List)pdlist.get(i);
					cBean.comUp((new StringBuilder("insert into pdsj(tm,zq,zsd,sjbh,pdid)  values('")).append(xlist.get(1).toString()).append("','").append(xlist.get(2).toString()).append("','").append(xlist.get(3).toString()).append("','").append(date).append("','").append(xlist.get(0).toString()).append("'  )").toString());
				}

			}
			List jdlist = cBean.getCom((new StringBuilder("select top ")).append(jdsl).append(" * from jd order by newid()").toString(), 4);
			if (!jdlist.isEmpty())
			{
				for (int i = 0; i < jdlist.size(); i++)
				{
					List xlist = (List)jdlist.get(i);
					cBean.comUp((new StringBuilder("insert into jdsj(tm,zq,zsd,sjbh,jdid)  values('")).append(xlist.get(1).toString()).append("','").append(xlist.get(2).toString()).append("','").append(xlist.get(3).toString()).append("','").append(date).append("' ,'").append(xlist.get(0).toString()).append("' )").toString());
				}

			}
			int flag = cBean.comUp((new StringBuilder("insert into sj(mc,xzsl,xzfs,pdsl,pdfs,jdsl,jdfs,sjbh,xz)  values('")).append(mc).append("' ,'").append(xzsl).append("','").append(xzfs).append("','").append(pdsl).append("','").append(pdfs).append("','").append(jdsl).append("','").append(jdfs).append("','").append(date).append("','自动')").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/sj/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/sj/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("delsj"))
		{
			String id = request.getParameter("id");
			String sjbh = cBean.getString((new StringBuilder("select sjbh from sj where id='")).append(id).append("'").toString());
			int flag = cBean.comUp((new StringBuilder("delete from sj where id='")).append(id).append("'").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				cBean.comUp((new StringBuilder("delete from xzsj where sjbh='")).append(sjbh).append("'").toString());
				cBean.comUp((new StringBuilder("delete from pdsj where sjbh='")).append(sjbh).append("'").toString());
				cBean.comUp((new StringBuilder("delete from jdsj where sjbh='")).append(sjbh).append("'").toString());
				request.getRequestDispatcher("admin/sj/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/sj/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("sdsj"))
		{
			String mc = request.getParameter("mc");
			String xzfs = request.getParameter("xzfs");
			String pdfs = request.getParameter("pdfs");
			String jdfs = request.getParameter("jdfs");
			String cxfs = request.getParameter("cxfs");
			int flag = cBean.comUp((new StringBuilder("insert into sj(mc,xzsl,xzfs,pdsl,pdfs,jdsl,jdfs,cxsl,cxfs,sjbh,xz)  values('")).append(mc).append("' ,'0','").append(xzfs).append("','0','").append(pdfs).append("','0','").append(jdfs).append("','0','").append(cxfs).append("','").append(date).append("','手动')").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/sj/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/sj/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("addsjxzt"))
		{
			String xzid = request.getParameter("xzid");
			String sjbh = request.getParameter("sjbh");
			String str = cBean.getString((new StringBuilder("select id from xzsj where xzid='")).append(xzid).append("' and sjbh='").append(sjbh).append("'").toString());
			if (str == null)
			{
				List xzlist = cBean.get1Com((new StringBuilder("select * from xz where id='")).append(xzid).append("'").toString(), 7);
				cBean.comUp((new StringBuilder("insert into xzsj(tm,d1,d2,d3,d4,zq,sjbh,xzid)  values('")).append(xzlist.get(1).toString()).append("','").append(xzlist.get(2).toString()).append("','").append(xzlist.get(3).toString()).append("','").append(xzlist.get(4).toString()).append("',").append("'").append(xzlist.get(5).toString()).append("','").append(xzlist.get(6).toString()).append("','").append(sjbh).append("','").append(xzlist.get(0).toString()).append("')").toString());
				cBean.comUp((new StringBuilder("update sj set xzsl=xzsl+1 where sjbh='")).append(sjbh).append("'").toString());
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/sj/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "题目重复！");
				request.getRequestDispatcher("admin/sj/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("addsjpdt"))
		{
			String pdid = request.getParameter("pdid");
			String sjbh = request.getParameter("sjbh");
			String str = cBean.getString((new StringBuilder("select id from pdsj where pdid='")).append(pdid).append("' and sjbh='").append(sjbh).append("'").toString());
			if (str == null)
			{
				List pdlist = cBean.get1Com((new StringBuilder("select * from pd where id='")).append(pdid).append("'").toString(), 3);
				cBean.comUp((new StringBuilder("insert into pdsj(tm,zq,sjbh,pdid)  values('")).append(pdlist.get(1).toString()).append("','").append(pdlist.get(2).toString()).append("','").append(sjbh).append("','").append(pdlist.get(0).toString()).append("')").toString());
				cBean.comUp((new StringBuilder("update sj set pdsl=pdsl+1 where sjbh='")).append(sjbh).append("'").toString());
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/sj/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "题目重复！");
				request.getRequestDispatcher("admin/sj/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("addsjjdt"))
		{
			String jdid = request.getParameter("jdid");
			String sjbh = request.getParameter("sjbh");
			String str = cBean.getString((new StringBuilder("select id from jdsj where jdid='")).append(jdid).append("' and sjbh='").append(sjbh).append("'").toString());
			if (str == null)
			{
				List jdlist = cBean.get1Com((new StringBuilder("select * from jd where id='")).append(jdid).append("'").toString(), 3);
				cBean.comUp((new StringBuilder("insert into jdsj(tm,zq,sjbh,jdid)  values('")).append(jdlist.get(1).toString()).append("','").append(jdlist.get(2).toString()).append("','").append(sjbh).append("','").append(jdlist.get(0).toString()).append("')").toString());
				cBean.comUp((new StringBuilder("update sj set jdsl=jdsl+1 where sjbh='")).append(sjbh).append("'").toString());
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/sj/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "题目重复！");
				request.getRequestDispatcher("admin/sj/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("addsjcxt"))
		{
			String cxid = request.getParameter("cxid");
			String sjbh = request.getParameter("sjbh");
			String str = cBean.getString((new StringBuilder("select id from cxsj where cxid='")).append(cxid).append("' and sjbh='").append(sjbh).append("'").toString());
			if (str == null)
			{
				List cxlist = cBean.get1Com((new StringBuilder("select * from cx where id='")).append(cxid).append("'").toString(), 3);
				cBean.comUp((new StringBuilder("insert into cxsj(tm,zq,sjbh,cxid)  values('")).append(cxlist.get(1).toString()).append("','").append(cxlist.get(2).toString()).append("','").append(sjbh).append("','").append(cxlist.get(0).toString()).append("')").toString());
				cBean.comUp((new StringBuilder("update sj set cxsl=cxsl+1 where sjbh='")).append(sjbh).append("'").toString());
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/sj/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "题目重复！");
				request.getRequestDispatcher("admin/sj/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("dt"))
		{
			String sjbh = request.getParameter("sjbh");
			String member = (String)session.getAttribute("member");
			String ss = cBean.getString((new StringBuilder("select id from cj where sjbh='")).append(sjbh).append("' and member='").append(member).append("'").toString());
			if (ss == null)
			{
				List pagelist3 = cBean.getCom((new StringBuilder("select * from xzsj where sjbh='")).append(sjbh).append("' order by id asc").toString(), 9);
				String str = "";
				for (int i = 0; i < pagelist3.size(); i++)
				{
					List list2 = (List)pagelist3.get(i);
					String ok = request.getParameter((new StringBuilder("xzda")).append(list2.get(0).toString()).toString());
					str = (new StringBuilder(String.valueOf(str))).append("/").append(ok).toString();
				}

				System.out.println(str);
				List pdlist = cBean.getCom((new StringBuilder("select * from pdsj where sjbh='")).append(sjbh).append("' order by id asc").toString(), 5);
				String str2 = "";
				for (int i = 0; i < pdlist.size(); i++)
				{
					List list2 = (List)pdlist.get(i);
					String ok = request.getParameter((new StringBuilder("pdda")).append(list2.get(0).toString()).toString());
					str2 = (new StringBuilder(String.valueOf(str2))).append("/").append(ok).toString();
				}

				System.out.println(str2);
				List jdlist = cBean.getCom((new StringBuilder("select * from jdsj where sjbh='")).append(sjbh).append("' order by id asc").toString(), 5);
				String str3 = "";
				for (int i = 0; i < jdlist.size(); i++)
				{
					List list2 = (List)jdlist.get(i);
					String ok = request.getParameter((new StringBuilder("jdda")).append(list2.get(0).toString()).toString());
					if (ok.equals(""))
						ok = "无";
					str3 = (new StringBuilder(String.valueOf(str3))).append("/").append(ok).toString();
				}

				System.out.println(str3);
				List cxlist = cBean.getCom((new StringBuilder("select * from cxsj where sjbh='")).append(sjbh).append("' order by id asc").toString(), 5);
				String str4 = "";
				for (int i = 0; i < cxlist.size(); i++)
				{
					List list2 = (List)cxlist.get(i);
					String ok = request.getParameter((new StringBuilder("cxda")).append(list2.get(0).toString()).toString());
					if (ok.equals(""))
						ok = "无";
					str4 = (new StringBuilder(String.valueOf(str4))).append("/").append(ok).toString();
				}

				request.setAttribute("sjbh", sjbh);
				request.setAttribute("str", str);
				request.setAttribute("str2", str2);
				request.setAttribute("str3", str3);
				request.setAttribute("str4", str4);
				request.getRequestDispatcher("member/tk/jg.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "请不要重复答题！");
				request.getRequestDispatcher("member/tk/tk.jsp").forward(request, response);
			}
		} else
		if (method.equals("upcj"))
		{
			String id = request.getParameter("id");
			String fs = request.getParameter("fs");
			String fs2 = request.getParameter("fs2");
			String fs3 = request.getParameter("fs3");
			String fs4 = request.getParameter("fs4");
			int flag = cBean.comUp((new StringBuilder("update cj set xzfs='")).append(fs).append("',pdfs='").append(fs2).append("',jdfs='").append(fs3).append("',cxfs='").append(fs4).append("' where id='").append(id).append("'").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/cj/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/cj/index.jsp").forward(request, response);
			}
		} else
		if (method.equals("delcj"))
		{
			String id = request.getParameter("id");
			int flag = cBean.comUp((new StringBuilder("delete from cj where id='")).append(id).append("'").toString());
			if (flag == 1)
			{
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/cj/index.jsp").forward(request, response);
			} else
			{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/cj/index.jsp").forward(request, response);
			}
		}
	}

	public void init()
		throws ServletException
	{
	}
}
