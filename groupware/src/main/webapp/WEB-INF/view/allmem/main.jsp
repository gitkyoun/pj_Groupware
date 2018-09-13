<%@ page contentType="text/html; charset=UTF-8"%>
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
	<h3> 사원조회</h3>
	
	
	<%-- --%>
	<table id="tb" style="width: 1000px;"><%-- 테이블 길이 수정 가능 --%>
		<tr>
			<td id="count" colspan="2">
				3개(1/1 페이지)
			</td>
			<td></td><td></td>
		</tr>
		
		<tr class="cf">
			<%-- 구분 폭 수정 가능 --%>
			<td width="50">번호</td>
			<td width="auto" style="text-align: left;">부서</td>
			<td width="190">이름</td>
			<td width="150">직위</td>
			<td width="150">이메일</td>
			<td width="150">전화번호</td>
		</tr>
		
		<tr class="tr">
			<td>1</td>
			<td style="text-align: left;">영업부</td>
			<td>김영균</td>
			<td>사원</td>
			<td>a@a.a</td>
			<td>010-1111-1111</td>
		</tr>
	
	</table>
	<br>
	<div id='paginate'>	<%-- MyUtil.java 안에 있음. ${paging}으로 써야됨. --%>
		<a href="#">처음</a>
		<span class="curBox">1</span>
		<a href="#" class="numBox">2</a>
		<a href="#" class="numBox">3</a>
		<a href="#">다음</a>
	</div>
	
	<div style="text-align:center;">
	
		<select class="selectBox" name="searchKey">				<%-- 선택박스  --%>
			<option value="name">이름</option>
			<option value="department">부서</option>
			<option value="spot">직위</option>
			<option value="tel">휴대전화</option>
		</select>
		
		<input type="text" class="searchBox" name="searchValue">		<%-- 입력창 --%>
		
		<button type="button" class="btn">검색</button>		<%-- 버튼 --%>
		<button type="button" onclick="javascript:location.href='<%=cp%>/allmem/created';">사원추가</button>
	</div>
	
</div>