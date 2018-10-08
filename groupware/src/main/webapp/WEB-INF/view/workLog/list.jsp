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

<script type="text/javascript">

/*
$(function() {
	$("#article").click(function() {
		var workLogNum = $(this).data("num");
		var query = "${articleUrl}&workLogNum="+workLogNum; 
		$.ajax({
			type:"get",
			url: query,
			dataType:"json",
			success:function(data) {
				console.log(data.dto.content);
				$("#article-dialog").html(data.dto.content);
				 $("#article-dialog").dialog({
					height: 700,
					width: 800,
					modal: true
					
				});
			},
			error:function(jqXHR) {
				console.log(jqXHR.resonseText);
			}
		});
	});
});
*/

function getData(workLogNum) {
	
	var query = "${articleUrl}&workLogNum="+workLogNum; 
	$.ajax({
		type:"get",
		url: query,
		dataType:"json",
		success:function(data) {
			console.log(data.dto.content);
			$("#article-dialog").html(data.dto.content);
			 $("#article-dialog").dialog({
				height: 700,
				width: 800,
				modal: true
				
			});
		},
		error:function(jqXHR) {
			console.log(jqXHR.resonseText);
		}
	});
}
</script>



<div style="clear: both; margin: 10px 0px 15px 10px;">
		<span class="glyphicon glyphicon-book" style="font-size: 28px; margin-left: 10px;"></span>
		<span style="font-size: 30px;">&nbsp;���� ����</span><br>
		<div style="clear: both; width: 300px; height: 1px; border-bottom: 3px solid black;"></div>
	</div>

<div id="test" style="width:100%; height:600px; ">
	<%-- --%>
	<table id="tb" style="width: 70%;"><%-- ���̺� ���� ���� ���� --%>
		<tr>
			<td id="count" colspan="2">
				3��(1/1 ������)
			</td>
			<td></td><td></td>
		</tr>
		
		<tr class="cf">
			<%-- ���� �� ���� ���� --%>
			<td width="170">��ȣ</td>
			<td width="190">�μ���</td>
			<td width="auto" style="text-align: center;">��������</td>
			<td width="150">������������</td>
		</tr>
	<c:forEach var = "dto" items = "${list}">
		<tr class="tr">
			<td>${dto.listNum}</td>
			<td>${dto.departmentName}</td>		
			<td>${dto.grants}</td>	
			<td  style="text-align: center;"><span onclick="getData('${dto.workLogNum}');" style="color: blue;" data-num="${dto.workLogNum}">${dto.makeDate}${sessionScope.member.userName}</span></td>
			<td>
				<c:if test="${dto.num =='1'}">���Ͼ���</c:if>
				<c:if test="${dto.num =='2'}">�ְ�����</c:if>
				<c:if test="${dto.num =='3'}">��������</c:if>
			</td>
		</tr>
	</c:forEach>
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
			<option>����</option>
			<option>�����</option>
		</select>
		<input type="text" class="searchBox">		<%-- �Է�â --%>
		
		<button type="button" class="btn">�˻�</button>		<%-- ��ư --%>
	</div>
</div>

<div id= "article-dialog">
</div>