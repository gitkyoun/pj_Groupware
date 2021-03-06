<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String cp=request.getContextPath();
%>


<a href = "<%=cp%>/authority/authoritylist"></a>


<table class="sidetable" border ="1" style="margin-top: 35px;">
		<tr>
			<td rowspan = "5" style="width:90px; height: 99%;">
				<c:if test="${not empty sessionScope.member.saveFilename}">
					<img src = "<%=cp%>/upload/member/${sessionScope.member.saveFilename}" width="110" height = "125">
				</c:if>
				<c:if test="${empty sessionScope.member.saveFilename}">
					<img src = "<%=cp%>/resource/images/no-image-icon.png" width="110" height = "125">
				</c:if>
				</td>
				<c:if test="${not empty sessionScope.member.userId}">
					<td align="center">${sessionScope.member.departmentName}</td>
				</c:if>
				<c:if test="${empty sessionScope.member.userId}">
					<td align="center">부 서</td>
			</c:if>
	
		</tr>
		
		<tr>
			<c:if test="${not empty sessionScope.member.userId}">
			<td align="center">${sessionScope.member.positionName}<br>${sessionScope.member.userName}</td>
			</c:if>
			<c:if test="${empty sessionScope.member.userId}">
			<td align="center">직급<br>이름</td>
			</c:if>
		</tr>								
<tr>
<td align="center">
   <a href = "#"><span class = "glyphicon glyphicon-envelope" aria-hidden="true"></span>(0)</a> <!-- 메일 -->
</td>
</tr>
<tr>
<td align="center">
	<a href = "#"><span class = "glyphicon glyphicon-send" aria-hidden="true"></span>(0)</a><!-- 쪽지 -->
</td>
</tr>
<tr>
<td align="center"><a href="<%=cp%>/member/update?memberNum=${sessionScope.member.userId}">정보 수정</a></td>
</tr>
<tr>
<td align="center"><a onclick="addressBookOpen()" style="cursor: pointer;">주소록</a></td>
<td align="center"><a href="<%=cp%>/member/logout">로그아웃</a></td>
</tr>

</table>

<script type="text/javascript">

function addressBookOpen() {
	var url="<%=cp%>/addressBook/addressBook";
	var specs="width=830, height=560, top=200px, left=500px";
	window.open(url,"addressBook",specs);
}

</script>

