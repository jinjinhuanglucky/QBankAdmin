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
	
	String member=(String)session.getAttribute("member"); 
	if(member==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ String date2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String sjbh=(String)request.getAttribute("sjbh");
		String str=(String)request.getAttribute("str");
		String str2=(String)request.getAttribute("str2");
		String str3=(String)request.getAttribute("str3");
		String str4=(String)request.getAttribute("str4");
		List xzlist=cb.getCom("select * from xzsj where sjbh='"+sjbh+"' order by id asc",9);	
		List pdlist=cb.getCom("select * from pdsj where sjbh='"+sjbh+"' order by id asc",5);		
		List jdlist=cb.getCom("select * from jdsj where sjbh='"+sjbh+"' order by id asc",5);		
		List cxlist=cb.getCom("select * from cxsj where sjbh='"+sjbh+"' order by id asc",5);	
		String ss[]=null;
		String ss2[]=null;
		String ss3[]=null;
		String ss4[]=null;
		try{
		ss=str.split("/");//System.out.println(ss[0]+">>>>>>>>>");
		ss2=str2.split("/");//System.out.println(ss[0]+">>>>>>>>>");
		ss3=str3.split("/");//System.out.println(ss[0]+">>>>>>>>>");
		ss4=str4.split("/");//System.out.println(ss[0]+">>>>>>>>>");
		}catch(Exception e){}
		int xzzfs=0;int xzfs=0;int pdzfs=0;int pddf=0;
		
		float one_xzfs=cb.getFloat("select xzfs from sj where sjbh='"+sjbh+"'");
		int sum_xz=cb.getCount("select xzsl from sj where sjbh='"+sjbh+"'");
		float one_pdfs=cb.getFloat("select pdfs from sj where sjbh='"+sjbh+"'");
		int sum_pd=cb.getCount("select pdsl from sj where sjbh='"+sjbh+"'");
		
		float one_jdfs=cb.getFloat("select jdfs from sj where sjbh='"+sjbh+"'");
		int sum_jd=cb.getCount("select jdsl from sj where sjbh='"+sjbh+"'");
		
		float one_cxfs=cb.getFloat("select cxfs from sj where sjbh='"+sjbh+"'");
		int sum_cx=cb.getCount("select cxsl from sj where sjbh='"+sjbh+"'");
%>
 
 
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody> 
    <tr>
      <th class="bg_tr" align="left" colspan="12" height="25">
      �Ծ����ƣ�<FONT color=red><%=cb.getString("select mc from sj where sjbh='"+sjbh+"'") %></FONT>
      �Ծ��ţ�<FONT color=red><%=sjbh %></FONT></th>
    </tr>
    <tr>
      <td class="td_bg" colspan="12" height="23" align=left>ѡ���⣨��<%=sum_xz %>�⣬ÿ��<%=one_xzfs %>�֣�</td>
    </tr> 
    <tr > 
      <td class="td_bg"  width="5%" align="center">ID</td>
      <td  class="td_bg"  align="center">��������</td> 
      <td  class="td_bg"  align="center">��</td>   
      <td class="td_bg"   align="center">��ȷ��</td> 
      <td class="td_bg"   align="center">���Ĵ�</td>  
    </tr>
    <%if(!xzlist.isEmpty()){
    for(int i=0;i<xzlist.size();i++){
    List list2=(List)xzlist.get(i); 
					if(ss[i+1].equals(list2.get(6).toString())){
					xzfs+=one_xzfs;}
    %>
    <tr>
      <td align="center"  class="td_bg" ><%=i+1 %></td>
      <td align="center"  class="td_bg" ><%=list2.get(1).toString() %></td>
      <td align="center"  class="td_bg" >A:<%=list2.get(2).toString() %> B:<%=list2.get(3).toString() %> C:<%=list2.get(4).toString() %> D:<%=list2.get(5).toString() %></td> 
      <td align="center"  class="td_bg" ><%=list2.get(6).toString() %></td>
      <td align="center"  class="td_bg" ><%=ss[i+1] %></td> 
    </tr> 
     
    <%}} %>
    <tr>
      <td class="td_bg" colspan="12" height="23" align=center>ѡ�����ܷ�����<%=one_xzfs*sum_xz %> �� ���ĵ÷֣�<%=xzfs %> ��</td>
    </tr> 
    
    <tr>
      <td class="td_bg" colspan="12" height="23" align=left>�ж��⣨��<%=sum_pd %>�⣬ÿ��<%=one_pdfs %>�֣�</td>
    </tr> 
    <tr > 
      <td class="td_bg"  width="5%" align="center">ID</td>
      <td  class="td_bg"  align="center">��������</td> 
      <td  class="td_bg"  align="center">��ȷ��</td>   
      <td class="td_bg" colspan=2  align="center">���Ĵ�</td> 
    </tr>
    <%if(!pdlist.isEmpty()){
    for(int i=0;i<pdlist.size();i++){
    List list2=(List)pdlist.get(i); 
					if(ss2[i+1].equals(list2.get(2).toString())){
					pddf+=one_pdfs;}
    %>
    <tr>
      <td align="center"  class="td_bg" ><%=i+1 %></td>
      <td align="center"  class="td_bg" ><%=list2.get(1).toString() %></td>
      <td align="center"  class="td_bg" ><%=list2.get(2).toString() %></td> 
      <td align="center" colspan=2 class="td_bg" ><%=ss2[i+1] %></td>
    </tr> 
     
    <%}} %>
    <tr>
      <td class="td_bg" colspan="12" height="23" align=center>�ж��ܷ�����<%=one_pdfs*sum_pd %> �� ���ĵ÷֣�<%=pddf %> ��</td>
    </tr> 
    
    
    <tr>
      <td class="td_bg" colspan="12" height="23" align=left>����⣨��<%=one_jdfs %>�⣬ÿ��<%=one_jdfs %>�֣�</td>
    </tr> 
    <tr > 
      <td class="td_bg"  width="5%" align="center">ID</td>
      <td  class="td_bg"  align="center">��������</td>  
      <td  class="td_bg"  align="center">��ȷ��</td>  
      <td class="td_bg" colspan=2  align="center">���Ĵ�</td> 
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
      <td class="td_bg" colspan="12" height="23" align=center>����⽫�ɽ�ʦ�ֹ��ľ�</td>
    </tr> 
    
    
        <tr>
      <td class="td_bg" colspan="12" height="23" align=left>����⣨��<%=one_cxfs %>�⣬ÿ��<%=one_cxfs %>�֣�</td>
    </tr> 
    <tr > 
      <td class="td_bg"  width="5%" align="center">ID</td>
      <td  class="td_bg"  align="center">��������</td>  
      <td  class="td_bg"  align="center">��ȷ��</td>  
      <td class="td_bg" colspan=2  align="center">���Ĵ�</td> 
    </tr>
    <%if(!cxlist.isEmpty()){
    for(int i=0;i<cxlist.size();i++){
    List list2=(List)cxlist.get(i);  
    %>
    <tr>
      <td align="center"  class="td_bg" ><%=i+1 %></td>
      <td align="center"  class="td_bg" ><%=list2.get(1).toString() %></td>
      <td align="center"  class="td_bg" ><%=list2.get(2).toString() %></td> 
      <td align="center" colspan=2 class="td_bg" ><%=ss4[i+1] %></td>
    </tr> 
     
    <%}} %>
    <tr>
      <td class="td_bg" colspan="12" height="23" align=center>����⽫�ɽ�ʦ�ֹ��ľ�</td>
    </tr> 
  </tbody>
</table>
 
<%cb.comUp("insert into cj(sjbh,xzfs,pdfs,member,sj) values('"+sjbh+"','"+xzfs+"','"+pddf+"','"+member+"','"+date2+"' )");
cb.comUp("insert into jdda(sjbh,member,jdda) values('"+sjbh+"','"+member+"','"+str3+"' )"); 
cb.comUp("insert into cxda(sjbh,member,cxda) values('"+sjbh+"','"+member+"','"+str4+"' )");%>
 
<%} %>
