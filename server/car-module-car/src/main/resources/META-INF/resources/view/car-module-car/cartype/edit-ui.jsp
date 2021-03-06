<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row-fluid">
	<div class="span6">
		<form id="editForm" class="form-horizontal" action="${path}/cmcar/cartype/update.do">
			<input type="hidden" name="id" value="${carType.id }">
			<div class="control-group">
				<label class="control-label" for="inputName">车型名称</label>
				<div class="controls">
					<input type="text" class="required" id="inputName" name="name" placeholder="车型名称..." value="${carType.name }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="selectCategory">车辆类别</label>
				<div class="controls">
					<select id="selectCategory" name="category">
					<c:forEach items="${carTypeCategoryList }" var="category">
					<c:choose>
					<c:when test="${category.key == carType.category }">
						<option value="${category.key }" selected="selected">${category.disp }</option>
					</c:when>
					<c:otherwise>
						<option value="${category.key }">${category.disp }</option>
					</c:otherwise>
					</c:choose>
					</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputSeating">座位数</label>
				<div class="controls">
					<input type="number" class="required digits" id="inputSeating" name="seating" placeholder="座位数..." value="${carType.seating }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputTankCapacity">油箱容量</label>
				<div class="controls">
					<input type="number" class="required digits" id="inputTankCapacity" name="tankCapacity" placeholder="油箱容量（单位：升）..." value="${carType.tankCapacity }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputDrivingRange">可行驶里程数</label>
				<div class="controls">
					<input type="number" class="required number" id="inputDrivingRange" name="drivingRange" placeholder="可行驶里程数（单位：公里）..." value="${carType.drivingRange }">
				</div>
			</div>
			<!-- charge standard -->
			<input type="hidden" name="chargeStandard.id" value="${carType.chargeStandard.id }">
			<div class="control-group">
				<label class="control-label" for="inputDeposit">押金</label>
				<div class="controls">
					<input type="number" class="required" id="inputDeposit" name="chargeStandard.deposit" placeholder="押金（xxx元）..." value="${carType.chargeStandard.deposit }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPremium">保险费</label>
				<div class="controls">
					<input type="number" class="required" id="inputPremium" name="chargeStandard.premium" placeholder="保险费，xxx元/次..." value="${carType.chargeStandard.premium }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputRent">租金</label>
				<div class="controls">
					<input type="number" class="required" id="inputRent" name="chargeStandard.rent" placeholder="租金（xxx元/天）..." value="${carType.chargeStandard.rent }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputMileageLimits">里程限制</label>
				<div class="controls">
					<input type="number" class="required digits" id="inputMileageLimits" name="chargeStandard.mileageLimits" placeholder="里程限制（xxx公里/日）..." value="${carType.chargeStandard.mileageLimits }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputOverMileageFare">超里程费用</label>
				<div class="controls">
					<input type="number" class="required" id="inputOverMileageFare" name="chargeStandard.overMileageFare" placeholder="超里程费用（xxx元/公里）..." value="${carType.chargeStandard.overMileageFare }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputOverTimeFare">超时费用</label>
				<div class="controls">
					<input type="number" class="required" id="inputOverTimeFare" name="chargeStandard.overTimeFare" placeholder="超时费用（xxx元/小时）..." value="${carType.chargeStandard.overTimeFare }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputCarSendFare">上门送车费用</label>
				<div class="controls">
					<input type="number" class="required" id="inputCarSendFare" name="chargeStandard.carSendFare" placeholder="上门送车费用（xxx元）..." value="${carType.chargeStandard.carSendFare }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputDiffShopReturnFare">异店结算附加费</label>
				<div class="controls">
					<input type="number" class="required" id="inputDiffShopReturnFare" name="chargeStandard.diffShopReturnFare" placeholder="异店结算（还车）附加费（xxx元）..." value="${carType.chargeStandard.diffShopReturnFare }">
				</div>
			</div>
			<input type="hidden" name="icon.id" value="${carType.icon.id }">
			<input type="hidden" name="icon.name" value="${carType.icon.name }">
			<input type="hidden" name="icon.md5" value="${carType.icon.md5 }">
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn">修改</button>
				</div>
			</div>
		</form>
	</div>
	<div class="span6">
		<form id="fileUploadForm" class="form-horizontal">
			<ul class="thumbnails">
				<li class="span12">
					<a href="javascript:void(0)" class="thumbnail">
						<img class="img-rounded" src="${carType.icon.url}" alt="">
					</a>
				</li>
			</ul>
			<div  class="control-group">
				<label class="control-label" for="inputPicture">图片上传</label>
				<div class="controls">
					<input type="file" id="inputPicture" name="cachedFile">
					<input type="submit" value="Upload File to Server">
				</div>
			</div>
			<div class="progress progress-striped active">
				<div class="bar"></div >
				<div class="percent">0%</div >
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		// number output format
		$('.digits').formatNumber({format:'#', local:'cn'});
		$('.number').formatNumber({format:'#.00', local:'cn'});
		// validation
		$('#editForm').validate();
		// image upload event
		$('#fileUploadForm').fileUpload(function(data, status, xhr) {
			// add upload file url to submit form
			if(data.data) {
				$('#editForm input[name="icon.name"]').val(data.data.name);
				$('#editForm input[name="icon.md5"]').val(data.data.md5);
			}
		});
		// cartype add page
		$('#editForm').huhuoFormPost(function(data, status) {
			if(data.status == 'SUCCESS') {
				$('#editDivId').hide();
				$('#mgrDivId').show(500);
				$('#huhuoForm').trigger('submit');
			} else {
				$.huhuoGrowlUI('error occur in server --> ' + data.msg);
			}
		});
	});
</script>
