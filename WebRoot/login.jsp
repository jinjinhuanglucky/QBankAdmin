<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<%@ include file="iframe/head.jsp"%>
<SCRIPT language=javascript>
//检验表单的合法性
function checklogin() {
	if (document.loginform.username.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\账号不能为空！");
		document.loginform.username.focus();
		return false;
	}
	if (document.loginform.password.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\密码不能为空！");
		document.loginform.password.focus();
		return false;
	} 
}
</SCRIPT>
<TABLE align=center id=table19 cellSpacing=0 cellPadding=0 border=0>
	<TBODY>
		<TR>
			<TD>
<%--				<IMG height=243 src="<%=basePath%>images/h.jpg" width=898 border=0>--%>
				<IMG height=243 src="<%=basePath%>images/head.jpg" width=898 border=0>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<FORM name="loginform" method="post"
	action="<%=basePath%>MemberServlet?method=mlogin"
	onSubmit="return checklogin();">
	<TABLE align=center height="180">
		<TBODY>
			<TR>
				<TD width="20%" align="right">
					帐号：
				</TD>
				<TD align="left">
					<input type="text" size="33" name="username">
				</TD>
			</TR>
			<TR>
				<TD width="20%" align="right">
					登录：
				</TD>
				<TD align="left">
					<input type="password" size="33" name="password">
				</TD>
			</TR>
			<TR>
				<TD width="20%" align="right">
					权限：
				</TD>
				<TD align="left">
					<select name=sf>
						<option value="普通用户">
							普通用户
						</option>
						<option value="教师用户">
							教师用户
						</option>
						<option value="管理员">
							管理员
						</option>
					</select>
				</TD>
			</TR>
			<TR>
				<TD align="center" colspan="2">
					<INPUT value="登录" type=submit>
					&nbsp;&nbsp;
					<INPUT value="注册" type="button"
						onclick="window.location.href='reg.jsp'">
					&nbsp;&nbsp;
					<INPUT value="忘记密码" type="button"
						onclick="window.location.href='lost.jsp'">
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</FORM>
<%@ include file="iframe/foot.jsp"%>