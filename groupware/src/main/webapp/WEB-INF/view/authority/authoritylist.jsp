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

<script>
function getData(memberNum) {
	var query = "${articleUrl}&memberNum="+memberNum;
	$.ajax({
		type:"get",
		url: query,
		dataType:"json",
		success:function(data) {
			var chk ="";
			var tot ="<form name='authorityForm' id='authorityForm' method='post' enctype='multipart/form-data'>";
			$.each(data, function (idx, val) {	
				data.list.grants=data.authority.grants;
				var aut = ""; //authority
				if (idx == 'authority') {
					aut = "<table border='1' style = 'width:100%; margin-bottom:10px'>";
							aut+= "<tr>";
							aut+= "<td rowspan='2' style='width:130px; height:150px;'>";
							aut+= "<img src=";
							aut+= "'<%=cp%>/upload/member/" +val.saveFilename+ "'";
							aut+= "style='width:130px; height:150px;'>";
							aut+= "</td><td>사원번호</td><td>"+val.memberNum+"</td>";
							aut+="<input type='hidden' name='memberNum' value='"+val.memberNum+"'>";
							aut+= "<td>이름</td><td>"+val.name+"</td></tr>";
							aut+= "<tr><td>부서</td><td>"+val.departmentName+"</td>";
							aut+= "<td>직급</td><td>"+val.positionName+"</td></tr></table>";
					tot+=aut;			
				} 
				
				
				if (idx == 'list') {
					var grants = data.list.grants;
					console.log(grants);
					grants = grants.toString(2);		//10진수를 2진수로 변환			
					var inf = ""; //list
					inf= "<h4>권한설정</h4><br>";
					inf+="<table border='1' style= 'margin-top : 10px; margin-left: 30px; width: 90%;'>";
					for(var i=0; i<val.length; i++){
						inf+= "<tr class='clas'><td class='clas'>"+val[i].comments+"</td>";
						inf+= "<td class='clas'><input type='checkbox' id='auth1"+i+"' name='auth1"+i+"' class='check'>읽기</td>";
						inf+= "<td class='clas'><input type='checkbox' id='auth2"+i+"' name='auth1"+i+"' class='check'>쓰기</td></tr>";
					}
						inf+="<input type='hidden' name='page' value='${page}''>";						
						inf+="<input type='hidden' id = 'grants' name='grants'>";						
					
					inf+= "</table>";
					inf+= "<div style = 'width:95%; margin-top:20px;'><button style='float:right' type='button' id = 'btnsend' onclick='s();'>수정</button></div></form>";
					tot+=inf;
					chk = grants;
					if(grants.length != (val.length*2)){//2진수로 변환시 자리수 맞추기
						var zero="";
						for(var i=0; i<(val.length*2)-chk.length; i++){
							zero +="0";
							}
						chk = zero+chk;
						}						
				};
			});
			
			$("#authority-dialog").html(tot);
			 $("#authority-dialog").dialog({
				height: 700,
				width: 800,
				modal: true,
				open:function() {	
					var k=0;
					for(var i=0; i<(chk.length)/2; i++){		
						if(k<chk.length/2){
						$("#auth1"+i).val(chk.substr(k+k,1));
						$("#auth2"+i).val(chk.substr(k+k+1 ,1));
							if($("#auth1"+i).val() =="1")
								$("#auth1"+i).attr("checked", true);							
							if($("#auth2"+i).val() =='1')
								$("#auth2"+i).attr("checked", true);	
					}					
						k++;
				}
			}
			 
			});
		},
		error:function(jqXHR) {
			console.log(jqXHR.resonseText);
		}
	});

	
}

function s() {
	var f = document.authorityForm;
	var grantsValue = "";
		$(".check").each(function() {
			if (this.checked) { // 수정시 체크박스값 확인하기 
				grantsValue += "1";
			} 
			else{
				grantsValue +="0";
			}
		});		
		grantsValue = parseInt(grantsValue,2);		//10진수로 다시 변환
		$("#grants").val(grantsValue);
	f.action = "<%=cp%>/authority/update";
	f.submit();
}

	
</script>


<div style="clear: both; margin: 10px 0px 15px 10px;">
		<span class="glyphicon glyphicon-book" style="font-size: 28px; margin-left: 10px;"></span>
		<span style="font-size: 30px;">&nbsp;권한 설정</span><br>
		<div style="clear: both; width: 300px; height: 1px; border-bottom: 3px solid black;"></div>
	</div>

<div id="test" style="width:100%; height:600px; ">
	<%-- --%>
	<table id="tb" style="width: 70%;"><%-- 테이블 길이 수정 가능 --%>
		<tr>
			<td id="count" colspan="2">
			</td>
			<td></td><td></td>
		</tr>
		
		<tr class="cf">
			<%-- 구분 폭 수정 가능 --%>			
			<td width="170">사원번호</td>
			<td width="190">부서명</td>
			<td width="190">직급명</td>
			<td width="150">이름</td>
			<td width="auto" style="text-align: center;">비고</td>
		</tr>
	<c:forEach var = "dto" items = "${list}">
		<tr class="tr">
			<td>${dto.memberNum}</td>			
			<td>${dto.departmentName}</td>
			<td>${dto.positionName}</td>
			<td>${dto.name}</td>
			<td><button type="button" id = "authority" onclick="getData('${dto.memberNum}');" style="color: blue;" data-String="${dto.memberNum}">권한설정</button></td>
		</tr>
	</c:forEach>
	</table>
	<br>
	<div id='paginate'>	<%-- MyUtil.java 안에 있음. ${paging}으로 써야됨. --%>
		${paging}		
	</div>
	
	<div style="text-align:center;">
	
		<select class="selectBox">				<%-- 선택박스  --%>
			<option>이름</option>
			<option>부서명</option>
			<option>직급명</option>
		</select>
		<input type="text" class="searchBox">		<%-- 입력창 --%>
		
		<button type="button" class="btn" >검색</button>		<%-- 버튼 --%>
	</div>
</div>
<div id="authority-dialog">
</div>

<div>
<table>
<c:forEach var = "table" items ="${tableList}">
<tr><td>${table.comments}</td></tr>
</c:forEach>
</table>
</div>

