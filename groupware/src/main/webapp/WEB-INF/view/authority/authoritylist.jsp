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
		console.log(query);
	$.ajax({
		type:"get",
		url: query,
		dataType:"json",
		success:function(data) {
			var chk = 0;
			var modify ="";
			var tot ="<form name='authorityForm' id='authorityForm' method='post' enctype='multipart/form-data'>";
			$.each(data, function (idx, val) {	
				data.list.grants=data.authority.grants
				var aut = ""; //authority
				if (idx == 'authority') {
					aut = "<table style = 'width:100%; border: 1px;'>";
							aut+= "<tr>";
							aut+= "<td rowspan='2' style='width:130px; height:150px;'>";
							aut+= "<img src=";
							aut+= "'<%=cp%>/upload/member/" +val.saveFileName+ "'";
							aut+= "style='width:130px; height:150px;'>";
							aut+= "</td><td>�����ȣ</td><td>"+val.memberNum+"</td>";
							aut+="<input type='hidden' name='memberNum' value='"+val.memberNum+"'>";
							aut+= "<td>�̸�</td><td>"+val.name+"</td></tr>";
							aut+= "<tr><td>�μ�</td><td>"+val.departmentName+"</td>";
							aut+= "<td>����</td><td>"+val.positionName+"</td></tr></table>";
					tot+=aut;			
				} 
				
				
				if (idx == 'list') {
					var grants = data.list.grants;
					var inf = ""; //list
					inf ="<table style='width: 70%;'>";
					inf+= "<td style='border-bottom:1px;'>����</td>";
				
					for(var i=0; i<val.length; i++){
						inf+= "<tr><td>"+val[i].comments+"</td>";
						inf+= "<td><input type='checkbox' id='auth1"+i+"' name='auth1"+i+"' class='check'>�б�</td>";
						inf+= "<td><input type='checkbox' id='auth2"+i+"' name='auth1"+i+"' class='check'>����</td></tr>";
					}
						inf+="<input type='hidden' name='page' value='${page}''>";						
						inf+="<input type='hidden' id = 'grants' name='grants'>";						
					
					inf+= "</table><button type='button' id = 'btnsend' onclick='s();'>����</button></form>";
					tot+=inf;
					chk = grants;
				};
			});
			
			$("#authority-dialog").html(tot);
			 $("#authority-dialog").dialog({
				height: 700,
				width: 800,
				modal: true,
				open:function() {	
					chk= String(chk);
					for(var i=0; i<chk.length; i++){						
						$("#auth1"+i).val(chk.substr(i,1));
						$("#auth2"+i).val(chk.substr(i + 1 ,1));
							if($("#auth1"+i).val() =="1"){
								$("#auth1"+i).attr("checked", true);
							}else{
								$("#auth1"+i).val() =='0';
							}
							if($("#auth2"+i).val() =='1'){
								$("#auth2"+i).attr("checked", true);	
							}else{
								$("#auth1"+i).val() =='0';
							}
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
			if (this.checked) {
				grantsValue += "1";
			} 
			else{
				grantsValue +="0";
			}
		});
		$("#grants").val(grantsValue);
	f.action = "<%=cp%>/authority/update";
	f.submit();
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
			<td width="170">�����ȣ</td>
			<td width="190">�μ���</td>
			<td width="190">���޸�</td>
			<td width="150">�̸�</td>
			<td width="auto" style="text-align: center;">���</td>
		</tr>
	<c:forEach var = "dto" items = "${list}">
		<tr class="tr">
			<td>${dto.memberNum}</td>			
			<td>${dto.departmentName}</td>
			<td>${dto.positionName}</td>
			<td>${dto.name}</td>
			<td><button type="button" id = "authority" onclick="getData('${dto.memberNum}');" style="color: blue;" data-String="${dto.memberNum}">���Ѽ���</button></td>
		</tr>
	</c:forEach>
	</table>
	<br>
	<div id='paginate'>	<%-- MyUtil.java �ȿ� ����. ${paging}���� ��ߵ�. --%>
		${paging}		
	</div>
	
	<div style="text-align:center;">
	
		<select class="selectBox">				<%-- ���ùڽ�  --%>
			<option>�̸�</option>
			<option>�μ���</option>
			<option>���޸�</option>
		</select>
		<input type="text" class="searchBox">		<%-- �Է�â --%>
		
		<button type="button" class="btn" >�˻�</button>		<%-- ��ư --%>
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

