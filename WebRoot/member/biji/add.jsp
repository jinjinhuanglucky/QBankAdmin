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
<script type="text/javascript">
function check()
{
	if(document.form1.bt.value=="")
	{
		alert("请输入内容！");
		document.form1.bt.focus();
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
	
	String member=(String)session.getAttribute("member"); 
	if(member==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
		String method=request.getParameter("method");  
		String id="";String bt = ""; String nr="";  
		if(method.equals("upbiji")){
			id=request.getParameter("id");
			List jlist = cb.get1Com("select * from biji where id='"+id+"'",3);
			bt=jlist.get(1).toString();
			nr=jlist.get(2).toString(); 
		}	 
%>
<body>
<form action="<%=basePath %>TestServlet?method=<%=method%>&id=<%=id%>" method="post" name="form1" onSubmit="return check()">
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody>
    
    <tr>
      <td class="td_bg" width="45%" height="23" align=right>笔记标题：</td>
      <td class="td_bg" align=left><input type="text" name="bt" size="50" value="<%=bt %>" maxlength=16></td>
    </tr> 
    <tr>
      <td class="td_bg" width="45%" height="23" align=right>笔记内容：</td>
      <td class="td_bg" align=left><textarea name="nr" cols="50" rows="6"><%=nr %></textarea></td>
    </tr>
    <tr>
      <td class="td_bg" colspan="2" height="23" align=center>
      <input type="submit" value="确定"> </td>
    </tr> 
  </tbody>
</table>
</form>
</body>
<%} %>
