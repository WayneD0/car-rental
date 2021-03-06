<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">

table.table-hover tbody tr.huhuo-item-selected {
    background-color: #5D89F8;
	color: #FFF;
}


</style>
<table id="pageGridId" class="table table-hover table-condensed">
	<thead>
		<tr>
			<th><input type="checkbox" class="checkbox"></th>
			<th>序号</th>
			<th>图片</th>
			<th>车型名称</th>
			<th>类别</th>
			<th>座位数</th>
			<th>油箱容量（单位：升）</th>
			<th>可行驶里程数</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${records }" var="record">
		<tr>
			<td><input type="checkbox" class="checkbox"></td>
			<td>${record.id}</td>
			<td>
				<a href="javascript:void(0)" class="thumbnail">
					<img class="img-rounded" style="height: 100px; width: 150px;" src="${record.icon.url}">
				</a>
			</td>
			<td>${record.name}</td>
			<td>${record.categoryDict.disp}</td>
			<td class="number">${record.seating}</td>
			<td class="digit">${record.tankCapacity}</td>
			<td class="digit">${record.drivingRange}</td>
			<td>
				<div class="btn-group">
					<button name="detail" class="btn">查看详情</button>
					<button name="edit" class="btn">修改</button>
				</div>
			</td>
		</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<!-- style="position:fixed;top:150px;left:1100px" -->
		<tr>
			<td colspan="9">
				<div class="pagination pagination-centered" style="margin-bottom: 0px;"></div>
			</td>
		</tr>
	</tfoot>
</table>

<script type="text/javascript">
$(document).ready(function() {
	// number output format
	$('.number').formatNumber({format:'#,###', local:'cn'});
	$('.digit').formatNumber({format:'#,###.##', local:'cn'});
	// 绑定标签元素。设置当前页，页面数据条数，总数，要访问的url，对应的参数，点击标签时刷新的div，标签数
	var page = JSON.parse('${page}');
	var t = JSON.parse('${t}');
	$(".pagination").myPage(page, '${path }/cmcar/cartype/condition/get.do', t, $("#pagediv"), 5);
	// add select css
	$('#pageGridId tbody tr').click(function(event) {
		$(this).toggleClass('huhuo-item-selected');
		if ($(event.target).attr("type") != "checkbox") {
			$(this).find(':checkbox')[0].checked = !$(this).find(':checkbox')[0].checked;
		}
	});
	// add select event
	$('#pageGridId thead tr :checkbox').click(function(event) {
		$('#pageGridId tbody :checkbox').each(function(index, element) {
			element.checked = $('#pageGridId thead tr :checkbox')[0].checked;
			if(element.checked) {
				$('#pageGridId tbody tr').addClass('huhuo-item-selected');
			} else {
				$('#pageGridId tbody tr').removeClass('huhuo-item-selected');
			}
		});
	});
	// add event to edit button
	$('#pageGridId tbody button[name="detail"]').click(function(event) {
		var selectedId = $(this).parent().parent().parent().children().slice(1, 2).text();
		$("#editDivId").load('${path}/cmcar/cartype/detail.do', {
			id: selectedId
		}, function(resp, status, xhReq) {
			$("#mgrDivId").hide();
			$("#editDivId").show(500);
		});
	});
	$('#pageGridId tbody button[name="edit"]').click(function(event) {
		var selectedId = $(this).parent().parent().parent().children().slice(1, 2).text();
		$("#editDivId").load('${path}/cmcar/cartype/edit-ui.do', {
			id: selectedId
		}, function(resp, status, xhReq) {
			$("#mgrDivId").hide();
			$("#editDivId").show(500);
		});
	});
});
</script>
