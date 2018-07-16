<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
	function changePage(p) {
		// 设置页码
		$("#ff input[name=p]").val(p);
		// 提交表单
		$("#ff").submit();
		
	}
	
	$(function() {
		$("#goBtn").click(function() {
			var p =$("#i2").val();
			changePage(p);
		});	
	})
</script>

<a href="javascript:changePage(1)">首页</a>
<a href="javascript:changePage(${page.prev })">上一页</a>
	<c:forEach begin="${page.startPage }" end="${page.endPage }" var="x">
		<a href="javascript:changePage(${x})">
				<font ${x ==page.p ? "color=red" : "" }>${x }</font>
		</a>
	</c:forEach>
<a href="javascript:changePage(${page.next })">下一页</a>
<a href="javascript:changePage(${page.maxPage })">末页</a>

<form style="display:inline;" action="${initParam.p }/${page.controllerName }_find" method="post">
	<input id="i2" style="width:20px;" type="text" name="p" />
	<button id="goBtn" type="button">GO</button>
</form>

<font color="orange" size="5">
	${page.p }
</font>
/
${page.maxPage }

共【${page.rowCount }】条记录