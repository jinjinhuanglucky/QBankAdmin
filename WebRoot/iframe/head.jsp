<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd"> 
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD> 
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<%=basePath %>images/menu.css" rel=stylesheet> 
<LINK href="<%=basePath %>images/web.css" rel=stylesheet> 
<META content="MSHTML 6.00.2900.5945" name=GENERATOR>
</HEAD>
<BODY bottomMargin=0 bgColor=#f0f0f0 leftMargin=0 topMargin=0 rightMargin=0>
<TABLE id=table1 height=66 cellSpacing=0 cellPadding=0 width="100%" background=<%=basePath %>images/bk1.gif border=0>
  <TBODY>
  <TR>
    <TD vAlign=top>
      <TABLE id=table3 height=19 cellSpacing=0 cellPadding=0 width=100 border=0><TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE>
      <DIV align=center>
      <TABLE id=table2 height=38 cellSpacing=0 cellPadding=0 width=962 align=center border=0>
        <TBODY>
        <TR>
          <TD width=961>
            <TABLE id=table5 height=38 cellSpacing=0 cellPadding=0 width=917 align=center border=0>
              <TBODY>
              <TR>
                <TD width=9></TD>
                <TD width=169><IMG height=38 src="<%=basePath %>images/z_03.jpg" width=169 border=0></TD>
                <TD align=left width=391><IMG height=38 src="<%=basePath %>images/z_04.gif" width=286></TD>
                <TD align=right width=350>
                  <TABLE id=table6 cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD class=hui199>
					   
					  </TD> 
					</TR>
					</TBODY>
				  </TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>


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
%>