<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>

<%-- v 1.0 --%>
<%-- <SCRIPT language=javascript>
//检验表单的合法性
function checkreg() {

	if (document.regform.username.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的学号！");
		document.regform.username.focus();
		return false;
	}
	if (document.regform.password.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的密码！");
		document.regform.password.focus();
		return false;
	} 
	if (document.regform.realname.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的真实姓名！");
		document.regform.realname.focus();
		return false;
	} 
	if (document.regform.sex.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的联系电话！");
		document.regform.sex.focus();
		return false;
	} 
	 if (document.regform.age.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的身份证号！");
		document.regform.age.focus();
		return false;
	} 
	if (document.regform.address.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的联系地址！");
		document.regform.address.focus();
		return false;
	} 
	if (document.regform.email.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的邮箱！");
		document.regform.email.focus();
		return false;
	} 
	if(!/(\S)+[@]{1}(\S)+[.]{1}(\w)+/.test(document.regform.email.value)) 
    {
        alert("请输入格式正确的 e-mail 地址！");
        document.regform.email.focus();
        return false;         
    }
}
</SCRIPT>

  <FORM name="regform" method="post" action="<%=basePath%>MemberServlet?method=mreg" onSubmit="return checkreg();"> 
  <TABLE align=center>
    <TBODY>
    <TR>
	  <TD width="20%" align="right">学生学号：</TD>
	  <TD align="left"><input type="text" size="30" name="username"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">登录密码：</TD>
	  <TD align="left"><input type="password" size="30" name="password"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">真实姓名：</TD>
	  <TD align="left"><input type="text" size="30" name="realname"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">联系电话：</TD>
	  <TD align="left"><input type="text" size="30" name="sex"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">身份证号：</TD>
	  <TD align="left"><input type="text" size="30" name="age"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">班级信息：</TD>
	  <TD align="left"><select name="address"> 
    <%List flist=cb.getCom("select * from bj order by id asc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">邮箱：</TD>
	  <TD align="left"><input type="text" size="30" name="email"></TD>
	</TR>
    <TR>
      <TD align="center" colspan="2"><INPUT value="提交注册" type=submit>&nbsp;&nbsp;
      <INPUT value="登录" type="button" onclick="window.location.href='login.jsp'"></TD>
	</TR>
	</TBODY>
  </TABLE>
  </FORM>
<%@ include file="iframe/foot.jsp"%> --%>


<%-- v 2.0 --%>
<SCRIPT language=javascript>
//检验表单的合法性
function checkreg() {

    //v 2.0  2021.3.8修改
	if (document.regform.username.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的学工账号！");
		document.regform.username.focus();
		return false;
	}
	if (document.regform.password.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的登录密码！");
		document.regform.password.focus();
		return false;
	} 
	if (document.regform.realname.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的真实姓名！");
		document.regform.realname.focus();
		return false;
	} 
	if (document.regform.sex.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的联系电话！");
		document.regform.sex.focus();
		return false;
	} 
	 if (document.regform.email.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的工作邮箱！");
		document.regform.email.focus();
		return false;
	} 
	if (document.regform.age.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的办公地址！");
		document.regform.age.focus();
		return false;
	} 
	if (document.regform.address.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请选择所属学院！");
		document.regform.address.focus();
		return false;
	} 
	if(!/(\S)+[@]{1}(\S)+[.]{1}(\w)+/.test(document.regform.email.value)) 
    {
        alert("请输入格式正确的 e-mail 地址！");
        document.regform.email.focus();
        return false;         
    }
}
</SCRIPT>

  <FORM name="regform" method="post" action="<%=basePath%>MemberServlet?method=mreg" onSubmit="return checkreg();"> 
  <TABLE align=center>
    <TBODY>
    <TR>
	  <TD width="20%" align="right">学工账号：</TD>
	  <TD align="left"><input type="text" size="30" name="username"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">登录密码：</TD>
	  <TD align="left"><input type="password" size="30" name="password"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">真实姓名：</TD>
	  <TD align="left"><input type="text" size="30" name="realname"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">联系电话：</TD>
	  <TD align="left"><input type="text" size="30" name="sex"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">工作邮箱：</TD>
	  <TD align="left"><input type="text" size="30" name="email"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">办公地址：</TD>
	  <TD align="left"><input type="text" size="30" name="age"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">所属学院：</TD>
	  <TD align="left"><select name="address"> 
    <%List flist=cb.getCom("select * from bj order by id asc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></TD>
	</TR>
	
    <TR>
      <TD align="center" colspan="2"><INPUT value="注册" type=submit>&nbsp;&nbsp;
      <INPUT value="登录" type="button" onclick="window.location.href='login.jsp'"></TD>
	</TR>
	</TBODY>
  </TABLE>
  </FORM>
<%@ include file="iframe/foot.jsp"%>
