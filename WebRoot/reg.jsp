<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>

<%-- v 1.0 --%>
<%-- <SCRIPT language=javascript>
//������ĺϷ���
function checkreg() {

	if (document.regform.username.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\����������ѧ�ţ�");
		document.regform.username.focus();
		return false;
	}
	if (document.regform.password.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\�������������룡");
		document.regform.password.focus();
		return false;
	} 
	if (document.regform.realname.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\������������ʵ������");
		document.regform.realname.focus();
		return false;
	} 
	if (document.regform.sex.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\������������ϵ�绰��");
		document.regform.sex.focus();
		return false;
	} 
	 if (document.regform.age.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\�������������֤�ţ�");
		document.regform.age.focus();
		return false;
	} 
	if (document.regform.address.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\������������ϵ��ַ��");
		document.regform.address.focus();
		return false;
	} 
	if (document.regform.email.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\�������������䣡");
		document.regform.email.focus();
		return false;
	} 
	if(!/(\S)+[@]{1}(\S)+[.]{1}(\w)+/.test(document.regform.email.value)) 
    {
        alert("�������ʽ��ȷ�� e-mail ��ַ��");
        document.regform.email.focus();
        return false;         
    }
}
</SCRIPT>

  <FORM name="regform" method="post" action="<%=basePath%>MemberServlet?method=mreg" onSubmit="return checkreg();"> 
  <TABLE align=center>
    <TBODY>
    <TR>
	  <TD width="20%" align="right">ѧ��ѧ�ţ�</TD>
	  <TD align="left"><input type="text" size="30" name="username"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">��¼���룺</TD>
	  <TD align="left"><input type="password" size="30" name="password"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">��ʵ������</TD>
	  <TD align="left"><input type="text" size="30" name="realname"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">��ϵ�绰��</TD>
	  <TD align="left"><input type="text" size="30" name="sex"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">���֤�ţ�</TD>
	  <TD align="left"><input type="text" size="30" name="age"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">�༶��Ϣ��</TD>
	  <TD align="left"><select name="address"> 
    <%List flist=cb.getCom("select * from bj order by id asc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">���䣺</TD>
	  <TD align="left"><input type="text" size="30" name="email"></TD>
	</TR>
    <TR>
      <TD align="center" colspan="2"><INPUT value="�ύע��" type=submit>&nbsp;&nbsp;
      <INPUT value="��¼" type="button" onclick="window.location.href='login.jsp'"></TD>
	</TR>
	</TBODY>
  </TABLE>
  </FORM>
<%@ include file="iframe/foot.jsp"%> --%>


<%-- v 2.0 --%>
<SCRIPT language=javascript>
//������ĺϷ���
function checkreg() {

    //v 2.0  2021.3.8�޸�
	if (document.regform.username.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\����������ѧ���˺ţ�");
		document.regform.username.focus();
		return false;
	}
	if (document.regform.password.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\���������ĵ�¼���룡");
		document.regform.password.focus();
		return false;
	} 
	if (document.regform.realname.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\������������ʵ������");
		document.regform.realname.focus();
		return false;
	} 
	if (document.regform.sex.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\������������ϵ�绰��");
		document.regform.sex.focus();
		return false;
	} 
	 if (document.regform.email.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\���������Ĺ������䣡");
		document.regform.email.focus();
		return false;
	} 
	if (document.regform.age.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\���������İ칫��ַ��");
		document.regform.age.focus();
		return false;
	} 
	if (document.regform.address.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\��ѡ������ѧԺ��");
		document.regform.address.focus();
		return false;
	} 
	if(!/(\S)+[@]{1}(\S)+[.]{1}(\w)+/.test(document.regform.email.value)) 
    {
        alert("�������ʽ��ȷ�� e-mail ��ַ��");
        document.regform.email.focus();
        return false;         
    }
}
</SCRIPT>

  <FORM name="regform" method="post" action="<%=basePath%>MemberServlet?method=mreg" onSubmit="return checkreg();"> 
  <TABLE align=center>
    <TBODY>
    <TR>
	  <TD width="20%" align="right">ѧ���˺ţ�</TD>
	  <TD align="left"><input type="text" size="30" name="username"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">��¼���룺</TD>
	  <TD align="left"><input type="password" size="30" name="password"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">��ʵ������</TD>
	  <TD align="left"><input type="text" size="30" name="realname"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">��ϵ�绰��</TD>
	  <TD align="left"><input type="text" size="30" name="sex"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">�������䣺</TD>
	  <TD align="left"><input type="text" size="30" name="email"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">�칫��ַ��</TD>
	  <TD align="left"><input type="text" size="30" name="age"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">����ѧԺ��</TD>
	  <TD align="left"><select name="address"> 
    <%List flist=cb.getCom("select * from bj order by id asc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></TD>
	</TR>
	
    <TR>
      <TD align="center" colspan="2"><INPUT value="ע��" type=submit>&nbsp;&nbsp;
      <INPUT value="��¼" type="button" onclick="window.location.href='login.jsp'"></TD>
	</TR>
	</TBODY>
  </TABLE>
  </FORM>
<%@ include file="iframe/foot.jsp"%>
