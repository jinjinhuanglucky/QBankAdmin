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
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>member/biji/index.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
    form3.action="<%=basePath%>member/biji/index.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>member/biji/index.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("已至第一页");
  }else{
    form3.action="<%=basePath%>member/biji/index.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("已至最后一页");
  }else{
    form3.action="<%=basePath%>member/biji/index.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump2(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("跳转文本框中只能输入数字!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//如果跳转文本框中输入的页数超过最后一页的数，则跳到最后一页
	  if(pageCount==0){	
	  form3.action="<%=basePath%>member/biji/index.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>member/biji/index.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//如果你输入的是0，那么就让它等于1
      form3.action="<%=basePath%>member/biji/index.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>member/biji/index.jsp?page="+page;
      form3.submit();
   }

}

}
//****判断是否是Number.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}
function del()
{
	pageform.submit();
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
%>
<body>
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody>
    <tr>
      <th class="bg_tr" align="left" colspan="17" height="25">笔记信息管理 </th>
    </tr>
    <tr align=center>
      <td class="td_bg" height="23"><strong>序号</strong></td>
      <td class="td_bg"><strong>标题</strong></td>
      <td class="td_bg"><strong>内容</strong></td>
      <td class="td_bg"><strong>时间</strong></td> 
      <td class="td_bg"><strong>修改</strong></td> 
      <td class="td_bg"><strong>查询</strong></td> 
    </tr>
<%
	cb.setEVERYPAGENUM(12);
	int cou = cb.getMessageCount("select count(*) from biji where xs='"+member+"'");//得到信息总数			        
	String page1=request.getParameter("page");
	if(page1==null){
		page1="1";
	}
	session.setAttribute("busMessageCount", cou + "");
	session.setAttribute("busPage", page1);
	List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from biji  where xs='"+member+"' order by id desc",4);
	session.setAttribute("qqq", pagelist1);
	int pageCount = cb.getPageCount(); //得到页数  
	session.setAttribute("busPageCount", pageCount + ""); 
	List pagelist3=(ArrayList)session.getAttribute("qqq");
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);
			//float zf=Float.parseFloat(pagelist2.get(2).toString())+Float.parseFloat(pagelist2.get(3).toString())+Float.parseFloat(pagelist2.get(4).toString())+Float.parseFloat(pagelist2.get(5).toString());
%> 
    <tr align=center>
      <td class="td_bg" height="23"><%=i+1 %></td> 
      <td class="td_bg"><%=pagelist2.get(1).toString() %></td> 
      <td class="td_bg"><%=pagelist2.get(2).toString() %></td>  
      <td class="td_bg"><%=pagelist2.get(3).toString() %></td> 
      <td class="td_bg"><a href="<%=basePath%>member/biji/add.jsp?method=upbiji&id=<%=pagelist2.get(0).toString()%>" >修改</a></td> 
      <td class="td_bg"><a href="<%=basePath%>TestServlet?method=delbiji&id=<%=pagelist2.get(0).toString()%>" >删除</a></td>
    </tr>
<% }} %> 
  </tbody>
</table> 
<center> 
<form action="" method="post" name="form3">	
	 <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//用于给上面javascript传值-->
	 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//用于给上面javascript传值-->         
					<a href="#" onClick="top2()">首页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="pre2()">上一页</a>&nbsp;&nbsp;&nbsp;
		 共<%=session.getAttribute("busMessageCount").toString()%>条记录,共计<%=session.getAttribute("busPageCount").toString()%>页,当前第<%=session.getAttribute("busPage").toString()%>页&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="next2()">下一页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="last2()">尾页</a>
	 第<input name="busjump" type="text" size="3" />页 <a href="#" onClick="bjump2()">转到</a>&nbsp;&nbsp;&nbsp; 
</form> 
</center>
</body>
<%} %>
