<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
#paginate{clear:both;text-align:center;height:28px;white-space:nowrap;}
#paginate a {border:1px solid #ccc;height:28px;color:#000000;text-decoration:none;padding:4px 7px 4px 7px;margin-left:3px;line-height:normal;vertical-align:middle;outline:none;}
#paginate a:hover, a:active {border:1px solid #147FCC;color:#0174DF;vertical-align:middle;line-height:normal;}
#paginate .curBox{border:1px solid #424242; background: #4e4e4e; color:#ffffff; font-weight:bold;height:28px;padding:4px 8px 4px 8px;margin-left:3px;line-height:normal;vertical-align:middle;}
#paginate .numBox {border:1px solid #ccc;height:28px;text-decoration:none;padding:4px 7px 4px 7px;margin-left:3px;line-height:normal;vertical-align:middle;}
</style>

<div id="test" style="width:100%; height:600px; ">
	
	<%-- --%>
	<table id="tb" style="width: 1000px;"><%-- ���̺� ���� ���� ���� --%>
		<tr>
			<td id="count" colspan="2">
				3��(1/1 ������)
			</td>
			<td></td><td></td>
		</tr>
		
		<tr class="cf">
			<%-- ���� �� ���� ���� --%>
			<td width="170">��ȣ</td>
			<td width="auto" style="text-align: left;">����</td>
			<td width="190">����</td>
			<td width="150">�����</td>
		</tr>
		
		<tr class="tr">
			<td>�׸�1</td>
			<td style="text-align: left;">1</td>
			<td>2</td>
			<td>3</td>
		</tr>
		<tr class="tr">
			<td>�׸�2</td>
			<td style="text-align: left;">1</td>
			<td>2</td>
			<td>3</td>
		</tr>
		<tr class="tr">
			<td>�׸�3</td>
			<td style="text-align: left;">1</td>
			<td>2</td>
			<td>3</td>
		</tr>
	</table>
	<br>
	<div id='paginate'>	<%-- MyUtil.java �ȿ� ����. ${paging}���� ��ߵ�. --%>
		<a href="#">ó��</a>
		<span class="curBox">1</span>
		<a href="#" class="numBox">2</a>
		<a href="#" class="numBox">3</a>
		<a href="#">����</a>
	</div>
	
	<div style="text-align:center;">
	
		<select class="selectBox">				<%-- ���ùڽ�  --%>
			<option>�׽�Ʈ �ɼ�1</option>
			<option>�׽�Ʈ �ɼ�2</option>
		</select>
		
		<input type="text" class="searchBox">		<%-- �Է�â --%>
		
		<button type="button" class="btn">�˻�</button>		<%-- ��ư --%>
	</div>
	
</div>