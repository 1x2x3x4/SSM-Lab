<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>
<form method="post" action="">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 我的账号信息</strong></div>
    <table class="table table-hover text-center">
        <tr>
            <th>姓名</th>
            <th>密码</th>
            <th>手机号</th>
            <th>地址</th>
            <th>证件号</th>
            <th>邮箱</th>
            <th>权限阶级</th>
            <th>创建时间</th>
            <th>操作</th>
        </tr>

            <tr>
                <td>user_name</td>
                <td>user_pwd</td>
                <td>mobile</td>
                <td>address</td>
                <td>id_card</td>
                <td>email</td>
                <td>level == 0 销售员 level==1 管理 经理</td>
                <td>add_time</td>
                <td><div class="button-group"> <a class="button border-red" href="#">
                <span class="icon-editor-o" style="height:20px;"></span> 编辑信息</a> </div></td>
            </tr>

      <tr>
        <td colspan="9">links()</td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">
    //搜索
    function changesearch(){
        //获取form表单对象,提交选择项目
        var form1 = document.getElementById("form1");
        form1.submit();//form表单提交
    }

function del(user_id){
	if(confirm("您确定要删除吗?")){
        location.href = '{{url("del_user",["user_id" =>'+'user_id])}}';
	}
}

$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false; 		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

</script>
</body></html>