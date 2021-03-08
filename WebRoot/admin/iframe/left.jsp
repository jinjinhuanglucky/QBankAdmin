<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<%=basePath %>admin/images/admin.css" type="text/css" rel="stylesheet">
<SCRIPT language=javascript>
	function expand(el)
	{
		childObj = document.getElementById("child" + el);

		if (childObj.style.display == 'none')
		{
			childObj.style.display = 'block';
		}
		else
		{
			childObj.style.display = 'none';
		}
		return;
	}
</SCRIPT>
</HEAD>
<%
	String username=(String)session.getAttribute("user"); String sf=(String)session.getAttribute("sf"); 
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
%>
<body>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width=170 background=<%=basePath %>admin/images/menu_bg.jpg border=0>
  <TR>
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0><TR><TD height=10></TD></TR></TABLE> 
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(1) href="javascript:void(0);">密码信息管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child1 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/system/editpwd.jsp" target="MainFrame">修改登陆密码</A></TD></TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE> 
	   
	 <%if(sf.equals("管理员")){ %>  
	   <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(311) href="javascript:void(0);">教师用户管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child311 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/system/index.jsp" target="MainFrame">教师用户管理</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/system/add.jsp?method=addm" target="MainFrame">增加教师用户</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE> 
	   
	   
	   <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(3111) href="javascript:void(0);">班级信息管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child3111 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/bj/index.jsp" target="MainFrame">班级信息管理</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/bj/add.jsp?method=addbj" target="MainFrame">增加班级信息</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE> 
	    
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(3) href="javascript:void(0);">学生用户管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child3 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/member/index.jsp" target="MainFrame">学生用户管理</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/member/s.jsp" target="MainFrame">学生用户查询</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  
	  
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(1911) href="javascript:void(0);">通知信息管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child1911 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/tz/index.jsp" target="MainFrame">通知信息管理</A></TD>
		</TR>   
		 <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/tz/add.jsp?method=addtz" target="MainFrame">增加通知信息</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/tz/s.jsp" target="MainFrame">查询通知信息</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  <%}%> 
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(111) href="javascript:void(0);">选择题管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child111 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/xz/index.jsp" target="MainFrame">选择题管理</A></TD>
		</TR>   
		 <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/xz/add.jsp?method=addxz" target="MainFrame">增加选择题</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/xz/s.jsp" target="MainFrame">查询选择题</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(1111) href="javascript:void(0);">判断题管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child1111 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/pd/index.jsp" target="MainFrame">判断题管理</A></TD>
		</TR>   
		 <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/pd/add.jsp?method=addpd" target="MainFrame">增加判断题</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/pd/s.jsp" target="MainFrame">查询判断题</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(11111) href="javascript:void(0);">填空题管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child11111 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/jd/index.jsp" target="MainFrame">填空题管理</A></TD>
		</TR>   
		 <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/jd/add.jsp?method=addjd" target="MainFrame">增加填空题</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/jd/s.jsp" target="MainFrame">查询填空题</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(211111) href="javascript:void(0);">简答题管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child211111 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/cx/index.jsp" target="MainFrame">简答题管理</A></TD>
		</TR>   
		 <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/cx/add.jsp?method=addcx" target="MainFrame">增加简答题</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/cx/s.jsp" target="MainFrame">查询简答题</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	 
       
        <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(11) href="javascript:void(0);">试卷信息管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child11 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/sj/index.jsp" target="MainFrame">试卷信息管理</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/sj/sd.jsp" target="MainFrame">增加试卷信息</A></TD>
		</TR> 
		 <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/sj/s.jsp" target="MainFrame">查询试卷信息</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	   
	   <%if(!sf.equals("管理员")){ %>  
	   <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(12) href="javascript:void(0);">成绩信息管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child12 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/cj/index.jsp" target="MainFrame">成绩信息管理</A></TD>
		</TR>  
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/cj/s.jsp" target="MainFrame">成绩信息查询</A></TD>
		</TR>  
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  <%} %>
	   
       </TD>
     </TR> 
</TABLE>
</body>
<%} %>
</HTML>
