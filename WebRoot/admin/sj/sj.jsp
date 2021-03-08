<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>会员管理中心</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>member/images/css1/css.css" rel="stylesheet" type="text/css"> 
 
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message"); 
	
	 
	String sjid=request.getParameter("sjid"); 
	List sjlist=cb.get1Com("select * from sj where id='"+sjid+"'",11); 
	String sjbh=sjlist.get(10).toString();
	String xzsl=sjlist.get(2).toString();
	String xzfs=sjlist.get(3).toString();
	String pdsl=sjlist.get(4).toString();
	String pdfs=sjlist.get(5).toString();
	String jdsl=sjlist.get(6).toString();
	String jdfs=sjlist.get(7).toString();

	String cxsl=sjlist.get(8).toString();
	String cxfs=sjlist.get(9).toString();
	String sql="select * from xzsj where sjbh='"+sjbh+"' order by id asc";System.out.println(sql);
	List xzlist=cb.getCom(sql,8);
	List pdlist=cb.getCom("select * from pdsj where sjbh='"+sjbh+"' order by id asc",4);
	List jdlist=cb.getCom("select * from jdsj where sjbh='"+sjbh+"' order by id asc",4);
	List cxlist=cb.getCom("select * from cxsj where sjbh='"+sjbh+"' order by id asc",4);
%>
<body>
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0"> 
    <tr>
      <td class="bg_tr" align="left" colspan="2" height="25">试卷名称：<FONT color=red><%=sjlist.get(1).toString() %> </FONT> 试卷编号：<FONT color=red><%=sjbh%> </FONT> 
       </td>
    </tr>  
</table>
 
<form action="<%=basePath %>ComServlet?method=dt&sjbh=<%=sjbh%>" method="post" name="form1">
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody> 
  <tr>
      <th class="bg_tr" align="left" colspan="2" height="25"> 选择题（共<%=xzsl %>题，每题<%=xzfs %>分）</th>
  </tr>   
<%for(int i=0;i<xzlist.size();i++){List list2=(List)xzlist.get(i);%> 
    <tr>
      <td class="td_bg" height="23" align=left><%=i+1 %> <%=list2.get(1).toString() %> </td> 
    </tr> 
    <tr>
      <td class="td_bg" height="23" align=left><font color=#000000>
      A：<%=list2.get(2).toString() %> B：<%=list2.get(3).toString() %> C：<%=list2.get(4).toString() %> D：<%=list2.get(5).toString() %></font></td> 
    </tr> 
    <tr>
      <td class="td_bg" height="23" align=left>答案：<%=list2.get(6).toString() %></td> 
    </tr>
 <%} %> 
   <tr>
      <th class="bg_tr" align="left" colspan="2" height="25"> 判断题（共<%=pdsl %>题，每题<%=pdfs %>分）</th>
  </tr>   
<%for(int i=0;i<pdlist.size();i++){List list2=(List)pdlist.get(i);%> 
    <tr>
      <td class="td_bg" height="23" align=left><%=i+1 %> <%=list2.get(1).toString() %> </td> 
    </tr>  
    <tr>
      <td class="td_bg" height="23" align=left>答案：<%=list2.get(2).toString()%></td> 
    </tr>
 <%} %>  
  <tr>
      <th class="bg_tr" align="left" colspan="2" height="25"> 填空题（共<%=jdsl %>题，每题<%=jdfs %>分）</th>
  </tr>   
<%for(int i=0;i<jdlist.size();i++){List list2=(List)jdlist.get(i);%> 
    <tr>
      <td class="td_bg" height="23" align=left><%=i+1 %> <%=list2.get(1).toString() %> </td> 
    </tr>  
    <tr>
      <td class="td_bg" height="23" align=left>答案：<%=list2.get(2).toString()%></td> 
    </tr>
 <%} %>        
   <tr>
      <th class="bg_tr" align="left" colspan="2" height="25"> 简答题（共<%=cxsl %>题，每题<%=cxfs %>分）</th>
  </tr>   
<%for(int i=0;i<cxlist.size();i++){List list2=(List)cxlist.get(i);%> 
    <tr>
      <td class="td_bg" height="23" align=left><%=i+1 %> <%=list2.get(1).toString() %> </td> 
    </tr>  
    <tr>
      <td class="td_bg" height="23" align=left>答案：<%=list2.get(2).toString()%></td> 
    </tr>
 <%} %>       
  </tbody>
</table>
</form>
 
 
</body>
 
