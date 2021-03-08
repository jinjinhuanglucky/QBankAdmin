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
<script language="javascript">
setTimeout("show_time()",1000);
function show_time()
{
    var time_distance,str_time;
    var int_day,int_hour,int_minute,int_second;
    var time_now=new Date();
    time_now=time_now.getTime();   //取系统现在时间

    time_distance=form1.time_end.value-time_now;
    //时间间隔。timeForm.time_end.value是 的到期时间
    if(time_distance>0)
    {
       //取出间隔时间的天、小时、分,java中时间换成毫秒是按照1000*60*60*24这样的换算方式转的
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
       str_time="<font size='3' color='red' face='黑体'><b>"+int_hour+":"+int_minute+":"+int_second+"</b></font>";
       timer.innerHTML=str_time;
       setTimeout("show_time()",1000); //循环调用
     }else
     {
       timer.innerHTML ="<font size='3' color='red' face='黑体'>时间已到</font>";document.getElementById("btn").disabled=true;
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
      <th class="bg_tr" align="left" colspan="2" height="25">试卷名称：<FONT color=red><%=sjlist.get(1).toString() %> </FONT></th>
    </tr> 
     <tr><input type="hidden" name="time_end" value="<%=sgs %>">
      <th class="bg_tr" align="left" colspan="2" height="25">剩余时间：<div id="timer"></div></th>
    </tr> 
</table>
<%if(xzlist.isEmpty()||pdlist.isEmpty()||jdlist.isEmpty()||cxlist.isEmpty()){out.println("试题不全，暂不能考试！");}else{ %>

<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody> 
  <tr>
      <th class="bg_tr" align="left" colspan="2" height="25"> 选择题（共<%=xzsl %>题，每题<%=xzfs %>分）</th>
  </tr>   
<%for(int i=0;i<xzlist.size();i++){List list2=(List)xzlist.get(i);%> 
    <tr>
      <td class="td_bg" height="23" align=left><%=i+1 %> <%=list2.get(1).toString() %> </td> 
    </tr> 
    <tr>
      <td class="td_bg" height="23" align=left><font color=#000000>
      A：<%=list2.get(2).toString() %> B：<%=list2.get(3).toString() %> C：<%=list2.get(4).toString() %> D：<%=list2.get(5).toString() %></font></td> 
    </tr> 
    <tr>
      <td class="td_bg" height="23" align=left>答案：<select name="xzda<%=list2.get(0).toString()%>">
			<option value="A">A</option> 
			<option value="B">B</option> 
			<option value="C">C</option> 
			<option value="D">D</option> 
			</select></td> 
    </tr>
 <%} %> 
   <tr>
      <th class="bg_tr" align="left" colspan="2" height="25"> 判断题（共<%=pdsl %>题，每题<%=pdfs %>分）</th>
  </tr>   
<%for(int i=0;i<pdlist.size();i++){List list2=(List)pdlist.get(i);%> 
    <tr>
      <td class="td_bg" height="23" align=left><%=i+1 %> <%=list2.get(1).toString() %> </td> 
    </tr>  
    <tr>
      <td class="td_bg" height="23" align=left>答案：
			<input type=radio name="pdda<%=list2.get(0).toString()%>" value="正确" checked> 正确
			<input type=radio name="pdda<%=list2.get(0).toString()%>" value="错误"> 错误
			</td> 
    </tr>
 <%} %>  
  <tr>
      <th class="bg_tr" align="left" colspan="2" height="25"> 填空题（共<%=jdsl %>题，每题<%=jdfs %>分）</th>
  </tr>   
<%for(int i=0;i<jdlist.size();i++){List list2=(List)jdlist.get(i);%> 
    <tr>
      <td class="td_bg" height="23" align=left><%=i+1 %> <%=list2.get(1).toString() %> </td> 
    </tr>  
    <tr>
      <td class="td_bg" height="23" align=left>答案：<textarea name="jdda<%=list2.get(0).toString()%>" cols=50 rows=8></textarea></td> 
    </tr>
 <%} %>
  <tr>
      <th class="bg_tr" align="left" colspan="2" height="25"> 简答题（共<%=cxsl %>题，每题<%=cxfs %>分）</th>
  </tr>   
<%for(int i=0;i<cxlist.size();i++){List list2=(List)cxlist.get(i);%> 
    <tr>
      <td class="td_bg" height="23" align=left><%=i+1 %> <%=list2.get(1).toString() %> </td> 
    </tr>  
    <tr>
      <td class="td_bg" height="23" align=left>答案：<textarea name="cxda<%=list2.get(0).toString()%>" cols=50 rows=8></textarea></td> 
    </tr>
 <%} %>            
    <tr>
      <td class="td_bg" colspan="2" height="23" align=center> 
      <input id="btn" type="submit" value="提交试卷"  onclick="if (confirm('确定提交吗？')) return true; else return false;"></td>
    </tr> 
  </tbody>
</table>
</form>
<%} %>

</body>
 
