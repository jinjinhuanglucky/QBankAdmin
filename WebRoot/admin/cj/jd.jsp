<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String method=request.getParameter("method");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>��Ա��������</TITLE>
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
	
	String username=(String)session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
	
		String cjid=request.getParameter("cjid");
		String sjbh=cb.getString("select sjbh from cj where id='"+cjid+"'"); 
		String member=cb.getString("select member from cj where id='"+cjid+"'"); 
		String str3=cb.getString("select jdda from jdda where sjbh='"+sjbh+"' and member='"+member+"'"); 
		List jdlist=cb.getCom("select * from jdsj where sjbh='"+sjbh+"' order by id asc",5);	 
		String ss3[]=null;
		try{ 
		ss3=str3.split("/");//System.out.println(ss[0]+">>>>>>>>>");
		}catch(Exception e){}
		 
		float one_jdfs=cb.getFloat("select jdfs from sj where sjbh='"+sjbh+"'"); 
%>
<body>
 
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody> 
    <tr>
      <th class="bg_tr" align="left" colspan="12" height="25">
      �Ծ����ƣ�<FONT color=red><%=cb.getString("select mc from sj where sjbh='"+sjbh+"'") %></FONT>
      �Ծ��ţ�<FONT color=red><%=sjbh %></FONT></th>
    </tr>
     
    
    <tr>
      <td class="td_bg" colspan="12" height="23" align=left>����⣨��<%=one_jdfs %>�⣬ÿ��<%=one_jdfs %>�֣�</td>
    </tr> 
    <tr > 
      <td class="td_bg"  width="5%" align="center">ID</td>
      <td  class="td_bg"  align="center">��������</td>  
      <td  class="td_bg"  align="center">��ȷ��</td>  
      <td class="td_bg" colspan=2  align="center">ѧ���Ĵ�</td> 
    </tr>
    <%if(!jdlist.isEmpty()){
    for(int i=0;i<jdlist.size();i++){
    List list2=(List)jdlist.get(i);  
    %>
    <tr>
      <td align="center"  class="td_bg" ><%=i+1 %></td>
      <td align="center"  class="td_bg" ><%=list2.get(1).toString() %></td>
      <td align="center"  class="td_bg" ><%=list2.get(2).toString() %></td> 
      <td align="center" colspan=2 class="td_bg" ><%=ss3[i+1] %></td>
    </tr> 
     
    <%}} %>
    <tr>
      <td class="td_bg" colspan="12" height="23" align=center>���ľ���ڳɼ�����ҳ�����������ɼ���Ϣ��</td>
    </tr> 
  </tbody>
</table>
 
</body>
<%} %>
