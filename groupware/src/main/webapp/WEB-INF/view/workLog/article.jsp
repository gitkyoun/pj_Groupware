<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
textarea {
	overflow: none;
	resize: none;
	border: none;
}
.worktable tr{
	height:20px;
	font-size: 15px;
	
}
.worktable td{
	min-height: 30px;
	
}

</style>

<%-- ��� ��ǥ�۾� --%>
	<div style="clear: both; margin: 10px 0px 15px 10px;">
		<span class="glyphicon glyphicon-book" style="font-size: 28px; margin-left: 10px;"></span>
		<span style="font-size: 30px;">&nbsp;���� ����</span><br>
		<div style="clear: both; width: 300px; height: 1px; border-bottom: 3px solid black;"></div>
	</div>
<div style="width:100%; height:100%; margin-left: 50px;">	
<table style="width: 70%; height: 100%" border="1" class="worktable">
<tr>
<td colspan = "5" rowspan = "3" style="font-size: 25px;">���� ���� ����</td>
<td height="30px" style="background-color: bisque">�ۼ�</td>
<td height="30px" style="background-color: bisque">����</td>
<td height="30px" style="background-color: bisque">����</td>
</tr>
<tr>
<td height="40px" rowspan = "2">&nbsp;</td>
<td height="40px" rowspan = "2">&nbsp;</td>
<td height="40px" rowspan = "2">&nbsp;</td>
</tr>
<tr>
</tr>
<tr>
<td>�����ȣ</td>
<td colspan = "3"> 0000-abc-${dto.workLogNum}</td>
<td>�ۼ�����</td>
<td colspan = "3"> ${dto.makeDate}</td>
</tr>
<tr>
<td>�μ���</td>
<td colspan = "3">${dto.departmentName}</td>
<td>�ۼ���</td>
<td colspan = "3">${dto.name}</td>
</tr>
<tr>
<td>����</td>
<td colspan = "7">${dto.subject}</td>
</tr>
<tr>
<td colspan = "4" height="50px" style="background-color: bisque">���� ��������</td>
<td colspan = "4" height="50px" style="background-color: bisque">���� ��������</td>
</tr>
<tr>
<td colspan = "4">
<textarea rows="23" cols="67" disabled="disabled" style="background-color: white">
${dto.todayWork}
</textarea>
</td>
<td colspan = "4">
<textarea rows="23" cols="67" disabled="disabled" style="background-color: white">
${dto.nextdayWork}
</textarea>
</td>
</tr>
<tr>
<td colspan = "8" rowspan = "2" >
<textarea rows="5" cols="140" style="background-color: white">
���
${dto.memo }
</textarea>
</td>
</tr>
</table>
</div>