<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div>
<table>
<tr>
<td>����</td>
<td colspan="2">${dto.subject}</td>
<td>�ۼ���</td>
<td colspan="2">${dto.name}</td>
</tr>
</table>
</div>

<table style="width: 500px;" border="2">
<tr>
<td colspan = "5" rowspan = "2">���� ���� ����</td>
<td>�ۼ�</td>
<td>����</td>
<td>����</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
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
<td colspan = "4">���� ��������</td>
<td colspan = "4">���� ��������</td>
</tr>
<tr>
<td colspan = "4">
<textarea rows="20" cols="35">
${dto.todayWork}
</textarea>
</td>
<td colspan = "4">
<textarea rows="20" cols="35">
${dto.nextdayWork}
</textarea>
</td>
</tr>
<tr>
<td colspan = "8" rowspan = "2">
<textarea rows="5" cols="75">
���
${dto.memo }
</textarea>
</td>
</tr>
</table>
