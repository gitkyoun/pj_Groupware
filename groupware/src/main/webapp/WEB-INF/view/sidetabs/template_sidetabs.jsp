<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>


</style>

<div class="tabsTop"><button class="sideBtn">테스트 버튼</button></div>

<table class="tabs">
	<tr>
    	<th>테스트 사이드 탭1</th>
    </tr>
    <tr>
    	<td><a href="#">메뉴1</a></td>
    </tr>
    <tr>
    	<td><a href="#">메뉴2 ( 0 | 0 )</a></td>
    </tr>
    <tr>
    	<td><a href="#">메뉴3 (0)</a></td>
    </tr>
	<tr>
    	<th>테스트 사이드 탭2</th>
    </tr>
    <tr>
    	<td><a href="#">메뉴1</a></td>
    </tr>
    <tr>
    	<td><a href="#">메뉴2</a></td>
    </tr>
</table>