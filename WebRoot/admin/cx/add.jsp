<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>  
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>后台操作区</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>admin/images/style.css" rel="stylesheet" type="text/css"> 
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	background-color: #2286C2;
}
-->
</style>
</head> 
<SCRIPT language=JavaScript src="<%=basePath %>admin/images/calendar.js"></SCRIPT>
<script type="text/javascript">
function check()
{// 
	if(document.form1.tm.value==""||document.form1.zq.value==""  )
	{
		alert("全部内容都要填写！");
		//document.form1.xzryj.focus();
		return false;
	}
	 
}
</script>

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
		String method=request.getParameter("method");  
		String id="";String tm = ""; String zq="";  
		if(method.equals("upcx")){
			id=request.getParameter("id");
			List jlist = cb.get1Com("select * from cx where id='"+id+"'",3);
			tm=jlist.get(1).toString();zq=jlist.get(2).toString(); 
		}	 
%>
<BODY >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td height="2">&nbsp;</td>
  </tr>
  <tr>
	<td background="<%=basePath %>admin/images/index1_45.gif"></td>
	<td bgcolor="#FFFFFF" style="height:490px; vertical-align:top;">
	  <table width="100%" border="0" cellspacing="10" cellpadding="0">
		<tr>
		  <td>
			<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#C4E7FB">
			  <tr>
				<td>
				  <table width="100%" border="0" cellpadding="0" cellspacing="5" bgcolor="#FFFFFF">
					<tr>
					  <td class="font2">&nbsp;试题信息管理</td>
					</tr>
				  </table>
				</td>
			  </tr>
			</table>
		  </td>
		</tr>
		<tr>
		  <td>
<form action="<%=basePath %>ComServlet?method=<%=method%>&id=<%=id%>" method="post" name="form1" onSubmit="return check()">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
  <tbody> 
    <tr bgColor=#ffffff>
      <td class="font1" height="26" width="35%" align=right>题目：</td>
      <td class="font1" align=left><input type="text" name=tm  value="<%=tm %>" size=50/></td>
    </tr>  
    <tr bgColor=#ffffff>
      <td class="font1" height="26" width="35%" align=right>答案：</td>
      <td class="font1" align=left><textarea name=zq  cols="50" rows="8"><%=zq %></textarea>
    </tr>  
    <tr bgColor=#ffffff>
      <td class="font1" colspan="2" height="23" align=center><input type="submit" value="确定"></td>
    </tr> 
  </tbody>
</table>
</form>
</td>
</tr> 
	  </table>
	</td>
	<td background="images/index1_47.gif"></td>
  </tr>
  <tr>
	<td width="8" height="8"><img src="images/index1_91.gif" width="8" height="8" /></td>
	<td background="images/index1_92.gif"></td>
	<td width="8" height="8"><img src="images/index1_93.gif" width="8" height="8" /></td>
  </tr>
</table>
</body>
<%} %>
