 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<style>
.div1{width:500px;height:100%;border:solid 5px #f00}
.div2{width:400px;height:100%;border:solid 5px #006030;padding-left: 50px;}
</style>
<script src="js/jquery-1.8.3.js"></script>
<body>
<div id="myuserdata" class="div1" user_id="${user.userId}">
<div id="myusernickName">${user_other.nickName}</div>
<div id="myuserintroduction">${user.introduction}</div>
<div id="myuservip">${user.vip}</div>	
<span id="myusertype">${user.type}</span>	
<div id="myuserfollowings">${user.followings}</div>	
<span id="myuserfollowers">${user.followers}</span>	
</div>
<div>
	<input type="button" value="新闻" id="showxin"/><span>1</span>
	<input type="button" value="收藏" id="showfavorite"/><span>0</span>
	<input type="button" value="消息" id="showcomment"/><span>0</span>
</div>
<div id="listcontent"></div>
</body>
<script type="text/javascript">
//	function fornewsList(user_id,num){
//		$.ajax({
//			type:"post",
//			url:"fornewsListByUserIDServlet",
//			context:document.body,
//			dataType:"text",
//			async:false,
//			data:{"user_id":user_id,"num":num},
//			success:function(result){
//				alert(result);
//				return result;	
//			}
//		});
//	}
//	function forfavoriteList(user_id,num){
//		$.ajax({
//			type:"post",
//			url:"forfavoriteListByUserIDServlet",
//			context:document.body,
//			dataType:"text",
//			data:{"user_id":user_id,"num":num},
//			success:function(result){
//				return result;	
//			}
//		});
//	}
//	function forcommentList(user_id,num){
//		$.ajax({
//			type:"post",
//			url:"forcommentListByUserIDServlet",
//			context:document.body,
//			dataType:"text",
//			data:{"user_id":user_id,"num":num},
//			success:function(result){
//				return result;	
//			}
//		});
//	}	
		var usertype = $('#myusertype').text();
		var userid = $('#myuserdata').attr("user_id");
		var num = $('#listcontent').children().length;
		//alert(num);
		if(usertype=="1"){
			$('#myusertype').text("官方验证");
		}else{
			$('#myusertype').text("普通用户");
			$('#showxin').hide();
			$('#showxin').next().hide();
		}
		
			$('#showxin').next().text("1");
			$('#showfavorite').next().text("0");
			$('#showcomment').next().text("0");
			$('#listcontent').empty();
			$.ajax({
				type:"post",
				url:"fornewsListByUserIDServlet",
				context:document.body,
				dataType:"text",
				async:false,
				data:{"user_id":userid,"num":num},
				success:function(result){
					var jsoncomment = JSON.parse(result);
					for(var i=jsoncomment.length-1;i>=0;i--){
					var str = "<div name=\""+jsoncomment[i].newsId+"\" class=\"div2\">"+
					"<div>"+jsoncomment[i].titile+"</div>"+
					"<div>"+jsoncomment[i].nickname+"</div>"+
					"<div>"+jsoncomment[i].content+"</div>"+
					"<div>"+jsoncomment[i].type+"</div>"+
					"<span>"+jsoncomment[i].likes+"</span>"+
					"<span>"+jsoncomment[i].comments+"</span>"+
					"<span>"+jsoncomment[i].favorites+"</span>"+
					"</div>";
					$('#listcontent').append($(str));
				}
			}	
			});
		$('#showxin').click(function(){
		if($('#showxin').next().text()=="0"){
			$('#showxin').next().text("1");
			$('#showfavorite').next().text("0");
			$('#showcomment').next().text("0");
			$('#listcontent').empty();
			$.ajax({
				type:"post",
				url:"fornewsListByUserIDServlet",
				context:document.body,
				dataType:"text",
				async:false,
				data:{"user_id":userid,"num":num},
				success:function(result){
					var jsoncomment = JSON.parse(result);
					for(var i=jsoncomment.length-1;i>=0;i--){
					var str = "<div name=\""+jsoncomment[i].newsId+"\" class=\"div2\">"+
					"<div>"+jsoncomment[i].titile+"</div>"+
					"<div>"+jsoncomment[i].nickname+"</div>"+
					"<div>"+jsoncomment[i].content+"</div>"+
					"<div>"+jsoncomment[i].type+"</div>"+
					"<span>"+jsoncomment[i].likes+"</span>"+
					"<span>"+jsoncomment[i].comments+"</span>"+
					"<span>"+jsoncomment[i].favorites+"</span>"+
					"</div>";
					$('#listcontent').append($(str));
				}
			}	
			});
		}	
		});
		$('#showfavorite').click(function(){
		if($('#showfavorite').next().text()=="0"){
			$('#showxin').next().text("0");
			$('#showfavorite').next().text("1");
			$('#showcomment').next().text("0");
			$('#listcontent').empty();
			$.ajax({
				type:"post",
				url:"forfavoriteListByUserIDServlet",
				context:document.body,
				dataType:"text",
				async:false,
				data:{"user_id":userid,"num":num},
				success:function(result){
					var jsoncomment = JSON.parse(result);
					for(var i=jsoncomment.length-1;i>=0;i--){
					var str = "<div name=\""+jsoncomment[i].newsId+"\" class=\"div2\">"+
					"<div>"+jsoncomment[i].titile+"</div>"+
					"<div>"+jsoncomment[i].nickname+"</div>"+
					"<div>"+jsoncomment[i].content+"</div>"+
					"<div>"+jsoncomment[i].type+"</div>"+
					"<span>"+jsoncomment[i].likes+"</span>"+
					"<span>"+jsoncomment[i].comments+"</span>"+
					"<span>"+jsoncomment[i].favorites+"</span>"+
					"</div>";
					$('#listcontent').append($(str));
				}
			}
			});
		}	
		});
		$('#showcomment').click(function(){
		if($('#showcomment').next().text()=="0"){
			$('#showxin').next().text("0");
			$('#showfavorite').next().text("0");
			$('#showcomment').next().text("1");
			$('#listcontent').empty();
			$.ajax({
				type:"post",
				url:"forcommentListByUserIDServlet",
				context:document.body,
				dataType:"text",
				async:false,
				data:{"user_id":userid,"num":num},
				success:function(result){
					var jsoncomment = JSON.parse(result);
					for(var i=jsoncomment.length-1;i>=0;i--){
						var str = "<div name=\""+jsoncomment[i].commentId+"\" class=\"div2\">"+
						"<div>"+jsoncomment[i].nickName+"</div>"+
						"<div>"+jsoncomment[i].content+"</div>"+
						"<span>"+jsoncomment[i].likes+"</span>"+
						"<span>"+"评论人数为"+jsoncomment[i].reviews+"</span>"+	
						"</div>";
						$('#listcontent').append($(str));
				}
			}	
			});
		}	
		});
		
</script>
</html>