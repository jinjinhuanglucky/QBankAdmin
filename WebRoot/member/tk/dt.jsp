<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>��Ա��������</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>member/images/css1/css.css" rel="stylesheet" type="text/css"> 
<script language="javascript">
setTimeout("show_time()",1000);
function show_time()
{
    var time_distance,str_time;
    var int_day,int_hour,int_minute,int_second;
    var time_now=new Date();
    time_now=time_now.getTime();   //ȡϵͳ����ʱ��

    time_distance=form1.time_end.value-time_now;
    //ʱ������timeForm.time_end.value�� �ĵ���ʱ��
    if(time_distance>0)
    {
       //ȡ�����ʱ����졢Сʱ����,java��ʱ�任�ɺ����ǰ���1000*60*60*24�����Ļ��㷽ʽת��
        int_day=Math.floor(time_distance/86400000)
       time_distance-=int_day*86400000;
       int_hour=Math.floor(time_distance/3600000)
       time_distance-=int_hour*3600000;
       int_minute=Math.floor(time_distance/60000)
       time_distance-=int_minute*60000;
       int_second=Math.floor(time_distance/1000)
      
       if(int_hour<10)
       int_hour="0"+int_hour;
       if(int_minute<10)
       int_minute="0"+int_minute;
       if(int_second<10)
       int_second="0"+int_second;
       str_time="<font size='3' color='red' face='����'><b>"+int_hour+":"+int_minute+":"+int_second+"</b></font>";
       timer.innerHTML=str_time;
       setTimeout("show_time()",1000); //ѭ������
     }else
     {
       timer.innerHTML ="<font size='3' color='red' face='����'>ʱ���ѵ�</font>";document.getElementById("btn").disabled=true;
       form1.submit();
       clearTimeout(timerID)
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
	
	 
	String sjid=request.getParameter("sjid"); 
	List sjlist=cb.get1Com("select * from sj where id='"+sjid+"'",11); 
	String sjbh=sjlist.get(10).toString();
	String xzsl=sjlist.get(2).toString();
	String xzfs=sjlist.get(3).toString();
	String pdsl=sjlist.get(4).toString();
	String pdfs=sjlist.get(5).toString();
	String jdsl=sjlist.get(6).toString();
	String jdfs=sjlist.get(7).toString();
	String cxsl=sjlist.get(8).toString();
	String cxfs=sjlist.get(9).toString();
	List xzlist=cb.getCom("select * from xzsj where sjbh='"+sjbh+"' order by id asc",8);
	List pdlist=cb.getCom("select * from pdsj where sjbh='"+sjbh+"' order by id asc",4);
	List jdlist=cb.getCom("select * from jdsj where sjbh='"+sjbh+"' order by id asc",4);
	List cxlist=cb.getCom("select * from cxsj where sjbh='"+sjbh+"' order by id asc",4);
	int sss=30*60*1000;
	long sgs=System.currentTimeMillis()+sss;
%>
<body>
<form action="<%=basePath %>ComServlet?method=dt&sjbh=<%=sjbh%>" method="post" name="form1">
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0"> 
    <tr> 
      <th class="bg_tr" align="left" colspan="2" height="25">�Ծ����ƣ�<FONT color=red><%=sjlist.get(1).toString() %> </FONT></th>
    </tr> 
     <tr><input type="hidden" name="time_end" value="<%=sgs %>">
      <th class="bg_tr" align="left" colspan="2" height="25">ʣ��ʱ�䣺<div id="timer"></div></th>
    </tr> 
</table>
<%if(xzlist.isEmpty()||pdlist.isEmpty()||jdlist.isEmpty()||cxlist.isEmpty()){out.println("���ⲻȫ���ݲ��ܿ��ԣ�");}else{ %>

<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody> 
  <tr>
      <th class="bg_tr" align="left" colspan="2" height="25"> ѡ���⣨��<%=xzsl %>�⣬ÿ��<%=xzfs %>�֣�</th>
  </tr>   
<%for(int i=0;i<xzlist.size();i++){List list2=(List)xzlist.get(i);%> 
    <tr>
      <td class="td_bg" height="23" align=left><%=i+1 %> <%=list2.get(1).toString() %> </td> 
    </tr> 
    <tr>
      <td class="td_bg" height="23" align=left><font color=#000000>
      A��<%=list2.get(2).toString() %> B��<%=list2.get(3).toString() %> C��<%=list2.get(4).toString() %> D��<%=list2.get(5).toString() %></font></td> 
    </tr> 
    <tr>
      <td class="td_bg" height="23" align=left>�𰸣�<select name="xzda<%=list2.get(0).toString()%>">
			<option value="A">A</option> 
			<option value="B">B</option> 
			<option value="C">C</option> 
			<option value="D">D</option> 
			</select></td> 
    </tr>
 <%} %> 
   <tr>
      <th class="bg_tr" align="left" colspan="2" height="25"> �ж��⣨��<%=pdsl %>�⣬ÿ��<%=pdfs %>�֣�</th>
  </tr>   
<%for(int i=0;i<pdlist.size();i++){List list2=(List)pdlist.get(i);%> 
    <tr>
      <td class="td_bg" height="23" align=left><%=i+1 %> <%=list2.get(1).toString() %> </td> 
    </tr>  
    <tr>
      <td class="td_bg" height="23" align=left>�𰸣�
			<input type=radio name="pdda<%=list2.get(0).toString()%>" value="��ȷ" checked> ��ȷ
			<input type=radio name="pdda<%=list2.get(0).toString()%>" value="����"> ����
			</td> 
    </tr>
 <%} %>  
  <tr>
      <th class="bg_tr" align="left" colspan="2" height="25"> ����⣨��<%=jdsl %>�⣬ÿ��<%=jdfs %>�֣�</th>
  </tr>   
<%for(int i=0;i<jdlist.size();i++){List list2=(List)jdlist.get(i);%> 
    <tr>
      <td class="td_bg" height="23" align=left><%=i+1 %> <%=list2.get(1).toString() %> </td> 
    </tr>  
    <tr>
      <td class="td_bg" height="23" align=left>�𰸣�<textarea name="jdda<%=list2.get(0).toString()%>" cols=50 rows=8></textarea></td> 
    </tr>
 <%} %>
  <tr>
      <th class="bg_tr" align="left" colspan="2" height="25"> ����⣨��<%=cxsl %>�⣬ÿ��<%=cxfs %>�֣�</th>
  </tr>   
<%for(int i=0;i<cxlist.size();i++){List list2=(List)cxlist.get(i);%> 
    <tr>
      <td class="td_bg" height="23" align=left><%=i+1 %> <%=list2.get(1).toString() %> </td> 
    </tr>  
    <tr>
      <td class="td_bg" height="23" align=left>�𰸣�<textarea name="cxda<%=list2.get(0).toString()%>" cols=50 rows=8></textarea></td> 
    </tr>
 <%} %>            
    <tr>
      <td class="td_bg" colspan="2" height="23" align=center> 
      <input id="btn" type="submit" value="�ύ�Ծ�"  onclick="if (confirm('ȷ���ύ��')) return true; else return false;"></td>
    </tr> 
  </tbody>
</table>
</form>
<%} %>

</body>
 
